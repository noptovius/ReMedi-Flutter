

class BlocManager {
  Map<dynamic, dynamic> manager = {};

  BlocManager() {
//    register(UserBloc, userBloc);
  }

  register(name, object) {
    manager[name] = object;
  }

  fetch(name) => manager[name];
}
