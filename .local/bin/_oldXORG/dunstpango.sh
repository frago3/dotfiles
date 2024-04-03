#!/bin/bash


# <span> attributes
#
# font_family     A font family name such as "normal", "sans", "serif" or "monospace".
# face            A synonym for font_family
# style           The slant style - one of 'normal', 'oblique', or 'italic'
# weight          The font weight - one of 'ultralight', 'light', 'normal', 'bold', 'ultrabold', 'heavy', or a numeric weight.
# variant         The font variant - either 'normal' or 'smallcaps'.
# foreground      An RGB color specification such as '#00FF00' or a color name such as 'red'.
# background      An RGB color specification such as '#00FF00' or a color name such as 'red'.
# underline       The underline style - one of 'single', 'double', 'low', or 'none'.
# strikethrough   'true' or 'false' whether to strike through the text.

# b       Make the text bold.
# big     Makes font relatively larger, equivalent to <span size="larger">.
# i       Make the text italic.
# s       Strikethrough the text.
# sub     Subscript the text.
# sup     Superscript the text.
# small   Makes font relatively smaller, equivalent to <span size="smaller">.
# tt      Use a monospace font.
# u       Underline the text.

# <b>bold</b>
# <i>italic</i>
# <s>strikethrough</s>
# <u>underline</u>

format_a(){
    echo "<span foreground='darkgrey' strikethrough='true'>$1<\/span>"
}

format_b() {
    echo "<span foreground='black' background='white'>$1<\/span>"
}

