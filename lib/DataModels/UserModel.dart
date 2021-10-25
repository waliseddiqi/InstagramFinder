class InstaUser {
  Graphql? graphql;

  InstaUser({this.graphql});

  InstaUser.fromJson(Map<String, dynamic> json) {
    graphql =
        json['graphql'] != null ? new Graphql.fromJson(json['graphql']) : null;
  }


}

class Graphql {
  User? user;

  Graphql({this.user});

  Graphql.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class User {
  String? biography;
  bool?  blockedByViewer;

  String? externalUrl;
  EdgeFollowedBy? edgeFollowedBy;
  String? fbid;
  bool?  followedByViewer;
  EdgeFollowedBy? edgeFollow;
  bool?  followsViewer;
  String? fullName;
  String? id;
  bool?  isBusinessAccount;
  bool?  isProfessionalAccount;
  bool?  isJoinedRecently;
  bool?  isPrivate;
  bool?  isVerified;
  EdgeMutualFollowedBy? edgeMutualFollowedBy;
  String? profilePicUrl;
  String? profilePicUrlHd;
  bool?  requestedByViewer;
  bool?  shouldShowCategory;
  bool?  shouldShowPublicContacts;
  String? username;
 

  EdgeOwnerToTimelineMedia? edgeOwnerToTimelineMedia;

  User(
      {this.biography,
      this.blockedByViewer,
   
      this.externalUrl,
  
      this.edgeFollowedBy,
      this.fbid,
      this.followedByViewer,
      this.edgeFollow,
      this.followsViewer,
      this.fullName,
      this.id,
      this.isBusinessAccount,
      this.isProfessionalAccount,
      this.isJoinedRecently,
      this.isPrivate,
      this.isVerified,
      this.edgeMutualFollowedBy,
      this.profilePicUrl,
      this.profilePicUrlHd,
      this.requestedByViewer,
      this.shouldShowCategory,
      this.shouldShowPublicContacts,
      this.username,
      
      this.edgeOwnerToTimelineMedia});

  User.fromJson(Map<String, dynamic> json) {
    biography = json['biography']??"";
    blockedByViewer = json['blocked_by_viewer']??false;
   
    externalUrl = json['external_url']??"";
  
    edgeFollowedBy = json['edge_followed_by'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_followed_by'])
        : null;
    fbid = json['fbid']??"";
    followedByViewer = json['followed_by_viewer']??false;
    edgeFollow = json['edge_follow'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_follow'])
        : null;
    followsViewer = json['follows_viewer']??false;
    fullName = json['full_name']??"";
    id = json['id']??"";
    isBusinessAccount = json['is_business_account']??false;
    isProfessionalAccount = json['is_professional_account']??false;
    isJoinedRecently = json['is_joined_recently']??false;
    isPrivate = json['is_private']??false;
    isVerified = json['is_verified']??false;
    edgeMutualFollowedBy = json['edge_mutual_followed_by'] != null
        ? new EdgeMutualFollowedBy.fromJson(json['edge_mutual_followed_by'])
        : null;
    profilePicUrl = json['profile_pic_url']??"";
    profilePicUrlHd = json['profile_pic_url_hd']??"";
    requestedByViewer = json['requested_by_viewer']??false;
    shouldShowCategory = json['should_show_category']??false;
    shouldShowPublicContacts = json['should_show_public_contacts']??false;
    username = json['username']??"Not found";
   

    edgeOwnerToTimelineMedia = json['edge_owner_to_timeline_media'] != null
        ? new EdgeOwnerToTimelineMedia.fromJson(
            json['edge_owner_to_timeline_media'])
        : null;
  }


}

class EdgeFollowedBy {
  int? count;

  EdgeFollowedBy({this.count});

  EdgeFollowedBy.fromJson(Map<String, dynamic> json) {
    count = json['count']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class EdgeMutualFollowedBy {
  int? count;

  EdgeMutualFollowedBy({this.count});

  EdgeMutualFollowedBy.fromJson(Map<String, dynamic> json) {
    count = json['count']??0;

  }


}

class EdgeOwnerToTimelineMedia {
  int? count;
  
  List<Edges>? edges;

  EdgeOwnerToTimelineMedia({this.count, this.edges});

  EdgeOwnerToTimelineMedia.fromJson(Map<String, dynamic> json) {
    count = json['count']??0;
    
    if (json['edges'] != null) {
      edges = [];
      json['edges'].forEach((v) {
        edges?.add(new Edges.fromJson(v));
      });
    }
  }


}

class PageInfo {
  bool?  hasNextPage;
  String? endCursor;

  PageInfo({this.hasNextPage, this.endCursor});

  PageInfo.fromJson(Map<String, dynamic> json) {
    hasNextPage = json['has_next_page'];
    endCursor = json['end_cursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_next_page'] = this.hasNextPage;
    data['end_cursor'] = this.endCursor;
    return data;
  }
}

class Edges {
  Node? node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
  }


}

class Node {
  String? sTypename;
  String? id;
  String? shortcode;
  Dimensions? dimensions;
  String? displayUrl;
 

  SharingFrictionInfo? sharingFrictionInfo;
  
  String? mediaPreview;
  Owner? owner;
  bool?  isVideo;
  bool?  hasUpcomingEvent;
  String? accessibilityCaption;
 
  EdgeFollowedBy? edgeMediaToComment;
  bool?  commentsDisabled;
  int? takenAtTimestamp;
  EdgeFollowedBy? edgeLikedBy;
  EdgeFollowedBy? edgeMediaPreviewLike;
  Location? location;
  String? thumbnailSrc;
  List<ThumbnailResources>? thumbnailResources;
 

  Node(
      {this.sTypename,
      this.id,
      this.shortcode,
      this.dimensions,
      this.displayUrl,
      
    
      this.sharingFrictionInfo,

      this.mediaPreview,
      this.owner,
      this.isVideo,
      this.hasUpcomingEvent,
      this.accessibilityCaption,
    
      this.edgeMediaToComment,
      this.commentsDisabled,
      this.takenAtTimestamp,
      this.edgeLikedBy,
      this.edgeMediaPreviewLike,
      this.location,
      this.thumbnailSrc,
      this.thumbnailResources,
      });

  Node.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename']??"";
    id = json['id']??"";
    shortcode = json['shortcode']??"";
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    displayUrl = json['display_url']??"";

    sharingFrictionInfo = json['sharing_friction_info'] != null
        ? new SharingFrictionInfo.fromJson(json['sharing_friction_info'])
        : null;
    
    mediaPreview = json['media_preview']??"";
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    isVideo = json['is_video']??false;
    hasUpcomingEvent = json['has_upcoming_event']??false;
    accessibilityCaption = json['accessibility_caption']??"";
 
    edgeMediaToComment = json['edge_media_to_comment'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_media_to_comment'])
        : null;
    commentsDisabled = json['comments_disabled']??false;
    takenAtTimestamp = json['taken_at_timestamp']??0;
    edgeLikedBy = json['edge_liked_by'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_liked_by'])
        : null;
    edgeMediaPreviewLike = json['edge_media_preview_like'] != null
        ? new EdgeFollowedBy.fromJson(json['edge_media_preview_like'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    thumbnailSrc = json['thumbnail_src']??"";
    if (json['thumbnail_resources'] != null) {
      thumbnailResources =  [];
      json['thumbnail_resources'].forEach((v) {
        thumbnailResources?.add(new ThumbnailResources.fromJson(v));
      });
    }

  }

}

class Dimensions {
  int? height;
  int? width;

  Dimensions({this.height, this.width});

  Dimensions.fromJson(Map<String, dynamic> json) {
    height = json['height']??"";
    width = json['width']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}



class SharingFrictionInfo {
  bool?  shouldHaveSharingFriction;
  Null bloksAppUrl;

  SharingFrictionInfo({this.shouldHaveSharingFriction, this.bloksAppUrl});

  SharingFrictionInfo.fromJson(Map<String, dynamic> json) {
    shouldHaveSharingFriction = json['should_have_sharing_friction']??false;
    bloksAppUrl = json['bloks_app_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['should_have_sharing_friction'] = this.shouldHaveSharingFriction;
    data['bloks_app_url'] = this.bloksAppUrl;
    return data;
  }
}

class Owner {
  String? id;
  String? username;

  Owner({this.id, this.username});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    username = json['username']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}







class Location {
  String? id;
  bool?  hasPublicPage;
  String? name;
  String? slug;

  Location({this.id, this.hasPublicPage, this.name, this.slug});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id']??"";
    hasPublicPage = json['has_public_page']??false;
    name = json['name']??"";
    slug = json['slug']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['has_public_page'] = this.hasPublicPage;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class ThumbnailResources {
  String? src;
  int? configWidth;
  int? configHeight;

  ThumbnailResources({this.src, this.configWidth, this.configHeight});

  ThumbnailResources.fromJson(Map<String, dynamic> json) {
    src = json['src']??"";
    configWidth = json['config_width']??0;
    configHeight = json['config_height']??0;
  }


}