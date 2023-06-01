extends Control

const plugin_name = "AndroidGodotPluginTemplate"

onready var label = get_node("%Label")

var plugin

func _ready():
    if Engine.has_singleton(plugin_name):
        plugin = Engine.get_singleton(plugin_name)
        plugin.connect("wake_up", self, "_on_wake_up")
        plugin.connect("wake_up2", self, "_on_wake_up2")
        label.text = plugin.getHelloWorldNative()
    else:
        label.text = "Plugin not loaded."
        print("Plugin not loaded.")

func _on_wake_up():
    label.text = "wake_up"

func _on_wake_up2(time):
    label.text = "wake_up at %s" % time

func _on_button_pressed():
    print("_on_button_pressed")
    plugin.signalTest()

func _on_button2_pressed():
    print("_on_button_2_pressed")
    plugin.signalTest2()
