import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/presenters/base_presenter.dart';
import 'package:swdmobileapp/services/project_api.dart';
import 'package:swdmobileapp/views/channel_view.dart';

class ChannelPresenter extends BasePresenter<ChannelView> {   
  final ProjectApi apiScv = new ProjectApi();

  Future<List<Channel>> getChannels() async {
    checkViewAttached();
    Future<List<Channel>> channels = apiScv?.getChannels();
    //print(news[0].newsTitle);
    if (channels != null) {
      isViewAttached ? getView().onLoadChannels(channels) : null;
    } else {
      //return debugPrint("News is empty!");
      throw Exception('Channel is empty!');
    }
  }
}
