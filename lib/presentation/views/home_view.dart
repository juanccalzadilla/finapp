import 'package:base_app/config/env/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CardHolder(),
          ContactsTransactions(),
        ],
      ),
    );
  }
}

class ContactsTransactions extends StatelessWidget {
  const ContactsTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.sizeOf(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.48,
      minChildSize: 0.48,
      maxChildSize: 0.8,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        height: sizes.height * 0.8,
        width: sizes.width,
        child: Column(children: [
          _Header(
            scrollController: scrollController,
            title: 'Envio rápido',
          ),
          const SizedBox(height: 10),
          _Contacts(scrollController: scrollController),
          _Header(
            scrollController: scrollController,
            title: 'Transacciones recientes',
          ),
          const SizedBox(height: 10),
          _Transactions(scrollController: scrollController),
        ]),
      ),
    );
  }
}

class _Contacts extends StatelessWidget {
  const _Contacts({required this.scrollController});

  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => Column(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'),
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  Text('Juan',
                      style: TextStyle(
                        color: Enviroment().kBlackColor,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              )),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.scrollController, required this.title});

  final ScrollController scrollController;
  final String title;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(title,
            style: textTheme.titleLarge!.copyWith(
              color: Enviroment().kBlackColor,
              fontWeight: FontWeight.w500,
            )),
        const Spacer(),
        Text('Ver todos',
            style: textTheme.titleMedium!.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}

class _Transactions extends StatelessWidget {
  const _Transactions({required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          controller: scrollController,
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                ),
                title: Text('Juan',
                    style: TextStyle(
                      color: Enviroment().kBlackColor,
                      fontWeight: FontWeight.w500,
                    )),
                subtitle: Text('Pago de servicios',
                    style: TextStyle(
                      color: Enviroment().kBlackColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    )),
                trailing: Text('-\$ 100.00',
                    style: TextStyle(
                      color: Enviroment().kBlackColor,
                      fontWeight: FontWeight.w500,
                    )),
              )),
    );
  }
}

class CardHolder extends StatelessWidget {
  const CardHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      height: sizes.height * 0.6,
      width: sizes.width,
      color: Enviroment().kPrimaryColor,
      child: Column(
        children: [
          CreditCardWidget(
            cardNumber: '5450 7879 4864 7854',
            expiryDate: '10/25',
            width: sizes.width,
            labelValidThru: 'Valido\nHasta',
            labelCardHolder: 'Titular',
            isHolderNameVisible: true,
            cardHolderName: 'JUAN CARLOS CALZADILLA',
            obscureCardNumber: true,
            obscureCardCvv: true,
            isChipVisible: true,
            cvvCode: '456',
            cardType: CardType.visa,
            showBackView: false,
            onCreditCardWidgetChange: (p0) {},
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ButtonAction(text: 'Recargar', icon: Iconsax.refresh),
              _ButtonAction(text: 'Transferir', icon: Iconsax.send),
              _ButtonAction(text: 'Pagar', icon: Iconsax.receipt),
              _ButtonAction(text: 'Retirar', icon: Iconsax.arrow_down),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonAction extends StatelessWidget {
  const _ButtonAction({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Enviroment().kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(icon, color: Colors.white, size: 20)),
        const SizedBox(height: 10),
        Text(text, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
