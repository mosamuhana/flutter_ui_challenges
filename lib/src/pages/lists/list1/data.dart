import 'item.dart';

const _baseUrl = 'https://images.pexels.com/photos';

final List<Item> dummyItemList = [
  Item(
    title: 'Gardens By the Bay',
    catagory: "Gardens",
    place: "Singapore",
    ratings: 5,
    discount: "10 %",
    image: "$_baseUrl/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  Item(
    title: 'Singapore Zoo',
    catagory: "Parks",
    place: "Singapore",
    ratings: 4,
    discount: null,
    image: "$_baseUrl/1736222/pexels-photo-1736222.jpeg?cs=srgb&dl=adult-adventure-backpacker-1736222.jpg&fm=jpg",
  ),
  Item(
    title: 'National Orchid Garden',
    catagory: "Parks",
    place: "Singapore",
    ratings: 4,
    discount: "12 %",
    image: "$_baseUrl/62403/pexels-photo-62403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  Item(
    title: 'Godabari',
    catagory: "Parks",
    place: "Singapore",
    ratings: 3,
    discount: "15 %",
    image: "$_baseUrl/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ),
  Item(
    title: 'Rara National Park',
    catagory: "Parks",
    place: "Singapore",
    ratings: 4,
    discount: "12 %",
    image: "$_baseUrl/1319515/pexels-photo-1319515.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ),
];
