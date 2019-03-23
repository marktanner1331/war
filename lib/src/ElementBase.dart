class ElementBase {
  int _health = 0;
  int get health => _health;
  set health(int value) {
    _health = value;
  }

  ElementBase(int health) {
    this._health = health;
  }
}