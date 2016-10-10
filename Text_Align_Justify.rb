#Text align justify
#https://www.codewars.com/kata/537e18b6147aa838f600001b/train/ruby
#https://www.codewars.com/kata/text-align-justify/solutions?show-solutions=1
def justify(text, width)
    line = text.length/width
    result = []
    0.upto(line-1) do |i|
      if text[width-1] == " "
        result << text[i*width..(i+1)*width-2]+"\n"
      else
        result << text[i*width..(i+1)*width-1]+"\n"
      end
    end
    if text.length % width != 0
      result << text[line*width..-1]
    end
    result.join
end

p justify('123 45 6', 7)
# p justify("Lorem  ipsum  dolor  sit amet,
# consectetur  adipiscing  elit.
# Vestibulum    sagittis   dolor
# mauris,  at  elementum  ligula
# tempor  eget.  In quis rhoncus
# nunc,  at  aliquet orci. Fusce
# at   dolor   sit   amet  felis
# suscipit   tristique.   Nam  a
# imperdiet   tellus.  Nulla  eu
# vestibulum    urna.    Vivamus
# tincidunt  suscipit  enim, nec
# ultrices   nisi  volutpat  ac.
# Maecenas   sit   amet  lacinia
# arcu,  non dictum justo. Donec
# sed  quam  vel  risus faucibus
# euismod.  Suspendisse  rhoncus
# rhoncus  felis  at  fermentum.
# Donec lorem magna, ultricies a
# nunc    sit    amet,   blandit
# fringilla  nunc. In vestibulum
# velit    ac    felis   rhoncus
# pellentesque. Mauris at tellus
# enim.  Aliquam eleifend tempus
# dapibus. Pellentesque commodo,
# nisi    sit   amet   hendrerit
# fringilla,   ante  odio  porta
# lacus,   ut   elementum  justo
# nulla et dolor.",80)
=begin
Lorem  ipsum  dolor  sit amet,
consectetur  adipiscing  elit.
Vestibulum    sagittis   dolor
mauris,  at  elementum  ligula
tempor  eget.  In quis rhoncus
nunc,  at  aliquet orci. Fusce
at   dolor   sit   amet  felis
suscipit   tristique.   Nam  a
imperdiet   tellus.  Nulla  eu
vestibulum    urna.    Vivamus
tincidunt  suscipit  enim, nec
ultrices   nisi  volutpat  ac.
Maecenas   sit   amet  lacinia
arcu,  non dictum justo. Donec
sed  quam  vel  risus faucibus
euismod.  Suspendisse  rhoncus
rhoncus  felis  at  fermentum.
Donec lorem magna, ultricies a
nunc    sit    amet,   blandit
fringilla  nunc. In vestibulum
velit    ac    felis   rhoncus
pellentesque. Mauris at tellus
enim.  Aliquam eleifend tempus
dapibus. Pellentesque commodo,
nisi    sit   amet   hendrerit
fringilla,   ante  odio  porta
lacus,   ut   elementum  justo
nulla et dolor.
=end
