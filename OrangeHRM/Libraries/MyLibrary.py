def transform_RGBA_to_HEX(rgba):
    rgba = eval(rgba[4:])
    color_hex = "#{:02x}{:02x}{:02x}".format(*rgba)
    return color_hex