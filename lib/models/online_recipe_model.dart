// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);
//@dart=2.9
import 'package:meta/meta.dart';
import 'dart:convert';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  RecipeModel({
    @required this.feed,
    @required this.seo,
  });

  List<Feed> feed;
  RecipeModelSeo seo;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        feed: List<Feed>.from(json["feed"].map((x) => Feed.fromJson(x))),
        seo: RecipeModelSeo.fromJson(json["seo"]),
      );

  Map<String, dynamic> toJson() => {
        "feed": List<dynamic>.from(feed.map((x) => x.toJson())),
        "seo": seo.toJson(),
      };
}

class Feed {
  Feed({
    @required this.display,
    @required this.type,
    @required this.promoted,
    @required this.proRecipe,
    @required this.recipeType,
    @required this.trackingId,
    @required this.seo,
    @required this.content,
  });

  FeedDisplay display;
  FeedType type;
  bool promoted;
  bool proRecipe;
  List<RecipeType> recipeType;
  String trackingId;
  FeedSeo seo;
  Content content;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        display: FeedDisplay.fromJson(json["display"]),
        type: feedTypeValues.map[json["type"]],
        promoted: json["promoted"],
        proRecipe: json["proRecipe"],
        recipeType: List<RecipeType>.from(
            json["recipeType"].map((x) => recipeTypeValues.map[x])),
        trackingId: json["tracking-id"],
        seo: FeedSeo.fromJson(json["seo"]),
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "display": display.toJson(),
        "type": feedTypeValues.reverse[type],
        "promoted": promoted,
        "proRecipe": proRecipe,
        "recipeType": List<dynamic>.from(
            recipeType.map((x) => recipeTypeValues.reverse[x])),
        "tracking-id": trackingId,
        "seo": seo.toJson(),
        "content": content.toJson(),
      };
}

class Content {
  Content({
    @required this.description,
    @required this.urbSubmitters,
    @required this.tags,
    @required this.preparationSteps,
    @required this.videos,
    @required this.moreContent,
    @required this.tagsAds,
    @required this.details,
    @required this.relatedContent,
    @required this.ingredientLines,
    @required this.unitSystem,
    @required this.reviews,
    @required this.relatedProducts,
    @required this.preparationStepCount,
    @required this.nutrition,
    @required this.yums,
    @required this.guidedVariations,
  });

  Description description;
  List<dynamic> urbSubmitters;
  Tags tags;
  List<String> preparationSteps;
  Videos videos;
  MoreContent moreContent;
  TagsAds tagsAds;
  Details details;
  MoreContent relatedContent;
  List<ContentIngredientLine> ingredientLines;
  UnitSystem unitSystem;
  Reviews reviews;
  MoreContent relatedProducts;
  int preparationStepCount;
  Nutrition nutrition;
  Yums yums;
  List<GuidedVariation> guidedVariations;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        description: Description.fromJson(json["description"]),
        urbSubmitters: List<dynamic>.from(json["urbSubmitters"].map((x) => x)),
        tags: Tags.fromJson(json["tags"]),
        preparationSteps:
            List<String>.from(json["preparationSteps"].map((x) => x)),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        moreContent: MoreContent.fromJson(json["moreContent"]),
        tagsAds: TagsAds.fromJson(json["tagsAds"]),
        details: Details.fromJson(json["details"]),
        relatedContent: MoreContent.fromJson(json["relatedContent"]),
        ingredientLines: List<ContentIngredientLine>.from(
            json["ingredientLines"]
                .map((x) => ContentIngredientLine.fromJson(x))),
        unitSystem: unitSystemValues.map[json["unitSystem"]],
        reviews: Reviews.fromJson(json["reviews"]),
        relatedProducts: MoreContent.fromJson(json["relatedProducts"]),
        preparationStepCount: json["preparationStepCount"],
        nutrition: Nutrition.fromJson(json["nutrition"]),
        yums: Yums.fromJson(json["yums"]),
        guidedVariations: json["guidedVariations"] == null
            ? null
            : List<GuidedVariation>.from(json["guidedVariations"]
                .map((x) => GuidedVariation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description.toJson(),
        "urbSubmitters": List<dynamic>.from(urbSubmitters.map((x) => x)),
        "tags": tags.toJson(),
        "preparationSteps": List<dynamic>.from(preparationSteps.map((x) => x)),
        "videos": videos == null ? null : videos.toJson(),
        "moreContent": moreContent.toJson(),
        "tagsAds": tagsAds.toJson(),
        "details": details.toJson(),
        "relatedContent": relatedContent.toJson(),
        "ingredientLines":
            List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
        "unitSystem": unitSystemValues.reverse[unitSystem],
        "reviews": reviews.toJson(),
        "relatedProducts": relatedProducts.toJson(),
        "preparationStepCount": preparationStepCount,
        "nutrition": nutrition.toJson(),
        "yums": yums.toJson(),
        "guidedVariations": guidedVariations == null
            ? null
            : List<dynamic>.from(guidedVariations.map((x) => x.toJson())),
      };
}

class Description {
  Description({
    @required this.mobileSectionName,
    @required this.text,
    @required this.shortText,
  });

  DescriptionMobileSectionName mobileSectionName;
  String text;
  String shortText;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        mobileSectionName:
            descriptionMobileSectionNameValues.map[json["mobileSectionName"]],
        text: json["text"],
        shortText: json["shortText"],
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName":
            descriptionMobileSectionNameValues.reverse[mobileSectionName],
        "text": text,
        "shortText": shortText,
      };
}

enum DescriptionMobileSectionName { DESCRIPTION }

final descriptionMobileSectionNameValues =
    EnumValues({"Description": DescriptionMobileSectionName.DESCRIPTION});

class Details {
  Details({
    @required this.directionsUrl,
    @required this.totalTime,
    @required this.displayName,
    @required this.images,
    @required this.name,
    @required this.keywords,
    @required this.brand,
    @required this.id,
    @required this.attribution,
    @required this.recipeId,
    @required this.numberOfServings,
    @required this.globalId,
    @required this.totalTimeInSeconds,
    @required this.rating,
  });

  String directionsUrl;
  String totalTime;
  DisplayName displayName;
  List<Image> images;
  String name;
  List<String> keywords;
  String brand;
  String id;
  Attribution attribution;
  String recipeId;
  int numberOfServings;
  String globalId;
  int totalTimeInSeconds;
  int rating;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        directionsUrl: json["directionsUrl"],
        totalTime: json["totalTime"],
        displayName: displayNameValues.map[json["displayName"]],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        brand: json["brand"],
        id: json["id"],
        attribution: Attribution.fromJson(json["attribution"]),
        recipeId: json["recipeId"],
        numberOfServings: json["numberOfServings"],
        globalId: json["globalId"],
        totalTimeInSeconds: json["totalTimeInSeconds"],
        rating: 0,
      );

  Map<String, dynamic> toJson() => {
        "directionsUrl": directionsUrl,
        "totalTime": totalTime,
        "displayName": displayNameValues.reverse[displayName],
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "brand": brand,
        "id": id,
        "attribution": attribution.toJson(),
        "recipeId": recipeId,
        "numberOfServings": numberOfServings,
        "globalId": globalId,
        "totalTimeInSeconds": totalTimeInSeconds,
        "rating": rating,
      };
}

class Attribution {
  Attribution({
    @required this.html,
    @required this.url,
    @required this.text,
    @required this.logo,
  });

  String html;
  String url;
  String text;
  String logo;

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        html: json["html"],
        url: json["url"],
        text: json["text"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "html": html,
        "url": url,
        "text": text,
        "logo": logo,
      };
}

enum DisplayName { YUMMLY, PORK }

final displayNameValues =
    EnumValues({"Pork": DisplayName.PORK, "Yummly": DisplayName.YUMMLY});

class Image {
  Image({
    @required this.hostedLargeUrl,
    @required this.resizableImageUrl,
    @required this.resizableImageHeight,
    @required this.resizableImageWidth,
  });

  String hostedLargeUrl;
  String resizableImageUrl;
  int resizableImageHeight;
  int resizableImageWidth;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        hostedLargeUrl: json["hostedLargeUrl"],
        resizableImageUrl: json["resizableImageUrl"],
        resizableImageHeight: json["resizableImageHeight"],
        resizableImageWidth: json["resizableImageWidth"],
      );

  Map<String, dynamic> toJson() => {
        "hostedLargeUrl": hostedLargeUrl,
        "resizableImageUrl": resizableImageUrl,
        "resizableImageHeight": resizableImageHeight,
        "resizableImageWidth": resizableImageWidth,
      };
}

class GuidedVariation {
  GuidedVariation({
    @required this.id,
    @required this.guidedVariationDefault,
    @required this.variationAttributes,
    @required this.connected,
    @required this.actions,
    @required this.applianceUnitTypeCode,
  });

  String id;
  bool guidedVariationDefault;
  List<dynamic> variationAttributes;
  bool connected;
  List<Action> actions;
  String applianceUnitTypeCode;

  factory GuidedVariation.fromJson(Map<String, dynamic> json) =>
      GuidedVariation(
        id: json["id"],
        guidedVariationDefault: json["default"],
        variationAttributes:
            List<dynamic>.from(json["variationAttributes"].map((x) => x)),
        connected: json["connected"],
        actions: json["actions"] == null
            ? null
            : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
        applianceUnitTypeCode: json["applianceUnitTypeCode"] == null
            ? null
            : json["applianceUnitTypeCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "default": guidedVariationDefault,
        "variationAttributes":
            List<dynamic>.from(variationAttributes.map((x) => x)),
        "connected": connected,
        "actions": actions == null
            ? null
            : List<dynamic>.from(actions.map((x) => x.toJson())),
        "applianceUnitTypeCode":
            applianceUnitTypeCode == null ? null : applianceUnitTypeCode,
      };
}

class Action {
  Action({
    @required this.name,
    @required this.stepGroups,
  });

  ActionName name;
  List<StepGroup> stepGroups;

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        name: actionNameValues.map[json["name"]],
        stepGroups: List<StepGroup>.from(
            json["stepGroups"].map((x) => StepGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": actionNameValues.reverse[name],
        "stepGroups": List<dynamic>.from(stepGroups.map((x) => x.toJson())),
      };
}

enum ActionName { PREP, STOVE, SERVE, PREHEAT, OVEN, CHECK, MICROWAVE }

final actionNameValues = EnumValues({
  "Check": ActionName.CHECK,
  "Microwave": ActionName.MICROWAVE,
  "Oven": ActionName.OVEN,
  "Preheat": ActionName.PREHEAT,
  "Prep": ActionName.PREP,
  "Serve": ActionName.SERVE,
  "Stove": ActionName.STOVE
});

class StepGroup {
  StepGroup({
    @required this.steps,
  });

  List<Step> steps;

  factory StepGroup.fromJson(Map<String, dynamic> json) => StepGroup(
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

class Step {
  Step({
    @required this.displayText,
    @required this.equipment,
    @required this.ingredientLines,
    @required this.imageUrl,
    @required this.video,
    @required this.timers,
    @required this.prerequisiteEvents,
    @required this.tip,
  });

  String displayText;
  List<Equipment> equipment;
  List<StepIngredientLine> ingredientLines;
  String imageUrl;
  Video video;
  List<Timer> timers;
  List<PrerequisiteEvent> prerequisiteEvents;
  String tip;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        displayText: json["displayText"],
        equipment: json["equipment"] == null
            ? null
            : List<Equipment>.from(
                json["equipment"].map((x) => Equipment.fromJson(x))),
        ingredientLines: List<StepIngredientLine>.from(
            json["ingredientLines"].map((x) => StepIngredientLine.fromJson(x))),
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        timers: json["timers"] == null
            ? null
            : List<Timer>.from(json["timers"].map((x) => Timer.fromJson(x))),
        prerequisiteEvents: json["prerequisiteEvents"] == null
            ? null
            : List<PrerequisiteEvent>.from(json["prerequisiteEvents"]
                .map((x) => PrerequisiteEvent.fromJson(x))),
        tip: json["tip"] == null ? null : json["tip"],
      );

  Map<String, dynamic> toJson() => {
        "displayText": displayText,
        "equipment": equipment == null
            ? null
            : List<dynamic>.from(equipment.map((x) => x.toJson())),
        "ingredientLines":
            List<dynamic>.from(ingredientLines.map((x) => x.toJson())),
        "imageUrl": imageUrl == null ? null : imageUrl,
        "video": video == null ? null : video.toJson(),
        "timers": timers == null
            ? null
            : List<dynamic>.from(timers.map((x) => x.toJson())),
        "prerequisiteEvents": prerequisiteEvents == null
            ? null
            : List<dynamic>.from(prerequisiteEvents.map((x) => x.toJson())),
        "tip": tip == null ? null : tip,
      };
}

class Equipment {
  Equipment({
    @required this.id,
    @required this.name,
  });

  String id;
  String name;

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class StepIngredientLine {
  StepIngredientLine({
    @required this.ingredient,
    @required this.ingredientId,
    @required this.sortOrder,
    @required this.amount,
    @required this.category,
    @required this.remainder,
  });

  String ingredient;
  String ingredientId;
  int sortOrder;
  PurpleAmount amount;
  String category;
  String remainder;

  factory StepIngredientLine.fromJson(Map<String, dynamic> json) =>
      StepIngredientLine(
        ingredient: json["ingredient"],
        ingredientId: json["ingredientId"],
        sortOrder: json["sortOrder"],
        amount: json["amount"] == null
            ? null
            : PurpleAmount.fromJson(json["amount"]),
        category: json["category"],
        remainder: json["remainder"] == null ? null : json["remainder"],
      );

  Map<String, dynamic> toJson() => {
        "ingredient": ingredient,
        "ingredientId": ingredientId,
        "sortOrder": sortOrder,
        "amount": amount == null ? null : amount.toJson(),
        "category": category,
        "remainder": remainder == null ? null : remainder,
      };
}

class PurpleAmount {
  PurpleAmount({
    @required this.metric,
    @required this.imperial,
  });

  PurpleImperial metric;
  PurpleImperial imperial;

  factory PurpleAmount.fromJson(Map<String, dynamic> json) => PurpleAmount(
        metric: PurpleImperial.fromJson(json["metric"]),
        imperial: PurpleImperial.fromJson(json["imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "metric": metric.toJson(),
        "imperial": imperial.toJson(),
      };
}

class PurpleImperial {
  PurpleImperial({
    @required this.unit,
    @required this.quantity,
  });

  ImperialUnit unit;
  double quantity;

  factory PurpleImperial.fromJson(Map<String, dynamic> json) => PurpleImperial(
        unit: ImperialUnit.fromJson(json["unit"]),
        quantity: json["quantity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "unit": unit.toJson(),
        "quantity": quantity,
      };
}

class ImperialUnit {
  ImperialUnit({
    @required this.id,
    @required this.name,
    @required this.abbreviation,
    @required this.plural,
    @required this.kind,
    @required this.round,
    @required this.decimal,
    @required this.pluralAbbreviation,
  });

  String id;
  NameEnum name;
  String abbreviation;
  PurplePlural plural;
  Kind kind;
  bool round;
  bool decimal;
  String pluralAbbreviation;

  factory ImperialUnit.fromJson(Map<String, dynamic> json) => ImperialUnit(
        id: json["id"],
        name: nameEnumValues.map[json["name"]],
        abbreviation: json["abbreviation"],
        plural: purplePluralValues.map[json["plural"]],
        kind: kindValues.map[json["kind"]],
        round: json["round?"] == null ? null : json["round?"],
        decimal: json["decimal"],
        pluralAbbreviation: json["pluralAbbreviation"] == null
            ? null
            : json["pluralAbbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameEnumValues.reverse[name],
        "abbreviation": abbreviation,
        "plural": purplePluralValues.reverse[plural],
        "kind": kindValues.reverse[kind],
        "round?": round == null ? null : round,
        "decimal": decimal,
        "pluralAbbreviation":
            pluralAbbreviation == null ? null : pluralAbbreviation,
      };
}

enum Kind { COUNT, MASS, VOLUME, LENGTH }

final kindValues = EnumValues({
  "count": Kind.COUNT,
  "length": Kind.LENGTH,
  "mass": Kind.MASS,
  "volume": Kind.VOLUME
});

enum NameEnum {
  EMPTY,
  POUND,
  TEASPOON,
  INCH,
  TABLESPOON,
  CUP,
  CAN,
  OUNCE,
  JAR,
  BAG,
  KILOGRAM,
  CENTIMETER,
  MILLILITER,
  GRAM,
  LITER,
  CLOVE
}

final nameEnumValues = EnumValues({
  "bag": NameEnum.BAG,
  "can": NameEnum.CAN,
  "centimeter": NameEnum.CENTIMETER,
  "clove": NameEnum.CLOVE,
  "cup": NameEnum.CUP,
  "": NameEnum.EMPTY,
  "gram": NameEnum.GRAM,
  "inch": NameEnum.INCH,
  "jar": NameEnum.JAR,
  "kilogram": NameEnum.KILOGRAM,
  "liter": NameEnum.LITER,
  "milliliter": NameEnum.MILLILITER,
  "ounce": NameEnum.OUNCE,
  "pound": NameEnum.POUND,
  "tablespoon": NameEnum.TABLESPOON,
  "teaspoon": NameEnum.TEASPOON
});

enum PurplePlural {
  EMPTY,
  POUNDS,
  TEASPOONS,
  INCHES,
  TABLESPOONS,
  CUPS,
  CANS,
  OUNCES,
  JARS,
  BAGS,
  KILOGRAMS,
  CENTIMETERS,
  MILLILITERS,
  GRAMS,
  LITERS,
  CLOVES
}

final purplePluralValues = EnumValues({
  "bags": PurplePlural.BAGS,
  "cans": PurplePlural.CANS,
  "centimeters": PurplePlural.CENTIMETERS,
  "cloves": PurplePlural.CLOVES,
  "cups": PurplePlural.CUPS,
  "": PurplePlural.EMPTY,
  "grams": PurplePlural.GRAMS,
  "inches": PurplePlural.INCHES,
  "jars": PurplePlural.JARS,
  "kilograms": PurplePlural.KILOGRAMS,
  "liters": PurplePlural.LITERS,
  "milliliters": PurplePlural.MILLILITERS,
  "ounces": PurplePlural.OUNCES,
  "pounds": PurplePlural.POUNDS,
  "tablespoons": PurplePlural.TABLESPOONS,
  "teaspoons": PurplePlural.TEASPOONS
});

class PrerequisiteEvent {
  PrerequisiteEvent({
    @required this.priority,
    @required this.message,
    @required this.mappingNotificationId,
    @required this.type,
  });

  Priority priority;
  String message;
  String mappingNotificationId;
  String type;

  factory PrerequisiteEvent.fromJson(Map<String, dynamic> json) =>
      PrerequisiteEvent(
        priority: priorityValues.map[json["priority"]],
        message: json["message"],
        mappingNotificationId: json["mappingNotificationId"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "priority": priorityValues.reverse[priority],
        "message": message,
        "mappingNotificationId": mappingNotificationId,
        "type": type,
      };
}

enum Priority { HIGH }

final priorityValues = EnumValues({"high": Priority.HIGH});

class Timer {
  Timer({
    @required this.id,
    @required this.timerName,
    @required this.repeatable,
    @required this.maxRepeat,
    @required this.durationSeconds,
    @required this.priority,
    @required this.mappingNotificationId,
    @required this.finishMessage,
  });

  String id;
  String timerName;
  bool repeatable;
  int maxRepeat;
  int durationSeconds;
  Priority priority;
  String mappingNotificationId;
  String finishMessage;

  factory Timer.fromJson(Map<String, dynamic> json) => Timer(
        id: json["id"],
        timerName: json["timerName"],
        repeatable: json["repeatable"],
        maxRepeat: json["maxRepeat"],
        durationSeconds: json["durationSeconds"],
        priority: priorityValues.map[json["priority"]],
        mappingNotificationId: json["mappingNotificationId"],
        finishMessage: json["finishMessage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timerName": timerName,
        "repeatable": repeatable,
        "maxRepeat": maxRepeat,
        "durationSeconds": durationSeconds,
        "priority": priorityValues.reverse[priority],
        "mappingNotificationId": mappingNotificationId,
        "finishMessage": finishMessage,
      };
}

class Video {
  Video({
    @required this.snapshotUrl,
    @required this.videoUrls,
    @required this.videoTypeCode,
    @required this.hasAudio,
    @required this.originalVideoUrl,
    @required this.createTime,
  });

  String snapshotUrl;
  VideoUrls videoUrls;
  VideoVideoTypeCode videoTypeCode;
  bool hasAudio;
  String originalVideoUrl;
  DateTime createTime;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        snapshotUrl: json["snapshotUrl"],
        videoUrls: VideoUrls.fromJson(json["videoUrls"]),
        videoTypeCode: videoVideoTypeCodeValues.map[json["videoTypeCode"]],
        hasAudio: json["hasAudio"],
        originalVideoUrl: json["originalVideoUrl"],
        createTime: DateTime.parse(json["createTime"]),
      );

  Map<String, dynamic> toJson() => {
        "snapshotUrl": snapshotUrl,
        "videoUrls": videoUrls.toJson(),
        "videoTypeCode": videoVideoTypeCodeValues.reverse[videoTypeCode],
        "hasAudio": hasAudio,
        "originalVideoUrl": originalVideoUrl,
        "createTime": createTime.toIso8601String(),
      };
}

enum VideoVideoTypeCode { GUIDED_STEP }

final videoVideoTypeCodeValues =
    EnumValues({"guided-step": VideoVideoTypeCode.GUIDED_STEP});

class VideoUrls {
  VideoUrls({
    @required this.ios,
    @required this.android,
  });

  String ios;
  String android;

  factory VideoUrls.fromJson(Map<String, dynamic> json) => VideoUrls(
        ios: json["ios"],
        android: json["android"],
      );

  Map<String, dynamic> toJson() => {
        "ios": ios,
        "android": android,
      };
}

class ContentIngredientLine {
  ContentIngredientLine({
    @required this.category,
    @required this.amount,
    @required this.unit,
    @required this.ingredientId,
    @required this.categoryId,
    @required this.relatedRecipeSearchTerm,
    @required this.ingredient,
    @required this.id,
    @required this.remainder,
    @required this.quantity,
    @required this.wholeLine,
  });

  String category;
  FluffyAmount amount;
  NameEnum unit;
  String ingredientId;
  String categoryId;
  List<RelatedRecipeSearchTerm> relatedRecipeSearchTerm;
  String ingredient;
  String id;
  String remainder;
  dynamic quantity;
  String wholeLine;

  factory ContentIngredientLine.fromJson(Map<String, dynamic> json) =>
      ContentIngredientLine(
        category: json["category"],
        amount: FluffyAmount.fromJson(json["amount"]),
        unit: nameEnumValues.map[json["unit"]],
        ingredientId: json["ingredientId"],
        categoryId: json["categoryId"],
        relatedRecipeSearchTerm: List<RelatedRecipeSearchTerm>.from(
            json["relatedRecipeSearchTerm"]
                .map((x) => RelatedRecipeSearchTerm.fromJson(x))),
        ingredient: json["ingredient"],
        id: json["id"],
        remainder: json["remainder"],
        quantity: json["quantity"],
        wholeLine: json["wholeLine"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "amount": amount.toJson(),
        "unit": nameEnumValues.reverse[unit],
        "ingredientId": ingredientId,
        "categoryId": categoryId,
        "relatedRecipeSearchTerm":
            List<dynamic>.from(relatedRecipeSearchTerm.map((x) => x.toJson())),
        "ingredient": ingredient,
        "id": id,
        "remainder": remainder,
        "quantity": quantity,
        "wholeLine": wholeLine,
      };
}

class FluffyAmount {
  FluffyAmount({
    @required this.metric,
    @required this.imperial,
  });

  FluffyImperial metric;
  FluffyImperial imperial;

  factory FluffyAmount.fromJson(Map<String, dynamic> json) => FluffyAmount(
        metric: FluffyImperial.fromJson(json["metric"]),
        imperial: FluffyImperial.fromJson(json["imperial"]),
      );

  Map<String, dynamic> toJson() => {
        "metric": metric.toJson(),
        "imperial": imperial.toJson(),
      };
}

class FluffyImperial {
  FluffyImperial({
    @required this.unit,
    @required this.quantity,
  });

  ImperialUnit unit;
  dynamic quantity;

  factory FluffyImperial.fromJson(Map<String, dynamic> json) => FluffyImperial(
        unit: ImperialUnit.fromJson(json["unit"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "unit": unit.toJson(),
        "quantity": quantity,
      };
}

class RelatedRecipeSearchTerm {
  RelatedRecipeSearchTerm({
    @required this.allowedIngredient,
  });

  String allowedIngredient;

  factory RelatedRecipeSearchTerm.fromJson(Map<String, dynamic> json) =>
      RelatedRecipeSearchTerm(
        allowedIngredient: json["allowedIngredient"],
      );

  Map<String, dynamic> toJson() => {
        "allowedIngredient": allowedIngredient,
      };
}

class MoreContent {
  MoreContent({
    @required this.mobileSectionName,
    @required this.queryParams,
    @required this.feed,
  });

  MoreContentMobileSectionName mobileSectionName;
  QueryParams queryParams;
  List<dynamic> feed;

  factory MoreContent.fromJson(Map<String, dynamic> json) => MoreContent(
        mobileSectionName:
            moreContentMobileSectionNameValues.map[json["mobileSectionName"]],
        queryParams: QueryParams.fromJson(json["queryParams"]),
        feed: List<dynamic>.from(json["feed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName":
            moreContentMobileSectionNameValues.reverse[mobileSectionName],
        "queryParams": queryParams.toJson(),
        "feed": List<dynamic>.from(feed.map((x) => x)),
      };
}

enum MoreContentMobileSectionName {
  MORE_FROM_YUMMLY,
  MORE_FROM_PORK,
  RELATED,
  ESSENTIAL_TOOLS
}

final moreContentMobileSectionNameValues = EnumValues({
  "Essential Tools": MoreContentMobileSectionName.ESSENTIAL_TOOLS,
  "More From Pork": MoreContentMobileSectionName.MORE_FROM_PORK,
  "More From Yummly": MoreContentMobileSectionName.MORE_FROM_YUMMLY,
  "Related": MoreContentMobileSectionName.RELATED
});

class QueryParams {
  QueryParams({
    @required this.start,
    @required this.authorId,
    @required this.id,
    @required this.apiFeedType,
    @required this.relatedContentType,
  });

  int start;
  DisplayName authorId;
  String id;
  ApiFeedType apiFeedType;
  RelatedContentType relatedContentType;

  factory QueryParams.fromJson(Map<String, dynamic> json) => QueryParams(
        start: json["start"],
        authorId: json["authorId"] == null
            ? null
            : displayNameValues.map[json["authorId"]],
        id: json["id"],
        apiFeedType: apiFeedTypeValues.map[json["apiFeedType"]],
        relatedContentType: json["relatedContentType"] == null
            ? null
            : relatedContentTypeValues.map[json["relatedContentType"]],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "authorId":
            authorId == null ? null : displayNameValues.reverse[authorId],
        "id": id,
        "apiFeedType": apiFeedTypeValues.reverse[apiFeedType],
        "relatedContentType": relatedContentType == null
            ? null
            : relatedContentTypeValues.reverse[relatedContentType],
      };
}

enum ApiFeedType { MORE_FROM, RELATED }

final apiFeedTypeValues = EnumValues(
    {"moreFrom": ApiFeedType.MORE_FROM, "related": ApiFeedType.RELATED});

enum RelatedContentType { PRODUCT }

final relatedContentTypeValues =
    EnumValues({"product": RelatedContentType.PRODUCT});

class Nutrition {
  Nutrition({
    @required this.mobileSectionName,
    @required this.nutritionEstimates,
  });

  NutritionMobileSectionName mobileSectionName;
  List<NutritionEstimate> nutritionEstimates;

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        mobileSectionName:
            nutritionMobileSectionNameValues.map[json["mobileSectionName"]],
        nutritionEstimates: List<NutritionEstimate>.from(
            json["nutritionEstimates"]
                .map((x) => NutritionEstimate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName":
            nutritionMobileSectionNameValues.reverse[mobileSectionName],
        "nutritionEstimates":
            List<dynamic>.from(nutritionEstimates.map((x) => x.toJson())),
      };
}

enum NutritionMobileSectionName { NUTRITION }

final nutritionMobileSectionNameValues =
    EnumValues({"Nutrition": NutritionMobileSectionName.NUTRITION});

class NutritionEstimate {
  NutritionEstimate({
    @required this.attribute,
    @required this.value,
    @required this.unit,
    @required this.display,
  });

  String attribute;
  double value;
  NutritionEstimateUnit unit;
  NutritionEstimateDisplay display;

  factory NutritionEstimate.fromJson(Map<String, dynamic> json) =>
      NutritionEstimate(
        attribute: json["attribute"],
        value: json["value"].toDouble(),
        unit: NutritionEstimateUnit.fromJson(json["unit"]),
        display: NutritionEstimateDisplay.fromJson(json["display"]),
      );

  Map<String, dynamic> toJson() => {
        "attribute": attribute,
        "value": value,
        "unit": unit.toJson(),
        "display": display.toJson(),
      };
}

class NutritionEstimateDisplay {
  NutritionEstimateDisplay({
    @required this.value,
    @required this.unit,
    @required this.percentDailyValue,
  });

  dynamic value;
  DisplayUnit unit;
  dynamic percentDailyValue;

  factory NutritionEstimateDisplay.fromJson(Map<String, dynamic> json) =>
      NutritionEstimateDisplay(
        value: json["value"],
        unit: displayUnitValues.map[json["unit"]],
        percentDailyValue: json["percentDailyValue"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": displayUnitValues.reverse[unit],
        "percentDailyValue": percentDailyValue,
      };
}

enum DisplayUnit { EMPTY, MG, G }

final displayUnitValues = EnumValues(
    {"": DisplayUnit.EMPTY, "g": DisplayUnit.G, "mg": DisplayUnit.MG});

enum ValueEnum { EMPTY, LESS_THAN_1_G }

final valueEnumValues =
    EnumValues({"": ValueEnum.EMPTY, "less than 1 g": ValueEnum.LESS_THAN_1_G});

class NutritionEstimateUnit {
  NutritionEstimateUnit({
    @required this.name,
    @required this.abbreviation,
    @required this.plural,
    @required this.decimal,
  });

  UnitName name;
  Abbreviation abbreviation;
  FluffyPlural plural;
  bool decimal;

  factory NutritionEstimateUnit.fromJson(Map<String, dynamic> json) =>
      NutritionEstimateUnit(
        name: unitNameValues.map[json["name"]],
        abbreviation: abbreviationValues.map[json["abbreviation"]],
        plural: fluffyPluralValues.map[json["plural"]],
        decimal: json["decimal"],
      );

  Map<String, dynamic> toJson() => {
        "name": unitNameValues.reverse[name],
        "abbreviation": abbreviationValues.reverse[abbreviation],
        "plural": fluffyPluralValues.reverse[plural],
        "decimal": decimal,
      };
}

enum Abbreviation { KCAL, G, IU }

final abbreviationValues = EnumValues(
    {"g": Abbreviation.G, "IU": Abbreviation.IU, "kcal": Abbreviation.KCAL});

enum UnitName { CALORIE, GRAM, IU }

final unitNameValues = EnumValues(
    {"calorie": UnitName.CALORIE, "gram": UnitName.GRAM, "IU": UnitName.IU});

enum FluffyPlural { CALORIES, GRAMS, IU }

final fluffyPluralValues = EnumValues({
  "calories": FluffyPlural.CALORIES,
  "grams": FluffyPlural.GRAMS,
  "IU": FluffyPlural.IU
});

class Reviews {
  Reviews({
    @required this.mobileSectionName,
    @required this.totalReviewCount,
    @required this.averageRating,
    @required this.reviews,
    @required this.thisUserReview,
    @required this.sortBy,
  });

  ReviewsMobileSectionName mobileSectionName;
  int totalReviewCount;
  double averageRating;
  List<dynamic> reviews;
  String thisUserReview;
  SortBy sortBy;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        mobileSectionName:
            reviewsMobileSectionNameValues.map[json["mobileSectionName"]],
        totalReviewCount: json["totalReviewCount"],
        averageRating: json["averageRating"].toDouble(),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        thisUserReview: json["thisUserReview"],
        sortBy: sortByValues.map[json["sortBy"]],
      );

  Map<String, dynamic> toJson() => {
        "mobileSectionName":
            reviewsMobileSectionNameValues.reverse[mobileSectionName],
        "totalReviewCount": totalReviewCount,
        "averageRating": averageRating,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "thisUserReview": thisUserReview,
        "sortBy": sortByValues.reverse[sortBy],
      };
}

enum ReviewsMobileSectionName { REVIEWS }

final reviewsMobileSectionNameValues =
    EnumValues({"Reviews": ReviewsMobileSectionName.REVIEWS});

enum SortBy { CREATE_TIME }

final sortByValues = EnumValues({"create-time": SortBy.CREATE_TIME});

class Tags {
  Tags({
    @required this.course,
    @required this.cuisine,
    @required this.difficulty,
    @required this.nutrition,
    @required this.technique,
    @required this.dish,
    @required this.holiday,
  });

  List<Adtag> course;
  List<Adtag> cuisine;
  List<Adtag> difficulty;
  List<Adtag> nutrition;
  List<Adtag> technique;
  List<Adtag> dish;
  List<Adtag> holiday;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        course: json["course"] == null
            ? null
            : List<Adtag>.from(json["course"].map((x) => Adtag.fromJson(x))),
        cuisine: json["cuisine"] == null
            ? null
            : List<Adtag>.from(json["cuisine"].map((x) => Adtag.fromJson(x))),
        difficulty: json["difficulty"] == null
            ? null
            : List<Adtag>.from(
                json["difficulty"].map((x) => Adtag.fromJson(x))),
        nutrition: json["nutrition"] == null
            ? null
            : List<Adtag>.from(json["nutrition"].map((x) => Adtag.fromJson(x))),
        technique: json["technique"] == null
            ? null
            : List<Adtag>.from(json["technique"].map((x) => Adtag.fromJson(x))),
        dish: json["dish"] == null
            ? null
            : List<Adtag>.from(json["dish"].map((x) => Adtag.fromJson(x))),
        holiday: json["holiday"] == null
            ? null
            : List<Adtag>.from(json["holiday"].map((x) => Adtag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course": course == null
            ? null
            : List<dynamic>.from(course.map((x) => x.toJson())),
        "cuisine": cuisine == null
            ? null
            : List<dynamic>.from(cuisine.map((x) => x.toJson())),
        "difficulty": difficulty == null
            ? null
            : List<dynamic>.from(difficulty.map((x) => x.toJson())),
        "nutrition": nutrition == null
            ? null
            : List<dynamic>.from(nutrition.map((x) => x.toJson())),
        "technique": technique == null
            ? null
            : List<dynamic>.from(technique.map((x) => x.toJson())),
        "dish": dish == null
            ? null
            : List<dynamic>.from(dish.map((x) => x.toJson())),
        "holiday": holiday == null
            ? null
            : List<dynamic>.from(holiday.map((x) => x.toJson())),
      };
}

class Adtag {
  Adtag({
    @required this.displayName,
    @required this.tagUrl,
  });

  String displayName;
  String tagUrl;

  factory Adtag.fromJson(Map<String, dynamic> json) => Adtag(
        displayName: json["display-name"],
        tagUrl: json["tag-url"],
      );

  Map<String, dynamic> toJson() => {
        "display-name": displayName,
        "tag-url": tagUrl,
      };
}

class TagsAds {
  TagsAds({
    @required this.adtag,
  });

  List<Adtag> adtag;

  factory TagsAds.fromJson(Map<String, dynamic> json) => TagsAds(
        adtag: List<Adtag>.from(json["adtag"].map((x) => Adtag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "adtag": List<dynamic>.from(adtag.map((x) => x.toJson())),
      };
}

enum UnitSystem { IMPERIAL }

final unitSystemValues = EnumValues({"imperial": UnitSystem.IMPERIAL});

class Videos {
  Videos({
    @required this.snapshotUrl,
    @required this.videoUrls,
    @required this.videoDetails,
    @required this.originalVideoUrl,
    @required this.createTime,
  });

  String snapshotUrl;
  VideoUrls videoUrls;
  VideoDetails videoDetails;
  String originalVideoUrl;
  DateTime createTime;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        snapshotUrl: json["snapshotUrl"],
        videoUrls: VideoUrls.fromJson(json["videoUrls"]),
        videoDetails: VideoDetails.fromJson(json["videoDetails"]),
        originalVideoUrl: json["originalVideoUrl"],
        createTime: DateTime.parse(json["createTime"]),
      );

  Map<String, dynamic> toJson() => {
        "snapshotUrl": snapshotUrl,
        "videoUrls": videoUrls.toJson(),
        "videoDetails": videoDetails.toJson(),
        "originalVideoUrl": originalVideoUrl,
        "createTime": createTime.toIso8601String(),
      };
}

class VideoDetails {
  VideoDetails({
    @required this.ios,
    @required this.android,
  });

  List<Android> ios;
  List<Android> android;

  factory VideoDetails.fromJson(Map<String, dynamic> json) => VideoDetails(
        ios: List<Android>.from(json["ios"].map((x) => Android.fromJson(x))),
        android:
            List<Android>.from(json["android"].map((x) => Android.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ios": List<dynamic>.from(ios.map((x) => x.toJson())),
        "android": List<dynamic>.from(android.map((x) => x.toJson())),
      };
}

class Android {
  Android({
    @required this.videoTypeCode,
    @required this.videoUrl,
    @required this.hasAudio,
  });

  AndroidVideoTypeCode videoTypeCode;
  String videoUrl;
  bool hasAudio;

  factory Android.fromJson(Map<String, dynamic> json) => Android(
        videoTypeCode: androidVideoTypeCodeValues.map[json["videoTypeCode"]],
        videoUrl: json["videoUrl"],
        hasAudio: json["hasAudio"],
      );

  Map<String, dynamic> toJson() => {
        "videoTypeCode": androidVideoTypeCodeValues.reverse[videoTypeCode],
        "videoUrl": videoUrl,
        "hasAudio": hasAudio,
      };
}

enum AndroidVideoTypeCode { STEP_MONTAGE }

final androidVideoTypeCodeValues =
    EnumValues({"step-montage": AndroidVideoTypeCode.STEP_MONTAGE});

class Yums {
  Yums({
    @required this.count,
    @required this.thisUser,
  });

  int count;
  ThisUser thisUser;

  factory Yums.fromJson(Map<String, dynamic> json) => Yums(
        count: json["count"],
        thisUser: thisUserValues.map[json["this-user"]],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "this-user": thisUserValues.reverse[thisUser],
      };
}

enum ThisUser { NONE }

final thisUserValues = EnumValues({"none": ThisUser.NONE});

class FeedDisplay {
  FeedDisplay({
    @required this.displayName,
    @required this.images,
    @required this.flag,
    @required this.source,
    @required this.profiles,
    @required this.displayPrepStepsInline,
    @required this.collections,
  });

  String displayName;
  List<String> images;
  Flag flag;
  Source source;
  List<Profile> profiles;
  bool displayPrepStepsInline;
  List<dynamic> collections;

  factory FeedDisplay.fromJson(Map<String, dynamic> json) => FeedDisplay(
        displayName: json["displayName"],
        images: List<String>.from(json["images"].map((x) => x)),
        flag: flagValues.map[json["flag"]],
        source: Source.fromJson(json["source"]),
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
        displayPrepStepsInline: json["displayPrepStepsInline"],
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "images": List<dynamic>.from(images.map((x) => x)),
        "flag": flagValues.reverse[flag],
        "source": source.toJson(),
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
        "displayPrepStepsInline": displayPrepStepsInline,
        "collections": List<dynamic>.from(collections.map((x) => x)),
      };
}

enum Flag { POPULAR_ON_YUMMLY }

final flagValues = EnumValues({"Popular On Yummly": Flag.POPULAR_ON_YUMMLY});

class Profile {
  Profile({
    @required this.profileName,
    @required this.displayName,
    @required this.siteUrl,
    @required this.pictureUrl,
    @required this.pageUrl,
    @required this.description,
    @required this.type,
    @required this.profileUrl,
  });

  String profileName;
  DisplayName displayName;
  String siteUrl;
  String pictureUrl;
  PageUrl pageUrl;
  String description;
  ProfileType type;
  String profileUrl;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        profileName: json["profileName"],
        displayName: displayNameValues.map[json["displayName"]],
        siteUrl: json["siteUrl"],
        pictureUrl: json["pictureUrl"],
        pageUrl: pageUrlValues.map[json["pageUrl"]],
        description: json["description"],
        type: profileTypeValues.map[json["type"]],
        profileUrl: json["profileUrl"],
      );

  Map<String, dynamic> toJson() => {
        "profileName": profileName,
        "displayName": displayNameValues.reverse[displayName],
        "siteUrl": siteUrl,
        "pictureUrl": pictureUrl,
        "pageUrl": pageUrlValues.reverse[pageUrl],
        "description": description,
        "type": profileTypeValues.reverse[type],
        "profileUrl": profileUrl,
      };
}

enum PageUrl { YUMMLY, PORK }

final pageUrlValues =
    EnumValues({"pork": PageUrl.PORK, "yummly": PageUrl.YUMMLY});

enum ProfileType { CONTENT_OWNER }

final profileTypeValues =
    EnumValues({"content-owner": ProfileType.CONTENT_OWNER});

class Source {
  Source({
    @required this.sourceRecipeUrl,
    @required this.sourceFaviconUrl,
    @required this.sourceHttpsOk,
    @required this.sourceInFrame,
    @required this.sourceDisplayName,
    @required this.proSource,
    @required this.sourceSiteUrl,
    @required this.introVideo,
    @required this.eyebrowText,
    @required this.sourcePageUrl,
    @required this.marketingCopy,
    @required this.sourceHttpOk,
    @required this.marketingImage,
  });

  String sourceRecipeUrl;
  String sourceFaviconUrl;
  bool sourceHttpsOk;
  bool sourceInFrame;
  DisplayName sourceDisplayName;
  String proSource;
  String sourceSiteUrl;
  IntroVideo introVideo;
  String eyebrowText;
  PageUrl sourcePageUrl;
  String marketingCopy;
  bool sourceHttpOk;
  String marketingImage;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        sourceRecipeUrl: json["sourceRecipeUrl"],
        sourceFaviconUrl: json["sourceFaviconUrl"],
        sourceHttpsOk: json["sourceHttpsOk"],
        sourceInFrame: json["sourceInFrame"],
        sourceDisplayName: displayNameValues.map[json["sourceDisplayName"]],
        proSource: json["proSource"],
        sourceSiteUrl: json["sourceSiteUrl"],
        introVideo: IntroVideo.fromJson(json["introVideo"]),
        eyebrowText: json["eyebrowText"],
        sourcePageUrl: pageUrlValues.map[json["sourcePageUrl"]],
        marketingCopy: json["marketingCopy"],
        sourceHttpOk: json["sourceHttpOk"],
        marketingImage: json["marketingImage"],
      );

  Map<String, dynamic> toJson() => {
        "sourceRecipeUrl": sourceRecipeUrl,
        "sourceFaviconUrl": sourceFaviconUrl,
        "sourceHttpsOk": sourceHttpsOk,
        "sourceInFrame": sourceInFrame,
        "sourceDisplayName": displayNameValues.reverse[sourceDisplayName],
        "proSource": proSource,
        "sourceSiteUrl": sourceSiteUrl,
        "introVideo": introVideo.toJson(),
        "eyebrowText": eyebrowText,
        "sourcePageUrl": pageUrlValues.reverse[sourcePageUrl],
        "marketingCopy": marketingCopy,
        "sourceHttpOk": sourceHttpOk,
        "marketingImage": marketingImage,
      };
}

class IntroVideo {
  IntroVideo({
    @required this.id,
    @required this.originalUrl,
    @required this.hlsUrl,
    @required this.dashUrl,
    @required this.hasAudio,
    @required this.snapshot,
  });

  String id;
  String originalUrl;
  String hlsUrl;
  String dashUrl;
  String hasAudio;
  Snapshot snapshot;

  factory IntroVideo.fromJson(Map<String, dynamic> json) => IntroVideo(
        id: json["id"],
        originalUrl: json["originalUrl"],
        hlsUrl: json["hlsUrl"],
        dashUrl: json["dashUrl"],
        hasAudio: json["hasAudio"],
        snapshot: Snapshot.fromJson(json["snapshot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "originalUrl": originalUrl,
        "hlsUrl": hlsUrl,
        "dashUrl": dashUrl,
        "hasAudio": hasAudio,
        "snapshot": snapshot.toJson(),
      };
}

class Snapshot {
  Snapshot({
    @required this.original,
    @required this.resizable,
  });

  String original;
  String resizable;

  factory Snapshot.fromJson(Map<String, dynamic> json) => Snapshot(
        original: json["original"],
        resizable: json["resizable"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "resizable": resizable,
      };
}

enum RecipeType { GUIDED_RECIPE, YUMMLY_ORIGINAL, BASIC_RECIPE }

final recipeTypeValues = EnumValues({
  "BasicRecipe": RecipeType.BASIC_RECIPE,
  "GuidedRecipe": RecipeType.GUIDED_RECIPE,
  "YummlyOriginal": RecipeType.YUMMLY_ORIGINAL
});

class FeedSeo {
  FeedSeo({
    @required this.web,
    @required this.spotlightSearch,
    @required this.firebase,
  });

  Web web;
  SpotlightSearch spotlightSearch;
  PurpleFirebase firebase;

  factory FeedSeo.fromJson(Map<String, dynamic> json) => FeedSeo(
        web: Web.fromJson(json["web"]),
        spotlightSearch: SpotlightSearch.fromJson(json["spotlightSearch"]),
        firebase: PurpleFirebase.fromJson(json["firebase"]),
      );

  Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
      };
}

class PurpleFirebase {
  PurpleFirebase({
    @required this.webUrl,
    @required this.appUrl,
    @required this.name,
    @required this.description,
  });

  String webUrl;
  String appUrl;
  String name;
  String description;

  factory PurpleFirebase.fromJson(Map<String, dynamic> json) => PurpleFirebase(
        webUrl: json["webUrl"],
        appUrl: json["appUrl"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "webUrl": webUrl,
        "appUrl": appUrl,
        "name": name,
        "description": description,
      };
}

class SpotlightSearch {
  SpotlightSearch({
    @required this.keywords,
    @required this.noindex,
  });

  List<String> keywords;
  bool noindex;

  factory SpotlightSearch.fromJson(Map<String, dynamic> json) =>
      SpotlightSearch(
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        noindex: json["noindex"],
      );

  Map<String, dynamic> toJson() => {
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "noindex": noindex,
      };
}

class Web {
  Web({
    @required this.noindex,
    @required this.canonicalTerm,
    @required this.metaTags,
    @required this.linkTags,
    @required this.imageUrl,
  });

  bool noindex;
  String canonicalTerm;
  MetaTags metaTags;
  List<LinkTag> linkTags;
  String imageUrl;

  factory Web.fromJson(Map<String, dynamic> json) => Web(
        noindex: json["noindex"],
        canonicalTerm: json["canonical-term"],
        metaTags: MetaTags.fromJson(json["meta-tags"]),
        linkTags: List<LinkTag>.from(
            json["link-tags"].map((x) => LinkTag.fromJson(x))),
        imageUrl: json["image-url"],
      );

  Map<String, dynamic> toJson() => {
        "noindex": noindex,
        "canonical-term": canonicalTerm,
        "meta-tags": metaTags.toJson(),
        "link-tags": List<dynamic>.from(linkTags.map((x) => x.toJson())),
        "image-url": imageUrl,
      };
}

class LinkTag {
  LinkTag({
    @required this.rel,
    @required this.href,
    @required this.hreflang,
  });

  Rel rel;
  String href;
  Hreflang hreflang;

  factory LinkTag.fromJson(Map<String, dynamic> json) => LinkTag(
        rel: relValues.map[json["rel"]],
        href: json["href"],
        hreflang: json["hreflang"] == null
            ? null
            : hreflangValues.map[json["hreflang"]],
      );

  Map<String, dynamic> toJson() => {
        "rel": relValues.reverse[rel],
        "href": href,
        "hreflang": hreflang == null ? null : hreflangValues.reverse[hreflang],
      };
}

enum Hreflang { EN, EN_GB }

final hreflangValues = EnumValues({"en": Hreflang.EN, "en-GB": Hreflang.EN_GB});

enum Rel { CANONICAL, ALTERNATE }

final relValues =
    EnumValues({"alternate": Rel.ALTERNATE, "canonical": Rel.CANONICAL});

class MetaTags {
  MetaTags({
    @required this.title,
    @required this.description,
  });

  String title;
  String description;

  factory MetaTags.fromJson(Map<String, dynamic> json) => MetaTags(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

enum FeedType { SINGLE_RECIPE }

final feedTypeValues = EnumValues({"single recipe": FeedType.SINGLE_RECIPE});

class RecipeModelSeo {
  RecipeModelSeo({
    @required this.web,
    @required this.spotlightSearch,
    @required this.firebase,
  });

  SpotlightSearchClass web;
  SpotlightSearchClass spotlightSearch;
  SpotlightSearchClass firebase;

  factory RecipeModelSeo.fromJson(Map<String, dynamic> json) => RecipeModelSeo(
        web: SpotlightSearchClass.fromJson(json["web"]),
        spotlightSearch: SpotlightSearchClass.fromJson(json["spotlightSearch"]),
        firebase: SpotlightSearchClass.fromJson(json["firebase"]),
      );

  Map<String, dynamic> toJson() => {
        "web": web.toJson(),
        "spotlightSearch": spotlightSearch.toJson(),
        "firebase": firebase.toJson(),
      };
}

class SpotlightSearchClass {
  SpotlightSearchClass({
    @required this.noindex,
  });

  bool noindex;

  factory SpotlightSearchClass.fromJson(Map<String, dynamic> json) =>
      SpotlightSearchClass(
        noindex: json["noindex"],
      );

  Map<String, dynamic> toJson() => {
        "noindex": noindex,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
