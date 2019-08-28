import 'package:scoped_model/scoped_model.dart';

import '../models/post.dart';

mixin PostModel on Model{

    void starPosts(int index){
      if(_posts[index].isStarred == false){
        _posts[index].isStarred = true;
        _posts[index].stars = _posts[index].stars + 1;
        notifyListeners();
      }else if(_posts[index].isStarred == true){
        _posts[index].isStarred = false;
        _posts[index].stars = _posts[index].stars - 1;
        notifyListeners();
      }
    }

    final List<Post> _posts = [
    Post(
      username: 'Tanya Taylor',
      stars: 54,
      comments: 12,
      isStarred: false,
      userAvatar: 'assets/images/3.jpg',
      hashTags: '#baddest, #socialnetwork',
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Jesus Bishop',
      stars: 128,
      comments: 78,
      isStarred: false,
      hashTags: '#relax, #travel',
      userAvatar: 'assets/images/4.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    ),
    Post(
      username: 'Oyin Turner',
      stars: 265,
      comments: 112,
      isStarred: true,
      userAvatar: 'assets/images/5.jpg',
      hashTags: '#baddest, #socialnetwork',
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Christiana Kennedy',
      stars: 540,
      comments: 252,
      isStarred: false,
      hashTags: '#relax, #travel',
      userAvatar: 'assets/images/6.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    ),
    Post(
      username: 'Jorge Curtis',
      stars: 50,
      comments: 82,
      isStarred: true,
      userAvatar: 'assets/images/7.jpg',
      hashTags: '#baddest, #socialnetwork',
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Paul Gilbert',
      stars: 294,
      comments: 158,
      isStarred: false,
      hashTags: '#relax, #travel',
      userAvatar: 'assets/images/8.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    ),
    Post(
      username: 'Franklin Guzman',
      stars: 1208,
      comments: 123,
      isStarred: false,
      userAvatar: 'assets/images/9.jpg',
      hashTags: '#baddest, #socialnetwork',
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Alejandro Hicks',
      stars: 546,
      comments: 123,
      isStarred: false,
      hashTags: '#relax, #travel',
      userAvatar: 'assets/images/10.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    ),
    Post(
      username: 'Benjamin Webb',
      stars: 34,
      comments: 10,
      isStarred: true,
      userAvatar: 'assets/images/11.jpg',
      hashTags: '#baddest, #socialnetwork',
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Jesus Bishop',
      stars: 134,
      comments: 22,
      isStarred: false,
      hashTags: '#relax, #travel',
      userAvatar: 'assets/images/12.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    ),
    Post(
      username: 'Micheal McCormick',
      stars: 51,
      comments: 4,
      isStarred: true,
      userAvatar: 'assets/images/13.jpg',
      hashTags: '#baddest, #socialnetwork',
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Milton Ortiz',
      hashTags: '#relax, #travel',
      stars: 184,
      comments: 109,
      isStarred: false,
      userAvatar: 'assets/images/14.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    )
  ];

  List<Post> get posts{
    return _posts;
  }

  List<Post> _searchPosts = [
    Post(
      username: 'Tanya Taylor',
      userAvatar: 'assets/images/landing-bg.jpg',
      hashTags: '#baddest, #socialnetwork',
      isStarred: false,
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Jesus Bishop',
      hashTags: '#relax, #travel',
      isStarred: true,
      userAvatar: 'assets/images/landing-bg.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    ),
    Post(
      username: 'Oyin Turner',
      userAvatar: 'assets/images/landing-bg.jpg',
      hashTags: '#baddest, #socialnetwork',
      isStarred: true,
      content: 'This kit includes is a high quality pack of 31+ social app screens for iPhone X with trendy useful components that you can use for inspiration and speed up your design workflow. All layers and symbols are neatly grouped, named and organized. '
    ),
    Post(
      username: 'Christiana Kennedy',
      hashTags: '#relax, #travel',
      isStarred: false,
      userAvatar: 'assets/images/landing-bg.jpg',
      content: 'So excited about old days here on Dribbble when rebounds among players were a common practice. Another distinguishing feature of this community was weather apps and widgets'
    )
  ];

  List<Post> get searchPosts{
    return _searchPosts;
  }
  
}