import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:harvest_hero/constants/api_constant.dart';


class ApiService {
  Future<String> getDescription({required String diseaseName}) async {
    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/completions'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "model": 'gpt-3.5-turbo-instruct',
          "prompt":
              "GPT, for $diseaseName, Provide the Description and causes about this disease in not more than 150 words and only one paragraph. make it concise and clear",
          "temperature": 1,
          "max_tokens": 256,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      return jsonResponse["choices"][0]["text"];
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
  
  // Future<String> getCause({required String diseaseName}) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$BASE_URL/completions'),
  //       headers: {
  //         HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
  //         HttpHeaders.contentTypeHeader: "application/json",
  //       },
  //       body: jsonEncode({
  //         "model": 'gpt-3.5-turbo-instruct',
  //         "prompt":
  //             "GPT, for $diseaseName, Provide the cause of this disease in not more than 120 words. make it concise and clear",
  //           "temperature": 1,
  //         "max_tokens": 256,
  //         "top_p": 1,
  //         "frequency_penalty": 0,
  //         "presence_penalty": 0
  //       }),
  //     );

  //     final jsonResponse = jsonDecode(response.body);

  //     if (jsonResponse['error'] != null) {
  //       throw HttpException(jsonResponse['error']["message"]);
  //     }

  //     return jsonResponse["choices"][0]["text"];
  //   } catch (error) {
  //     throw Exception('Error: $error');
  //   }
  
  // }

  Future<String> getFertilizer({required String diseaseName}) async {
  try {
    final response = await http.post(
      Uri.parse('$BASE_URL/completions'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode({
        "model": 'gpt-3.5-turbo-instruct',
        "prompt": 
                "GPT, for $diseaseName, Provide the Fertilizer requirements to prevent this disease in not more than 500 characters and in four bullet points and those points should be in numerical format. make each point concise and clear",
                "temperature": 1,
        "max_tokens": 256,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      }),
    );

    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);  // Add this line to print the JSON response

    if (jsonResponse['error'] != null) {
      throw HttpException(jsonResponse['error']["message"]);
    }

    // Check the structure of 'choices' and access the correct fields
    if (jsonResponse.containsKey('choices') && jsonResponse['choices'].isNotEmpty) {
      if (jsonResponse['choices'][0].containsKey('message') && jsonResponse['choices'][0]['message'].containsKey('content')) {
        return jsonResponse['choices'][0]['message']['content'];
      } else if (jsonResponse['choices'][0].containsKey('text')) {
        return jsonResponse['choices'][0]['text'];
      }
    }

    throw Exception('Unexpected JSON structure');
  } catch (error) {
    throw Exception('Error: $error');
  }
}

  
  Future<String> getNutrients({required String diseaseName}) async {
    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/completions'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "model": 'gpt-3.5-turbo-instruct',
          "prompt": 
                  "GPT, for $diseaseName, Provide the Nutrient to provide to prevent this disease from spreading further in not more than 500 characters and in four bullet points and those points should be in numerical format. make each point concise and clear",
            "temperature": 1,
          "max_tokens": 256,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      if (jsonResponse.containsKey('choices') && jsonResponse['choices'].isNotEmpty) {
      if (jsonResponse['choices'][0].containsKey('message') && jsonResponse['choices'][0]['message'].containsKey('content')) {
        return jsonResponse['choices'][0]['message']['content'];
      } else if (jsonResponse['choices'][0].containsKey('text')) {
        return jsonResponse['choices'][0]['text'];
      }
    }
    throw Exception('Unexpected JSON structure');
  
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
  
  Future<String> getManagement({required String diseaseName}) async {
    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/completions'),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $API_KEY',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "model": 'gpt-3.5-turbo-instruct',
          "prompt":
                  "GPT, for $diseaseName, Provide the Management Methods to prevent this disease in not more than 500 characters and in four bullet points and those points should be in numerical format. make each point concise and clear",
            "temperature": 1,
          "max_tokens": 256,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      if (jsonResponse.containsKey('choices') && jsonResponse['choices'].isNotEmpty) {
      if (jsonResponse['choices'][0].containsKey('message') && jsonResponse['choices'][0]['message'].containsKey('content')) {
        return jsonResponse['choices'][0]['message']['content'];
      } else if (jsonResponse['choices'][0].containsKey('text')) {
        return jsonResponse['choices'][0]['text'];
      }
    }
    throw Exception('Unexpected JSON structure');
  
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
