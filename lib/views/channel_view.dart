import 'package:swdmobileapp/models/channel.dart';

abstract class ChannelView {
  onLoadChannels(Future<List<Channel>> channels);
}