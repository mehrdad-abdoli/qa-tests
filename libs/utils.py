from robot.libraries.BuiltIn import BuiltIn
class utils:

    def __init__(self):
        self.selenium = BuiltIn().get_library_instance('SeleniumLibrary')

    def element_css_attribute_should_be(self, locator, prop, expected):
        """Verifies the element identified by `locator` has the expected"""
        element = self.selenium.find_element(locator)
        value = element.value_of_css_property(prop)
        if value != expected:
            raise AssertionError(
                "Element locator '%s' css property '%s' had a value of '%s' while it should have been '%s'" % (locator, prop, value, expected))


    def hex_to_rgba(self, value):
        hex = value.lstrip('#')
        if len(hex) == 3:
            hexvalue = str()
            for char in hex:
                hexvalue += char + char
            hex = hexvalue
        rgba = list(int(hex[i:i+2], 16) for i in (0, 2, 4))
        rgba.append(1)
        return 'rgba' + str(tuple(rgba))

    def hex_to_rgb(self, value):
        hex = value.lstrip('#')
        if len(hex) == 3:
            hexvalue = str()
            for char in hex:
                hexvalue += char + char
            hex = hexvalue
        rgb = list(int(hex[i:i+2], 16) for i in (0, 2, 4))
        return 'rgb' + str(tuple(rgb))

    def rgb_to_hex(self, rgba):
        rgba.pop()
        return '#%02x%02x%02x' % (rgba[0], rgba[1], rgba[2])
