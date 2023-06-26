## Add UTI custom board configurations for Android
* Launch an userdebug build
```
source build/envsetup.sh
lunch uti_8mn-userdebug
```

* Change layout in imx8m/evk_8mn/evk_8mn.mk
```
PRODUCT_AAPT_CONFIG += ldpi mdpi hdpi xhdpi
```


