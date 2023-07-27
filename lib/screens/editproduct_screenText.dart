import 'package:flutter/material.dart';
import 'package:flutter_application_5/providers/product.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class EditeProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  const EditeProductScreen({super.key});

  @override
  State<EditeProductScreen> createState() => _EditeScreenState();
}

class _EditeScreenState extends State<EditeProductScreen> {
  final focis = FocusNode();
  final dexfocis = FocusNode();
  final _imageUrlcontroller = TextEditingController();
  final _imageurlfocus = FocusNode();
  final _form = GlobalKey<FormState>();
  var editproduct =
      Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  var _initvalue = {'title': '', 'price': '', 'description': '', 'image': ''};

  var _isInit = true;

  @override
  void initState() {
    _imageurlfocus.addListener(_updateImage);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final ProductId = ModalRoute.of(context)!.settings.arguments;
      if (ProductId != null) {
        editproduct = Provider.of<Products>(context, listen: false)
            .findById(ProductId.toString());
        _initvalue = {
          'title': editproduct.title,
          'price': editproduct.price.toString(),
          'description': editproduct.description,
          'image': editproduct.imageUrl
        };

        _imageUrlcontroller.text = editproduct.imageUrl;
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focis.dispose();
    dexfocis.dispose();
    _imageurlfocus.removeListener(_updateImage);
    _imageUrlcontroller.dispose();
    _imageurlfocus.dispose();
    super.dispose();
  }

  void _updateImage() {
    if (!_imageurlfocus.hasFocus) {
      if (_imageUrlcontroller.text.isEmpty ||
          (!_imageUrlcontroller.text.startsWith('http') &&
              !_imageUrlcontroller.text.startsWith('https')) ||
          (!_imageUrlcontroller.text.endsWith('.jpg') &&
              !_imageUrlcontroller.text.endsWith('.png') &&
              !_imageUrlcontroller.text.startsWith('.jpeg'))) {
        return;
      }

      setState(() {});
    }
  }

  void _saveForm() {
    var isvali = _form.currentState!.validate();
    if (!isvali) {
      return;
    }
    _form.currentState!.save();
    final prod = Provider.of<Products>(context, listen: false);
    if (editproduct.id != '') {
     prod.updateProduct(editproduct.id, editproduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(editproduct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title product'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'title',
                  ),
                  initialValue: _initvalue['title'],
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(focis);
                  },
                  onSaved: (value) {
                    editproduct = Product(
                        title: '${value}',
                        description: '${editproduct.description}',
                        price: editproduct.price,
                        imageUrl: '${editproduct.imageUrl}',
                        id: editproduct.id,
                        isfavourit: editproduct.isfavourit);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please provide a value';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'price',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(dexfocis);
                  },
                  initialValue: _initvalue['price'],
                  focusNode: focis,
                  onSaved: (value) {
                    editproduct = Product(
                        title: '${editproduct.title}',
                        description: '${editproduct.description}',
                        price: double.parse(value!),
                        imageUrl: '${editproduct.imageUrl}',
                        id: editproduct.id,
                        isfavourit: editproduct.isfavourit);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'please enter a valid number';
                    }
                    if (double.parse(value) <= 0) {
                      return 'please enter number greater than zero';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'description',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  initialValue: _initvalue['description'],
                  focusNode: dexfocis,
                  onSaved: (value) {
                    editproduct = Product(
                        title: '${editproduct.title}',
                        description: '${value}',
                        price: editproduct.price,
                        imageUrl: '${editproduct.imageUrl}',
                        id: editproduct.id,
                        isfavourit: editproduct.isfavourit);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter a description';
                    }
                    if (value.length < 10) {
                      return 'please enter at least gretter then 10';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(top: 8, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: _imageUrlcontroller.text.isEmpty
                            ? Text(
                                "Enter a Url",
                              )
                            : FittedBox(
                                child: Image.network(_imageUrlcontroller.text),
                                fit: BoxFit.cover,
                              )),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'ImageUrl'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlcontroller,
                        focusNode: _imageurlfocus,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          editproduct = Product(
                              title: '${editproduct.title}',
                              description: '${editproduct.description}',
                              price: editproduct.price,
                              imageUrl: '${value}',
                              id: editproduct.id,
                              isfavourit: editproduct.isfavourit);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter imag URL";
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return "please enter a valid URL";
                          }
                          if (!value.endsWith('.jpg') &&
                              !value.endsWith('.png') &&
                              !value.endsWith('.jpeg')) {
                            return 'please enter a valid Image URL';
                          }
                        },
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
