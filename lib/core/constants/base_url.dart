class BaseUrl{
  static baseUrl(int start, int end){
    return 'https://jsonplaceholder.typicode.com/photos?_start=$start&_limit=$end';
  }
}