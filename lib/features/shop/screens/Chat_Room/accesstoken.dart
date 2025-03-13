// import 'package:googleapis_auth/auth_io.dart';

// class Accesstoken {
//   static String firebasemesgscope =
//       "https://www.googleapis.com/auth/firebasemessaging";
//   Future<String> getaccesstoken() async {
//     final client = await clientViaServiceAccount(
//         ServiceAccountCredentials.fromJson({
//           "type": "service_account",
//           "project_id": "mageauth-320b1",
//           "private_key_id": "7a21114fe7b97790a8f83d95fb6a56780f67da2f",
//           "private_key":
//               "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDJp3ulJjO0QbLh\nCEI1f+42obr1PW9ak/LV2PSRORPVJowm5DuJsi7UDhv6V9KkL2UexRWtQNLm0/JW\nGlXfdjankHSXtGe+Zg+v9s2JUaFbAubvnOaqK8nb8HI45NtnUjDhKPzAefx4WfmC\nJDCAxiahMTabPSXaI0vdZPTecjKMoFf2oRibjMK6psGtR6FUcZ97WBD98X4L7VoE\niGxG70zlJI1kCWo8xGS/XH5KwRJG7Y62M7LJV88Joeau8p1IvMdFNmlrLWt7K6xD\np2JaiJfJL5K0WEUEJqk7SBCLJ5Wp/TQ7zOC6c55RqYN51lfP9SoSAQ8XJeztouwf\nHXYLnfj7AgMBAAECggEACTB3K3r2rzexOZ0BO2PljJrJJMTUbrnAPquA1Z9Wvodf\nqqQK7IbwqFwuPTXEVRQN1R2hE8CY+8jbyb2wfRrrea5VCdbARYZsH5YtHp1YL4gN\n0wyA3G9bZwjpg5s2PlqZ/KC8B99nOGrNOneAuFWPTBgsh119fJfQLLodiIeGsy7E\nqdMEsaY7KpEpfxymgOagpr2C7OCgdj9tOmh/JQQZ1da2esnnuEZ0gyosI6kj40Hn\n0QKDLswwGlFlmm2py59k47VxJ+fqyqDT6mab/NFjkbwyg2t+PH8KkDeDgCRi9e40\nEnvCEk4RwYghlLS3udnARSb3OW5obI8kp1hcF2uoIQKBgQDsnhiewlMtpuSiVtUa\nsiTu5xBjN3bDq0vLie6LtDGtUqt12WXOr5ZRYo3yFqViJMnnys6FJlHTnzfDqsqp\nizd2mtK1++gdQ2KCdZyE4IHzMrhKrdIp0xE9Ynmd2pW26eMCZZIp4oJcmnn02fVH\nJeNHB71bDt1WbIpap0bGRxijmwKBgQDaLDNl8oS7HGNE0PhdyNGtrRTrPtMTR2V4\nNMN9RD5t0UITbUpJoabfPCzFDLI/2aN+5V3gKb3xmbBN+fm6+EPTHwZSU/aDRi0m\nnRg/M+AfMsB20WubCuo2uMiksYW7aC7wPugpfMSie9XBuiBf3Oc7NeAQvxFwqYG6\nL4iPIKXGIQKBgQCZhfJ/f6Isaq7JzgEy8wcXowB0/5WlW00wYOxP5LietpbdPhLa\nSf8ECygCPUNNLIV8SZA5wCUzY4jxAa3A171CzS2OOkXeRsxxzRGi/XATdYMxoRpN\nXM9AvtYd36doKNTLx09QsdDXeLtMbObCJQkUGyd3H2vpGT+jlglLuPF5pQKBgQCq\ncrfhIPyDtmTzwZMYqijuV/es5lM/j5r9s7M67ZMcdsz5onvUVL+rTjbn58hmy+DI\n5edWlyX3WAv+j5qEcSuECIwGy+QeoTfrH/ZuglfJ5/unmGtKINfk0q6mxK5nQLjT\nJ0J4DysMilTw2joqysm4X5njW3MDotpgHHzC3U3GIQKBgFaEnNOG2abgci17Jds+\n4wKpLuFSfr3vzEFPjgBZQPIaUhiMZzIYMzBZCfzWiGyejSTKJ/fJe9hUQt/1WR3f\ngfI9z66s+UYXd0448Pn19f9pk4woIx3gXE1cjYFSAkoZdrV7YzV2C8SbTM9dcb3C\nLiTaw2XU0nhBFuyPpiJXq2MR\n-----END PRIVATE KEY-----\n",
//           "client_email":
//               "firebase-adminsdk-oa699@mageauth-320b1.iam.gserviceaccount.com",
//           "client_id": "105888779084850957465",
//           "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//           "token_uri": "https://oauth2.googleapis.com/token",
//           "auth_provider_x509_cert_url":
//               "https://www.googleapis.com/oauth2/v1/certs",
//           "client_x509_cert_url":
//               "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-oa699%40mageauth-320b1.iam.gserviceaccount.com",
//           "universe_domain": "googleapis.com"
//         }),
//         [firebasemesgscope]);
//     final accesstoken = client.credentials.accessToken.data;
//     return accesstoken;
//   }
// }
