import 'dart:html';

import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;

var CoolWidget = react.registerComponent2(() => CoolWidgetComponent());

Map<dynamic, dynamic> styles = {
  'button': {
    'border': '2px solid purple',
    'borderRadius': '10px',
    'margin': '1rem'
  },
  'div': {
    'border': '2px solid black',
    'textAlign': 'center',
    'color': 'purple',
    'borderRadius': '20px',
    'margin': '1rem 1rem'
  }
};

class CoolWidgetComponent extends react.Component2 {
  bool State = false;

  void updateText(bool newVal) {
    State = newVal;
    forceUpdate();
  }

  @override
  dynamic render() {
    return react.div({
      'className': 'main-widget',
      'style': styles['div']
    }, [
      react.p({'key': '1'}, '${props['text']}  --->  ${props['name']}'),
      react.h1({'key': '2'}, 'Hello Users!'),
      react.button({
        'key': '3',
        'onClick': (_) => updateText(!State),
        'style': styles['button']
      }, State.toString())
    ]);
  }
}

void main(List<String> args) {
  react_dom.render(
      CoolWidget({'text': 'Hello', 'name': 'Users'}), querySelector('#app'));
}
