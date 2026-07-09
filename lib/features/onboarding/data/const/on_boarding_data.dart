import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/features/onboarding/data/models/onboarding_page_data_model.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/on_boarding_titles.dart';

final pages = [
  OnBoardingPageModel(
    backgroundImage: Assets.svgsPageViewItem1BackgroundImage,
    image: Assets.svgsPageViewItem1Image,
    title: OnBoardingPage1TitleTextWidget(),
    showSkip: true,
    description:
        "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
  ),
  OnBoardingPageModel(
    backgroundImage: Assets.svgsPageViewItem2BackgroundImage,
    image: Assets.svgsPageViewItem2Image,
    title: OnBoardingPage2TitleTextWidget(),
    description:
        "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
  ),
];
