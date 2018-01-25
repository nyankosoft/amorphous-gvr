# amorphous-gvr

An attempt to adapt amorphous for mobile VR app development on Android platform.
The basic idea is that amorphous will incorporate [Google VR SDK](https://github.com/googlevr/gvr-android-sdk) and make use of its APIs for low-level VR app settings.
The framework defines a new application base class for VR.
Then, when I make a new application, I do so via amorphous APIs and do not have to heavily engage with VR-specific code.
For example, rendering the scene twice for left and right eyes will be taken care of by the new application base class. After editing and debugging for a while, I manage to render a simple scene on my Android phone. I'll see how it goes from here.
