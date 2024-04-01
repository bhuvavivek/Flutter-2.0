import 'package:journey_ii/services/models/Post_model.dart';
import 'package:journey_ii/widgets/post_tile.dart';

class PostMapper {
  static map(PostResponse response) {
    return PostTileWidgetUiModel(title: response.title, body: response.body);
  }
}
