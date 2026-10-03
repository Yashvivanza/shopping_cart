import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

/// Local dummy data so the app runs without any backend.
class DummyData {
  static const List<CategoryModel> categories = [
    CategoryModel(id: 'electronics', name: 'Electronics', icon: Icons.headphones, color: Color(0xFF5B5BD6)),
    CategoryModel(id: 'fashion', name: 'Fashion', icon: Icons.checkroom, color: Color(0xFFE85D8A)),
    CategoryModel(id: 'shoes', name: 'Shoes', icon: Icons.directions_run, color: Color(0xFFFF8A3D)),
    CategoryModel(id: 'beauty', name: 'Beauty', icon: Icons.face_retouching_natural, color: Color(0xFF2BB59A)),
    CategoryModel(id: 'accessories', name: 'Accessories', icon: Icons.watch, color: Color(0xFF3B8EDB)),
  ];

  static const List<ProductModel> products = [
    // ---------- Electronics ----------
    ProductModel(
      id: 'p1', categoryId: 'electronics', name: 'Wireless Headphones',
      imageUrl: 'https://picsum.photos/seed/headphones/600/600',
      price: 2499, rating: 4.5,
      shortDescription: 'Over-ear Bluetooth headphones with deep bass.',
      detailedDescription: 'Enjoy up to 30 hours of playback with these comfortable over-ear wireless headphones. They feature active noise reduction, soft ear cushions, a built-in microphone for calls and fast USB-C charging.',
    ),
    ProductModel(
      id: 'p2', categoryId: 'electronics', name: 'Smart Watch',
      imageUrl: 'https://picsum.photos/seed/smartwatch/600/600',
      price: 3999, rating: 4.3,
      shortDescription: 'Fitness tracking watch with AMOLED display.',
      detailedDescription: 'Track your steps, heart rate and sleep with this stylish smart watch. It has a bright AMOLED display, water resistance, 7-day battery life and notifications for calls and messages.',
    ),
    ProductModel(
      id: 'p3', categoryId: 'electronics', name: 'Bluetooth Speaker',
      imageUrl: 'https://picsum.photos/seed/speaker/600/600',
      price: 1799, rating: 4.6,
      shortDescription: 'Portable waterproof speaker with rich sound.',
      detailedDescription: 'A compact speaker that delivers powerful 360-degree sound. It is splash-proof, lasts up to 12 hours on a single charge and pairs quickly with any Bluetooth device.',
    ),
    ProductModel(
      id: 'p4', categoryId: 'electronics', name: 'Power Bank 20000mAh',
      imageUrl: 'https://picsum.photos/seed/powerbank/600/600',
      price: 1299, rating: 4.2,
      shortDescription: 'High-capacity fast-charging power bank.',
      detailedDescription: 'Charge your phone up to five times with this 20000mAh power bank. It supports fast charging, has dual USB output and a USB-C port, and includes smart protection against overheating.',
    ),

    // ---------- Fashion ----------
    ProductModel(
      id: 'p5', categoryId: 'fashion', name: 'Denim Jacket',
      imageUrl: 'https://picsum.photos/seed/denimjacket/600/600',
      price: 2199, rating: 4.4,
      shortDescription: 'Classic blue denim jacket for every season.',
      detailedDescription: 'Made from durable, soft-washed denim, this jacket has a regular fit, metal buttons and two chest pockets. Pair it with a t-shirt or hoodie for an effortless everyday look.',
    ),
    ProductModel(
      id: 'p6', categoryId: 'fashion', name: 'Cotton T-Shirt',
      imageUrl: 'https://picsum.photos/seed/tshirt/600/600',
      price: 599, rating: 4.1,
      shortDescription: 'Breathable 100% cotton round-neck t-shirt.',
      detailedDescription: 'A wardrobe essential made from pure combed cotton. It is lightweight, breathable and keeps its shape wash after wash. Available in a relaxed everyday fit.',
    ),
    ProductModel(
      id: 'p7', categoryId: 'fashion', name: 'Summer Dress',
      imageUrl: 'https://picsum.photos/seed/dress/600/600',
      price: 1499, rating: 4.5,
      shortDescription: 'Light floral dress perfect for warm days.',
      detailedDescription: 'This flowy floral dress is made from soft, airy fabric with a flattering waistline and knee-length cut. Ideal for casual outings, brunches and holidays.',
    ),
    ProductModel(
      id: 'p8', categoryId: 'fashion', name: 'Hooded Sweatshirt',
      imageUrl: 'https://picsum.photos/seed/hoodie/600/600',
      price: 1299, rating: 4.3,
      shortDescription: 'Warm fleece hoodie with front pocket.',
      detailedDescription: 'Stay cozy in this fleece-lined hoodie featuring an adjustable drawstring hood, kangaroo pocket and ribbed cuffs. A perfect companion for cooler evenings.',
    ),

    // ---------- Shoes ----------
    ProductModel(
      id: 'p9', categoryId: 'shoes', name: 'Running Sneakers',
      imageUrl: 'https://picsum.photos/seed/sneakers/600/600',
      price: 2999, rating: 4.6,
      shortDescription: 'Lightweight sneakers with cushioned sole.',
      detailedDescription: 'Designed for comfort and performance, these running sneakers have a breathable mesh upper, shock-absorbing sole and a grippy outsole that keeps you stable on any surface.',
    ),
    ProductModel(
      id: 'p10', categoryId: 'shoes', name: 'Leather Loafers',
      imageUrl: 'https://picsum.photos/seed/loafers/600/600',
      price: 3499, rating: 4.2,
      shortDescription: 'Formal slip-on loafers in genuine leather.',
      detailedDescription: 'Handcrafted from genuine leather with a cushioned insole, these loafers are ideal for office wear and formal events. The slip-on design makes them easy to wear all day.',
    ),
    ProductModel(
      id: 'p11', categoryId: 'shoes', name: 'Canvas Shoes',
      imageUrl: 'https://picsum.photos/seed/canvasshoes/600/600',
      price: 1599, rating: 4.0,
      shortDescription: 'Casual lace-up canvas shoes.',
      detailedDescription: 'Simple, stylish and comfortable. These canvas shoes have a rubber sole, reinforced toe cap and breathable lining, making them perfect for daily casual wear.',
    ),
    ProductModel(
      id: 'p12', categoryId: 'shoes', name: 'Sports Sandals',
      imageUrl: 'https://picsum.photos/seed/sandals/600/600',
      price: 999, rating: 4.1,
      shortDescription: 'Adjustable sandals for outdoor adventures.',
      detailedDescription: 'These sports sandals feature adjustable velcro straps, a contoured footbed and a durable non-slip sole. Great for walks, travel and light trekking.',
    ),

    // ---------- Beauty ----------
    ProductModel(
      id: 'p13', categoryId: 'beauty', name: 'Face Moisturizer',
      imageUrl: 'https://picsum.photos/seed/moisturizer/600/600',
      price: 699, rating: 4.4,
      shortDescription: 'Hydrating daily cream for soft skin.',
      detailedDescription: 'A lightweight, non-greasy moisturizer enriched with hyaluronic acid and vitamin E. It keeps your skin soft and hydrated for 24 hours and suits all skin types.',
    ),
    ProductModel(
      id: 'p14', categoryId: 'beauty', name: 'Matte Lipstick',
      imageUrl: 'https://picsum.photos/seed/lipstick/600/600',
      price: 499, rating: 4.3,
      shortDescription: 'Long-lasting matte finish in bold shades.',
      detailedDescription: 'Get rich colour in a single swipe. This creamy matte lipstick is smudge-resistant, comfortable to wear and stays vibrant for up to 8 hours.',
    ),
    ProductModel(
      id: 'p15', categoryId: 'beauty', name: 'Eau de Parfum',
      imageUrl: 'https://picsum.photos/seed/perfume/600/600',
      price: 1999, rating: 4.7,
      shortDescription: 'Elegant long-lasting fragrance, 100ml.',
      detailedDescription: 'A balanced blend of citrus top notes, floral heart and warm woody base. This 100ml eau de parfum lasts all day and makes a wonderful gift.',
    ),
    ProductModel(
      id: 'p16', categoryId: 'beauty', name: 'Hair Serum',
      imageUrl: 'https://picsum.photos/seed/hairserum/600/600',
      price: 549, rating: 4.2,
      shortDescription: 'Smoothing serum for shiny, frizz-free hair.',
      detailedDescription: 'Infused with argan oil, this serum tames frizz, adds shine and protects hair from heat damage. Apply a few drops to damp or dry hair.',
    ),

    // ---------- Accessories ----------
    ProductModel(
      id: 'p17', categoryId: 'accessories', name: 'Leather Wallet',
      imageUrl: 'https://picsum.photos/seed/wallet/600/600',
      price: 799, rating: 4.3,
      shortDescription: 'Slim bifold wallet with card slots.',
      detailedDescription: 'A slim bifold wallet made of premium leather with six card slots, two note compartments and a coin pocket. Compact enough for any pocket.',
    ),
    ProductModel(
      id: 'p18', categoryId: 'accessories', name: 'Sunglasses',
      imageUrl: 'https://picsum.photos/seed/sunglasses/600/600',
      price: 1199, rating: 4.5,
      shortDescription: 'UV400 protected stylish sunglasses.',
      detailedDescription: 'These lightweight sunglasses offer full UV400 protection with polarised lenses to reduce glare. The durable frame is designed for a comfortable all-day fit.',
    ),
    ProductModel(
      id: 'p19', categoryId: 'accessories', name: 'Travel Backpack',
      imageUrl: 'https://picsum.photos/seed/backpack/600/600',
      price: 1899, rating: 4.6,
      shortDescription: 'Spacious water-resistant laptop backpack.',
      detailedDescription: 'A roomy 30L backpack with a padded laptop compartment, multiple organiser pockets, USB charging port and water-resistant fabric. Perfect for work, college and travel.',
    ),
    ProductModel(
      id: 'p20', categoryId: 'accessories', name: 'Analog Watch',
      imageUrl: 'https://picsum.photos/seed/analogwatch/600/600',
      price: 2299, rating: 4.4,
      shortDescription: 'Classic stainless steel analog watch.',
      detailedDescription: 'A timeless analog watch with a stainless steel strap, scratch-resistant glass and water resistance up to 30 metres. Suitable for both formal and casual outfits.',
    ),
  ];

  static List<ProductModel> productsByCategory(String categoryId) {
    return products.where((p) => p.categoryId == categoryId).toList();
  }
}
