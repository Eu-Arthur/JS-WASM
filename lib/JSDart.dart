import 'package:js/js.dart';
import 'package:js_wasm/JSCSS2Properties.dart';
import 'dart:typed_data';

@JS("EventTarget")
@staticInterop
class JSEventTarget {}

extension JSEventTargetExtension on JSEventTarget {
  external void addEventListener(String type, Function listener);

  external void removeEventListener(String type, Function listener);

  external bool dispatchEvent(JSEvent event);
}

@JS("localStorage")
@staticInterop
class JSLocalStorage {}

extension JSLocalStorageExtension on JSLocalStorage {
  external String? getItem(String key);

  external void setItem(String key, String value);

  external void removeItem(String key);

  external int get length;

  external String? key(int index);

  external void clear();

  bool containsKey(String key) => getItem(key) != null;
}

@JS("CryptoKey")
@staticInterop
class JSCryptoKey {}

extension JSCryptoKeyExtension on JSCryptoKey {
  external Object? get algorithm;

  external bool? get extractable;

  external String? get type;

  external Object? get usages;
}

@JS()
@staticInterop
class JSCrypto {}

extension JSCryptoExtension on JSCrypto {
  external TypedData getRandomValues(List<int> array);
}

@JS("Node")
@staticInterop
class JSNode extends JSEventTarget {}

@JS("Node")
@staticInterop
extension JSNodeExtension on JSNode {
  external String get nodeName;

  external String get nodeValue;

  external JSNode get parentNode;

  external JSNode get firstChild;

  external JSNode get nextSibling;

  external JSNode get lastChild;

  external JSNode get previousSibling;

  external JSDocument get ownerDocument;

  external String get textContent;

  external List<JSElement> querySelectorAll(String selector);

  external void appendChild(JSNode node);
}

@JS("Document")
@staticInterop
class JSDocument extends JSNode {}

extension JSDocumentExtension on JSDocument {
  external JSNode createElement(String tag);

  external JSNode getElementById(String id);

  external JSNode get body;
}

@JS("HtmlImageElement")
@staticInterop
class JSHTMLInputElement extends JSHTMLElement {}

extension JSHTMLInputElementExtension on JSHTMLElement {
  external List<JSNode> get labels;

  external bool get multiple;

  external set multiple(bool value);

  external set accept(String? value);

  external List<JSFile> get files;
}

@JS("Event")
@staticInterop
class JSEvent {
  external factory JSEvent(String type, [Map? eventInitDict]);
}

@JS("Event")
@staticInterop
extension JSEventExtension on JSEvent {
  external JSNode get target;

  external preventDefault();
}

@JS("Geoposition")
@staticInterop
class JSGeoPosition {}

extension JSGeoPositionExtension on JSGeoPosition {
  external JSGeolocationCoordinates? coords;
  external int? timestamp;
}

@JS()
@anonymous
class JSGeolocationOptions {
  external factory JSGeolocationOptions({
    int maximumAge = 0,
    int timeout = 9999999,
    bool enableHighAccuracy = false,
  });
}

@JS("Geolocation")
@staticInterop
class JSGeolocation {}

extension JSGeolocationExtension on JSGeolocation {
  external void getCurrentPosition(
    Function(JSGeoPosition) success,
    Function(JSGeolocationPositionError)? error,
    JSGeolocationOptions? options,
  );

  external int watchPosition(Function(JSGeoPosition) success,
      Function(JSGeolocationPositionError)? error,
      JSGeolocationOptions? options,);
}


@JS("GeolocationPositionError")
@staticInterop
class JSGeolocationPositionError {}

extension GeolocationPositionErrorExtension on JSGeolocationPositionError {
  external String get message;

  external int get code;
}

@JS("Coordinates")
@staticInterop
class JSGeolocationCoordinates {}

extension JSGeolocationCoordinatesExtension on JSGeolocationCoordinates {
  external double? latitude;
  external double? longitude;
  external double? altitude;
  external double? accuracy;
  external double? altitudeAccuracy;
  external double? heading;
  external double? speed;
}

@JS()
@anonymous
class PermissionDescriptor {
  external factory PermissionDescriptor(
      {String name, bool userVisibleOnly = false, bool sysex = false});
}

@JS("Promise")
@staticInterop
class JSPromise {}

extension JSPromiseExtension on JSPromise {
  external String state;
}

@JS("Navigator")
@staticInterop
class JSNavigator {}

extension JSNavigatorExtension on JSNavigator {
  external String get userAgent;

  external String get platform;

  external String get appName;

  external String get appVersion;

  external String get vendor;

  external JSGeolocation get geolocation;

  external JSPermissions get permissions;
}

@JS("Permissions")
@staticInterop
class JSPermissions {}

extension JSPermissionsExtension on JSPermissions {
  external JSPromise query(PermissionDescriptor permissionDescriptor);
}

@JS("Window")
@staticInterop
class JSWindow extends JSEventTarget {}

extension JSWindowExtension on JSWindow {
  external JSNavigator get navigator;

  external JSLocation get location;

  external JSLocalStorage get localStorage;

  external JSCrypto get crypto;

  external JSWindow open(String url, String target, String windowFeatures);
}

@JS("MouseEvent")
@staticInterop
class JSMouseEvent extends JSEvent {
  external factory JSMouseEvent(String type, [Map? eventInitDict]);
}

extension JSMouseEventExtension on JSMouseEvent {
  external JSNode get target;
}

@JS("Element")
@staticInterop
class JSElement extends JSNode {}

extension JSElementExtension on JSElement {
  external List<JSElement> get children;

  external String get id;

  external void set id(String value);

  external String get tagName;

  external List<String> get attributes;

  external JSShadowRoot? get shadowRoot;

  external void setAttribute(String name, String value);

  external String getAttribute(String name);

  external bool hasAttribute(String name);

  external void removeAttribute(String name);

  external void remove();

  external void click();

  external void append(JSNode node);

  external void after(JSNode node);

  external void before(JSNode node);
}

@JS("DocumentFragment")
@staticInterop
class JSDocumentFragment extends JSNode {}

extension JSDocumentFragmentExtension on JSDocumentFragment {
  external List<JSElement> get children;

  external JSElement get firstElementChild;

  external JSElement get lastElementChild;

  external int get childElementCount;
}

@JS("ShadowRoot")
@staticInterop
class JSShadowRoot extends JSDocumentFragment {}

extension JSShadowRootExtension on JSShadowRoot {
  external JSElement? get host;
}

@JS("HTMLElement")
@staticInterop
class JSHTMLElement extends JSElement {}

extension JSHTMLElementExtension on JSHTMLElement {
  external set draggable(bool newValue);

  external JSCSS2Properties get style;

  external set style(JSCSS2Properties newValue);
}

@JS("Blob")
@staticInterop
class JsBlob {}

extension JsBlobExtension on JsBlob {
  external JsBlob slice(int start, int end);

  external int get size;
}

@JS("HTMLCanvasElement")
@staticInterop
class JSHTMLCanvasElement extends JSHTMLElement {}

extension JSHTMLCanvasElementExtension on JSHTMLCanvasElement {
  external JSCanvasRenderingContext2D getContext(String contextId,
      [Map? options]);

  external int get width;

  external set width(int value);

  external int get height;

  external set height(int value);

  JSCanvasRenderingContext2D getCanvas2DContext() {
    return getContext('2d');
  }

  external void toBlob(Function(JsBlob) callback, String type, double quality);

  Future<JsBlob> getBlob(String type, double quality) async {
    JsBlob? blob = null;
    toBlob((JsBlob pBlob) {
      blob = pBlob;
    }, type, quality);

    return await Future.value(blob);
  }
}

@JS('File')
@staticInterop
class JSFile extends JsBlob {
  external factory JSFile(List<dynamic> fileBits, String fileName,
      [Map? options]);
}

extension JSFileExtension on JSFile {
  external String get name;

  external int get size;

  external String get type;

  external int? get lastModified;
}

@JS('Url')
@staticInterop
class JSUrl {}

extension JSUrlExtension on JSUrl {
  external String get name;

  external int get size;
}

@JS("CanvasRenderingContext2D")
@staticInterop
class JSCanvasRenderingContext2D {}

extension JSCanvasRenderingContext2DExtension on JSCanvasRenderingContext2D {
  external void drawImage(JSHtmlImageElement image, num dx, num dy,
      [num? dw, num? dh]);

  @JS('drawImage')
  external void drawImageScaled(JSHtmlImageElement source, num destX, num destY,
      num destWidth, num destHeight);

  external JSHTMLCanvasElement get canvas;

  external String? get direction;

  external set direction(String? value);

  external Object? get fillStyle;

  external set fillStyle(Object? value);

  external String? get filter;

  external set filter(String? value);

  external String get font;

  external set font(String value);

  external num get globalAlpha;

  external set globalAlpha(num value);

  external String get globalCompositeOperation;

  external set globalCompositeOperation(String value);

  /**
   * Whether images and patterns on this canvas will be smoothed when this
   * canvas is scaled.
   *
   * ## Other resources
   *
   * * [Image
   *   smoothing](https://html.spec.whatwg.org/multipage/scripting.html#image-smoothing)
   *   from WHATWG.
   */

  external bool? get imageSmoothingEnabled;

  external set imageSmoothingEnabled(bool? value);

  external String? get imageSmoothingQuality;

  external set imageSmoothingQuality(String? value);

  external String get lineCap;

  external set lineCap(String value);

  external String get lineJoin;

  external set lineJoin(String value);

  external num get lineWidth;

  external set lineWidth(num value);

  external num get miterLimit;

  external set miterLimit(num value);

  external num get shadowBlur;

  external set shadowBlur(num value);

  external String get shadowColor;

  external set shadowColor(String value);

  external num get shadowOffsetX;

  external set shadowOffsetX(num value);

  external num get shadowOffsetY;

  external set shadowOffsetY(num value);

  external Object? get strokeStyle;

  external set strokeStyle(Object? value);

  external String get textAlign;

  external set textAlign(String value);

  external String get textBaseline;

  external set textBaseline(String value);
}

@JS("HTMLImageElement")
@staticInterop
class JSHtmlImageElement extends JSHTMLElement {}

extension JSHtmlImageElementExtension on JSHtmlImageElement {
  external String? get alt;

  external set alt(String? value);

  external String? get async;

  external set async(String? value);

  external bool? get complete;

  external String? get crossOrigin;

  external set crossOrigin(String? value);

  external String? get currentSrc;

  external int? get height;

  external set height(int? value);

  external bool? get isMap;

  external set isMap(bool? value);

  external int get naturalHeight;

  external int get naturalWidth;

  external String? get referrerPolicy;

  external set referrerPolicy(String? value);

  external String? get sizes;

  external set sizes(String? value);

  external String? get src;

  external set src(String? value);

  external String? get srcset;

  external set srcset(String? value);

  external String? get useMap;

  external set useMap(String? value);

  external int? get width;

  external set width(int? value);
}

@JS("Location")
@staticInterop
class JSLocation {}

extension JSLocationExtension on JSLocation {
  external String get href;

  external String get protocol;

  external String get host;
}

@JS('window.location')
external JSLocation getLocation();

@JS('URL.createObjectURL')
external String createObjectUrlFromBlob(Object obj);

@JS('URL.createObjectURL')
external String createObjectUrl(Object obj);

@JS("window.URL.revokeObjectURL")
external void revokeObjectUrl(String url);

@JS('document.createElement')
external JSElement createElement(Object obj);

@JS("document.querySelector")
external JSElement? querySelector(String obj);

@JS("document.querySelectorAll")
external List<JSElement> querySelectorAll(String obj);

@JS('window.atob')
external String atob(String obj);

@JS('window')
external JSWindow get window;

@JS("window.addEventListener")
external void addEventListener(String event, Function callback);

JSHtmlImageElement createImage() {
  return createElement('img') as JSHtmlImageElement;
}

JSHTMLCanvasElement createCanvas() {
  return createElement('canvas') as JSHTMLCanvasElement;
}

JSHTMLInputElement createInput() {
  return createElement('input') as JSHTMLInputElement;
}
