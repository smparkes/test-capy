try {
  throw new Error("foo");
} catch(e) {
  print("e");
  print(escape(e.stack));
  print(e.stack.constructor+"");
}