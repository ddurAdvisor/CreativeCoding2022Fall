Week04: Image and Pixel process



## image load, access and creation

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_01_image.png)
- 控制几何对象分布
- 几何对象基于其定位点坐标从参考图像中获取填充颜色
``` java
for (int i = 0; i< 50; i ++) {
    int xx = (int)random(width);
    int yy = (int)random(height);
    color fc = img.get(xx, yy);
    fill(fc);
    noStroke();
    rotate(random(TWO_PI));
    rect(xx, yy, 5, 50);
  }
```
- [bit2atom_20211018_01_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_01_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_02_image.png)

- [bit2atom_20211018_02_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_02_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_03_image.png)

- [bit2atom_20211018_03_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_03_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_05_image.png)

- [bit2atom_20211018_05_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_05_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_06_image.png)

- [bit2atom_20211018_06_image.png)](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_06_image)




## image process

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_01_pimage.png)

- [image_01_pimage](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_01_pimage)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_02_tint.png)

- [image_02_tint](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_02_tint)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_03_notint.png)

- [image_03_notint](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_03_notint)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_04_img_sequence.png)

- [image_04_img_sequence](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_04_img_sequence)

![image_04_img_sequence_highway_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_04_img_sequence_highway_2.png)

- [image_04_img_sequence_highway_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_04_img_sequence_highway_2)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_05_get.png)

- [image_05_get](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_05_get)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_06_get_pointilism.png)

- [image_06_get_pointilism](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_06_get_pointillism)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_07_get_pixels.png)

- [image_07_get_pixels](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_07_get_pixels)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_09_blend_shape.png)

- [image_09_blend_shape](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_09_blend_shape)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_108_filter.png)

- [image_108_filter](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_08_filter)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_10_blend_images.png)

- [image_10_blend_images](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_10_blend_images)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_11_masking.png)

- [image_11_masking](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_11_masking)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_12_rgb.png)

- [image_12_rgb](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_12_rgb)



## pixel process

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/crystalPixels.png)

- [crystalPixels](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/crystalPixels)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/crystalPixels_v2.png)

- [rystalPixels_v2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/crystalPixels_v2)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/imageColor_Abstraction_and_Sorting_v3.png)

- [imageColor_Abstraction_and_Sorting_v3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/imageColor_Abstraction_and_Sorting_v3)



## pixel process and creative presentation A

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/HodgingFiguration.png)

- [HodgingFiguration](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/HodginFiguration)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/particleScattering_portrait_v32b.png)

- [particleScattering_portrait_v32b](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/particleScattering_Portrait_v32b)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/textDrawArtTool.png)

- [textDrawArtTool](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/TextDraw_Alpha05_FontFree_NewInterface_LiqunZhang)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/pix2patterns.png)

- [pix2patterns](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/pix2Patterns)



## pixel process and creative presentation B: from pixles to vectors

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/paintingWithFlowField.png)

- [paintingWithFlowField](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/paintingWithFlowField)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/noiseBrushStyle2.png)

- [noiseBrushStyle2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/noiseBrushStyle2)
