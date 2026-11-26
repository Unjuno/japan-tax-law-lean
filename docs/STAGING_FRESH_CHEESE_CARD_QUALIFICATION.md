# STAGING: FreshCheeseCardQualification

- Normative id: NORM|06ecf4e83a75240fefb191c05f7df0f5ead383672e0052e4472472d1cde8dd3f
- Law: 335CO0000000069, revision 335CO0000000069_20260401_508CO0000000085, art. 32(2)(5)
- Clause: 関税率表第〇四〇六・一〇号に掲げるフレッシュチーズ及びカード（いずれも乾燥固形分が全重量の四十八パーセント以下のもの（一個の重量が四グラム以下の細片にし、冷凍し、かつ、正味重量が五キログラムを超える直接包装にしたものに限る。）、関税割当チーズ及びクリームチーズ（軟質で展延性のある熟成していないリンドレスチーズであつて、乾燥固形分のうちに占める乳脂肪分の割合、無脂肪ベースでの全重量のうちに占める水分の割合及び全重量のうちに占める乾燥固形分の割合が、それぞれコーデックスのクリームチーズの規格（ＣＯＤＥＸ
- Model: three explicit numeric conditions (dry solid <=48%, piece <=4g, net >5kg).
- Implementation: `JapanTaxLaw/FreshCheeseCardQualification.lean`.
- Independent spec: `JapanTaxLaw/FreshCheeseCardQualificationSpec.lean`.
- Tests: `JapanTaxLaw/FreshCheeseCardQualificationTests.lean` (seven kernel-decided examples).
- Review: `docs/adversarial/reviews-fresh-cheese-card-qualification.md`.
- NOT MODELLED: CODEX standards, detailed cheese recognition, classification, rounding.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
