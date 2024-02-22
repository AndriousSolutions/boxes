# Boxes


<a id="counterHighlight" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/53ec0d02-baa5-4d91-b8b8-acd04150bf30"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/53ec0d02-baa5-4d91-b8b8-acd04150bf30" width="171" height="357"></a>
## Little Boxes
This package wraps Flutter's standard UI widgets in its 'box' widget equivalent.
Each such widget has an accompanying 'controller' class object
that indeed controls the enclosed widget to a great degree.
Such an arrangement has the visual characteristics of your app's widgets specified by
a separate class other than the traditional StatelessWidget or the StatefulWidget/State combination.
It can be a class, for example, not hindered by the Dart language's 'immutable' requirements, 
and frankly can be a class controlling any number of such widgets. 

Simply put, this is for projects requiring more immediate and more dynamic manipulation of 
an assortment of widget if not all the widgets that make up an app's user interface.
However, it is to do so in an efficient manner so not to hinder overall performance.
In the screenshot to your right, only the counter highlighted is ever rebuilt with every button press.
As you know, in the original counter example app, 
the whole screen is rebuilt with the <b>setState</b>() function call.
Image now most production apps with dozens of widgets making up their interface.
You're pressed to make such an app more efficient, 
and using this package will be one way to do so.

<a id="counterHighlight" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/a6dc172c-55ee-45b8-8f78-cd28103710f8"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/a6dc172c-55ee-45b8-8f78-cd28103710f8" width="171" height="357"></a>
The video to your right further reveals the real potential available to you when using this package. 
Again, a very very simple example app, but image a more realistic application with 
separate processes running on the interface spontaneously changing the appearance of individual UI components.
In the video, you can see the count of 1 is dynamically changing in font.
Now note, the whole screen is not being repainted.
That would be wholly inefficient with the font changing every 3 seconds.
No, only the count is being rebuilt.
Each rebuild of a wrapped Text widget is readily being assigned a new font.
It's font being only one of fifteen properties in a Text widget you can 
readily manipulate and change at runtime.

You see, each 'box' widget in this package utilizes an InheritedWidget 
making for more targeted more efficient rebuilds. Doing so allows those enclosed widgets
to be spontaneously rebuild without affecting the rest of the user interface.
It's being done in a separate controller class which means
we could then later include the spontaneous rebuild and change of that counter's color, 
its size, or what have you---all without changing one stitch of the code on the interface side. 
A very powerful capability.

## Delegate Control

Let's continue to examine this example app as it does come with this package.
Note, the 'business logic' involved in this very simple app has been encapsulated into one class.
The class representing the 'business end' of this app is named same
(See the first screenshot below). 
Such delegation is good practice encouraging clean architecture.
At a glance, you can tell we're viewing below the code responsible for the app's interface 
and that the one class object called, _**logic**_, appears solely concerned with the 'business rules' and 'event handling'. 
However, appearances can be deceiving.
You use this package if you want to retain a little more control over the 'look and feel' of
those widgets representing the interface.
In the second screenshot, the class object responsible for the overall logic of the app 
is also being passed to the widget, _TextBox_. That line should be of particular interest to you:
<br />
`TextBox(controller: logic);`

<div>
<a id="BusinessEnd" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/9c18bc95-c5a4-4f38-83d2-3276bd1db2bd"><img src="https://github.com/AndriousSolutions/boxes/assets/32497443/9c18bc95-c5a4-4f38-83d2-3276bd1db2bd" width="48%" height="60%"></a>
<a id="LogicCounter" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/7827d347-fb04-4b88-8b3d-ef5af2627375"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/7827d347-fb04-4b88-8b3d-ef5af2627375" width="48%" height="60%"></a>
</div>

## When Control is Paramount

Taking the time to examine Flutter's Text widget, 
you'll see the required String object passed to it is received by a positional parameter named, _**data**_. 
Further, to define a particular presentational style,
you would pass a _TextStyle_ object to a Text widget through its named parameter, _**style**_.
Well, when using the boxes package in this particular example app,
you can do the very same thing using the specified controller, _**logic**_.
I'll show you.

In the first screenshot below,
we see the BusinessEnd class utilizes the mixin, _**TextFieldsBoxMixin**_.
This mixin merely lists all the property fields currently found in the Text widget.
When applied to a class, you're free to assign the appropriate values to these properties
as you see in the second screenshot below. 
In this example app, the getter, _**data**_, is responsible for displaying the current count
, and the getter, _**style**_, assigns the appropriate appearance to the Text widget itself.
The TextBox class brings this all together.

<div>
<a id="TextFieldsBoxMixin" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/895bbeee-ee2d-43b3-a95e-d042e860fc86"><img src="https://github.com/AndriousSolutions/boxes/assets/32497443/895bbeee-ee2d-43b3-a95e-d042e860fc86" width="48%" height="60%"></a>
<a id="getStyle" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/fb96ee8b-a095-4755-937c-52aa6ab00b51"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/fb96ee8b-a095-4755-937c-52aa6ab00b51" width="48%" height="60%"></a>
</div>

A quick glance at the first screenshot below, 
you can see the mixin, _**TextFieldsBoxMixin**_, does list the fields found in a Text widget.
The second screenshot is that of the TextBox widget itself.
There, the enclosed Text widget is supplied its many property values by the provided controller if any.

<div>
<a id="TextFieldsBoxMixin" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/70feff20-8fbc-40ad-8946-6e94a4f34364"><img src="https://github.com/AndriousSolutions/boxes/assets/32497443/70feff20-8fbc-40ad-8946-6e94a4f34364" width="48%" height="60%"></a>
<a id="wrappedTextWidget" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/adccd8cb-cd3a-4174-b5b9-8b324bf582f6"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/adccd8cb-cd3a-4174-b5b9-8b324bf582f6" width="48%" height="60%"></a>
</div>

## All Made of Boxes

Let's step back and examine the example app as a whole.
All the 'box' widgets used in this simple little app are highlighted in the two screenshots below. 
Note, these UI widgets are not characterized with a long list of named parameters taking in values.
Each is instead assigned a 'controller' class.
It is this class object that specifies its widget's attributes and properties,
and, in fact, allows for the targeted rebuilds of their associated widgets with the use of InheritedWidgets.
In the first screenshot, you see the MaterialApp widget is wrapped by the MaterialAppBox widget.
In the second screenshot, the Scaffold widget, the AppBar widget, both the Center and Column widget,
and finally the Text widget all have their 'box' widget counterpart instead utilized in this app.
What's the big advantage to all this, you ask? You'll further realize shortly viewing the video below.
<div>
<a id="materialAppBox" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/794eab83-88a4-4450-b4db-657cd8ee6d19"><img src="https://github.com/AndriousSolutions/boxes/assets/32497443/794eab83-88a4-4450-b4db-657cd8ee6d19" width="48%" height="60%"></a>
<a id="ScaffoldBox" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/8eab5fc6-4c75-4370-a44f-b2ef6d9c7857"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/8eab5fc6-4c75-4370-a44f-b2ef6d9c7857" width="48%" height="60%"></a>
</div>

Looking at the Scaffold and AppBar controllers respectively (see below), 
each uses the appropriate mixin so to access the fields defined in their respective widgets.
Both also use the mixin called, _**InheritedWidgetBoxMixin**_.
You can guess correctly it is this mixin that involves an InheritedWidget allowing for those efficient rebuilds.

<div>
<a id="ScaffoldController" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/a2870fe2-d617-4645-befc-85aa785cb8a9"><img src="https://github.com/AndriousSolutions/boxes/assets/32497443/a2870fe2-d617-4645-befc-85aa785cb8a9" width="48%" height="60%"></a>
<a id="AppBarController" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/32592d97-5869-43b1-8974-98a81c8885de"><img align="right" src="https://github.com/AndriousSolutions/boxes/assets/32497443/32592d97-5869-43b1-8974-98a81c8885de" width="48%" height="60%"></a>
</div>
<a id="counterApp" target="_blank" rel="noopener noreferrer" href="https://github.com/AndriousSolutions/boxes/assets/32497443/5cdb0353-6445-47a6-a775-1c567de90d51"><img src="https://github.com/AndriousSolutions/boxes/assets/32497443/5cdb0353-6445-47a6-a775-1c567de90d51" width="171" height="357"></a>
Examine the video closely. Tap on it to get a separate window and zoom in on what's going on there.
