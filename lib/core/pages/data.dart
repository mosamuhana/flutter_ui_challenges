import '../constants.dart';
import '../models.dart';

List<Developer> getDevelopers() {
  const devDamodar = '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6';
  const devSudip = '$STORE_BASE_URL/img%2Fdev_sudip.jpg?alt=media';
  const devShyam = 'https://uilearner.com/public/images/about-img.jpg';
  const devSid = '$STORE_BASE_URL/img%2Fdev_sid.png?alt=media';

  return [
    Developer(
      name: "Damodar Lohani",
      profession: "Full Stack Developer",
      address: "Kathmandu, Nepal",
      github: "https://github.com/lohanidamodar",
      imageUrl: devDamodar,
    ),
    Developer(
      name: "Sudip Thapa",
      profession: "Flutter & React Developer",
      address: "Kathmandu, Nepal",
      github: "https://github.com/sudeepthapa",
      imageUrl: devSudip,
    ),
    Developer(
      name: "Shyam Adhikari",
      profession: "UI/UX designer",
      address: "Kathmandu, Nepal",
      github: "https://uilearner.com/",
      imageUrl: devShyam,
    ),
    Developer(
      name: "Sidhartha Joshi",
      profession: "Flutter Developer",
      address: "Kathmandu, Nepal",
      github: "https://github.com/cimplesid",
      imageUrl: devSid,
    ),
  ];
}
