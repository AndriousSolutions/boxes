// class GroupValue<E> {
//   GroupValue(this.groupValue, this.func) {
//     // Retrieve the most recent SetState object instantiated.
//     state = StateSet.root!;
//   }
//   E groupValue;
//   final void Function(E v) func;
//   late StateSet state;
//
//   //ignore: INVALID_USE_OF_PROTECTED_MEMBER
//   void onChanged<T>(T v) => state.setState(() {
// //        final value = v as E;
//     if (v is E) {
//       groupValue = v;
//       func(v);
//     }
//   });
// }
