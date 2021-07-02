import 'dart:html';

import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;

var CoolWidget = react.registerComponent2(() => CoolWidgetComponent());

class CoolWidgetComponent extends react.Component2 {
  @override
  dynamic render() {
    return react.div({
      'className': 'main-widget',
      'style': {'border': '2px solid black', 'textAlign': 'center'}
    }, react.p({}, '${props['text']}  --->  ${props['name']}'));
  }
}

void main(List<String> args) {
  react_dom.render(
      CoolWidget({'text': 'Hello', 'name': 'Users'}), querySelector('#app'));
}
