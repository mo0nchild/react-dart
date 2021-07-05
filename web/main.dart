import 'dart:html';
import 'dart:js' as js;

import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;

var CoolWidget = react.registerComponent2(() => CoolWidgetComponent());

Map<String, dynamic> Styles({border, borderRadius, color, margin, textAlign}) =>
    {
      'border': border,
      'textAlign': textAlign,
      'color': color,
      'borderRadius': borderRadius,
      'margin': margin
    };

Map<dynamic, dynamic> styles = {
  'button':
      Styles(border: '2px solid purple', margin: '1rem', borderRadius: '10px'),
  'div': Styles(
      border: '2px solid black',
      borderRadius: '30px',
      color: 'purple',
      textAlign: 'center',
      margin: '2rem 10rem')
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
