# Adversarial Review — 登録免許税 別表第一（二）十〜十七（バッチ G）

- **レビュー日**: 2026-11-18
- **レビュア役割**: Adversarial Review Agent（形式化担当 W-S / W-T / W-U から独立）
- **対象モジュール（読み取り専用・変更していない）**:
  - `JapanTaxLaw/RegistryCopyrightFees.lean`（十 著作権 / 十一 出版権 / 十二 著作隣接権、W-S）
  - `JapanTaxLaw/RegistryPatentFees.lean`（十三 特許権 / 十四 実用新案権、W-T）
  - `JapanTaxLaw/RegistryDesignTrademarkFees.lean`（十五 意匠権 / 十六 商標権 / 十七 回路配置利用権、W-U）
- **一次資料（pinned・改変禁止）**: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
  - law_id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
  - 適用日 2026-11-01。構造体 `law_full_text.children[1].children[508]`（別表第一）の `AppdxTable` を直接 parse。
- **抽出方法**: 形式化担当の STAGING を信じず、JSON の `TableRow` / `TableColumn` を再帰走査して原文 fee string を取得（行 index は別表第一テーブル内の 0-based row）。日本語数字（三千・一万五千・三万 等）を自前で Arabic に変換して照合。

---

## 1. 独立抽出した fee 一覧（原文 → 抽出値 → Lean def）

原文文字列は `#` で区切った 3 列（区分 | 課税標準 | fee）をそのまま転記したもの。`row` は原文テーブル行 index。全 **81** 項目（定額 63 / 割合 18）を抽出。

### 十 著作権の登録（著作権の信託の登録を含む。）— W-S

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 219 | （一）イ 相続・法人合併 | `著作権の件数 / 一件につき三千円` | 3,000 | `copyrightTransferInheritanceOrMergerFee` | ✅ |
| 220 | （一）ロ その他 | `著作権の件数 / 一件につき一万八千円` | 18,000 | `copyrightTransferOtherFee` | ✅ |
| 221 | （二）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `copyrightPledgeEstablishmentRate` | ✅ |
| 223 | （三）イ 質権移転・相続/合併 | `著作権の件数 / 一件につき千五百円` | 1,500 | `copyrightPledgeTransferInheritanceOrMergerFee` | ✅ |
| 224 | （三）ロ 質権移転・その他 | `著作権の件数 / 一件につき三千円` | 3,000 | `copyrightPledgeTransferOtherFee` | ✅ |
| 225 | （四）無名/変名の実名登録 | `著作物の数 / 一個につき九千円` | 9,000 | `copyrightRealNameRegistrationFee` | ✅ |
| 227 | （五）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `copyrightPledgeTrustRate` | ✅ |
| 228 | （五）ロ 質権以外の権利の信託 | `著作権の件数 / 一件につき三千円` | 3,000 | `copyrightTrustOtherRightFee` | ✅ |
| 229 | （六）第一発行/公表・創作年月日 | `著作権の件数又は著作物の数 / 一件又は一個につき三千円` | 3,000 | `copyrightFirstPublicationDateRegistrationFee` | ✅ |
| 230 | （七）回復/更正/変更 | `…一件又は一個につき千円` | 1,000 | `copyrightRestorationOrCorrectionFee` | ✅ |
| 231 | （八）登録の抹消 | `…一件又は一個につき千円` | 1,000 | `copyrightCancellationFee` | ✅ |

### 十一 出版権の登録（出版権の信託の登録を含む。）

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 233 | （一）設定 | `出版権の件数 / 一件につき三万円` | 30,000 | `publishingRightEstablishmentFee` | ✅ |
| 235 | （二）イ 相続・法人合併 | `出版権の件数 / 一件につき三千円` | 3,000 | `publishingRightTransferInheritanceOrMergerFee` | ✅ |
| 236 | （二）ロ その他 | `出版権の件数 / 一件につき一万八千円` | 18,000 | `publishingRightTransferOtherFee` | ✅ |
| 237 | （三）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `publishingRightPledgeEstablishmentRate` | ✅ |
| 239 | （四）イ 質権移転・相続/合併 | `出版権の件数 / 一件につき千五百円` | 1,500 | `publishingRightPledgeTransferInheritanceOrMergerFee` | ✅ |
| 240 | （四）ロ 質権移転・その他 | `出版権の件数 / 一件につき三千円` | 3,000 | `publishingRightPledgeTransferOtherFee` | ✅ |
| 242 | （五）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `publishingRightPledgeTrustRate` | ✅ |
| 243 | （五）ロ 質権以外の権利の信託 | `出版権の件数 / 一件につき三千円` | 3,000 | `publishingRightTrustOtherRightFee` | ✅ |
| 244 | （六）回復/更正/変更 | `出版権の件数 / 一件につき千円` | 1,000 | `publishingRightRestorationOrCorrectionFee` | ✅ |
| 245 | （七）登録の抹消 | `出版権の件数 / 一件につき千円` | 1,000 | `publishingRightCancellationFee` | ✅ |

### 十二 著作隣接権の登録（著作隣接権の信託の登録を含む。）

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 248 | （一）イ 相続・法人合併 | `著作隣接権の件数 / 一件につき三千円` | 3,000 | `relatedRightTransferInheritanceOrMergerFee` | ✅ |
| 249 | （一）ロ その他 | `著作隣接権の件数 / 一件につき九千円` | 9,000 | `relatedRightTransferOtherFee` | ✅ |
| 250 | （二）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `relatedRightPledgeEstablishmentRate` | ✅ |
| 252 | （三）イ 質権移転・相続/合併 | `著作隣接権の件数 / 一件につき千五百円` | 1,500 | `relatedRightPledgeTransferInheritanceOrMergerFee` | ✅ |
| 253 | （三）ロ 質権移転・その他 | `著作隣接権の件数 / 一件につき三千円` | 3,000 | `relatedRightPledgeTransferOtherFee` | ✅ |
| 255 | （四）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `relatedRightPledgeTrustRate` | ✅ |
| 256 | （四）ロ 質権以外の権利の信託 | `著作隣接権の件数 / 一件につき三千円` | 3,000 | `relatedRightTrustOtherRightFee` | ✅ |
| 257 | （五）回復/更正/変更 | `著作隣接権の件数 / 一件につき千円` | 1,000 | `relatedRightRestorationOrCorrectionFee` | ✅ |
| 258 | （六）登録の抹消 | `著作隣接権の件数 / 一件につき千円` | 1,000 | `relatedRightCancellationFee` | ✅ |

### 十三 特許権の登録（特許権の信託の登録を含む。）— W-T

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 261 | （一）イ 相続・法人合併 | `特許権の件数 / 一件につき三千円` | 3,000 | `patentTransferInheritanceOrMergerFee` | ✅ |
| 262 | （一）ロ その他 | `特許権の件数 / 一件につき一万五千円` | **15,000** | `patentTransferOtherFee = 15_000` | ✅（指示の 18,000 ではない。下記 §2 参照） |
| 263 | （二）専用実施権の設定/保存 | `専用実施権の件数 / 一件につき一万五千円` | 15,000 | `patentExclusiveRightEstablishmentOrPreservationFee` | ✅ |
| 264 | （三）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `patentPledgeEstablishmentOrDispositionRestrictionRate` | ✅ |
| 266 | （四）イ 相続・法人合併 | `特許権又は専用実施権（「特許権等」）の件数 / 一件につき千五百円` | 1,500 | `patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee` | ✅ |
| 267 | （四）ロ その他 | `特許権等の件数 / 一件につき三千円` | 3,000 | `patentExclusiveRightOrPledgeTransferOtherFee` | ✅ |
| 269 | （五）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `patentPledgeTrustRate` | ✅ |
| 270 | （五）ロ 質権以外の権利の信託 | `特許権等の件数 / 一件につき三千円` | 3,000 | `patentNonPledgeTrustFee` | ✅ |
| 271 | （六）付記/仮/回復/更正/変更 | `特許権等の件数 / 一件につき千円` | 1,000 | `patentMiscRegistrationFee` | ✅ |
| 272 | （七）登録の抹消 | `特許権等の件数 / 一件につき千円` | 1,000 | `patentCancellationFee` | ✅ |

### 十四 実用新案権の登録（実用新案権の信託の登録を含む。）

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 275 | （一）イ 相続・法人合併 | `実用新案権の件数 / 一件につき三千円` | 3,000 | `utilityModelTransferInheritanceOrMergerFee` | ✅ |
| 276 | （一）ロ その他 | `実用新案権の件数 / 一件につき九千円` | 9,000 | `utilityModelTransferOtherFee` | ✅ |
| 277 | （二）専用実施権の設定/保存 | `専用実施権の件数 / 一件につき九千円` | 9,000 | `utilityModelExclusiveRightEstablishmentOrPreservationFee` | ✅ |
| 278 | （三）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `utilityModelPledgeEstablishmentOrDispositionRestrictionRate` | ✅ |
| 280 | （四）イ 相続・法人合併 | `実用新案権等の件数 / 一件につき千五百円` | 1,500 | `utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee` | ✅ |
| 281 | （四）ロ その他 | `実用新案権等の件数 / 一件につき三千円` | 3,000 | `utilityModelExclusiveRightOrPledgeTransferOtherFee` | ✅ |
| 283 | （五）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `utilityModelPledgeTrustRate` | ✅ |
| 284 | （五）ロ 質権以外の権利の信託 | `実用新案権等の件数 / 一件につき三千円` | 3,000 | `utilityModelNonPledgeTrustFee` | ✅ |
| 285 | （六）付記/仮/回復/更正/変更 | `実用新案権等の件数 / 一件につき千円` | 1,000 | `utilityModelMiscRegistrationFee` | ✅ |
| 286 | （七）登録の抹消 | `実用新案権等の件数 / 一件につき千円` | 1,000 | `utilityModelCancellationFee` | ✅ |

### 十五 意匠権の登録（意匠権の信託の登録を含み、**国際登録簿への登録を除く。**）— W-U

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 289 | （一）イ 相続・法人合併 | `意匠権の件数 / 一件につき三千円` | 3,000 | `designTransferInheritanceOrMergerFee` | ✅ |
| 290 | （一）ロ その他 | `意匠権の件数 / 一件につき九千円` | 9,000 | `designTransferOtherFee` | ✅ |
| 291 | （二）専用実施権の設定/保存 | `専用実施権の件数 / 一件につき九千円` | 9,000 | `designExclusiveRightEstablishmentOrPreservationFee` | ✅ |
| 292 | （三）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `designPledgeSecurityRate` | ✅ |
| 294 | （四）イ 相続・法人合併 | `意匠権又は専用実施権（「意匠権等」）の件数 / 一件につき千五百円` | 1,500 | `designExclusiveRightTransferInheritanceOrMergerFee` | ✅ |
| 295 | （四）ロ その他 | `意匠権等の件数 / 一件につき三千円` | 3,000 | `designExclusiveRightTransferOtherFee` | ✅ |
| 297 | （五）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `designTrustPledgeRate` | ✅ |
| 298 | （五）ロ 質権以外の権利の信託 | `意匠権等の件数 / 一件につき三千円` | 3,000 | `designTrustNonPledgeFee` | ✅ |
| 299 | （六）付記/仮/回復/更正/変更 | `意匠権等の件数 / 一件につき千円` | 1,000 | `designUpdateRegistrationFee` | ✅ |
| 300 | （七）登録の抹消 | `意匠権等の件数 / 一件につき千円` | 1,000 | `designCancellationFee` | ✅ |

### 十六 商標権の登録（商標権の信託の登録を含み、**国際登録簿への登録を除く。**）

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 303 | （一）イ 相続・法人合併 | `商標権の件数 / 一件につき三千円` | 3,000 | `trademarkTransferInheritanceOrMergerFee` | ✅ |
| 304 | （一）ロ その他 | `商標権の件数 / 一件につき三万円` | 30,000 | `trademarkTransferOtherFee` | ✅ |
| 305 | （二）専用使用権/通常使用権の設定/保存 | `専用使用権又は通常使用権の件数 / 一件につき三万円` | 30,000 | `trademarkUseRightEstablishmentOrPreservationFee` | ✅ |
| 306 | （三）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `trademarkPledgeSecurityRate` | ✅ |
| 308 | （四）イ 相続・法人合併 | `商標権等の件数 / 一件につき三千円` | 3,000 | `trademarkUseRightTransferInheritanceOrMergerFee` | ✅ |
| 309 | （四）ロ その他 | `商標権等の件数 / 一件につき九千円` | 9,000 | `trademarkUseRightTransferOtherFee` | ✅ |
| 311 | （五）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `trademarkTrustPledgeRate` | ✅ |
| 312 | （五）ロ 質権以外の権利の信託 | `商標権等の件数 / 一件につき九千円` | 9,000 | `trademarkTrustNonPledgeFee` | ✅ |
| 313 | （六）付記/仮/回復/更正/変更 | `商標権等の件数 / 一件につき千円` | 1,000 | `trademarkUpdateRegistrationFee` | ✅ |
| 314 | （七）登録の抹消 | `商標権等の件数 / 一件につき千円` | 1,000 | `trademarkCancellationFee` | ✅ |

### 十七 回路配置利用権の登録（回路配置利用権の信託の登録を含む。）

| row | 条号区分 | 原文 fee string | 抽出値 | Lean def | 照合 |
|---|---|---|---|---|---|
| 316 | （一）設定 | `回路配置利用権の件数 / 一件につき一万八千円` | 18,000 | `circuitEstablishmentFee` | ✅ |
| 318 | （二）イ 相続・法人合併 | `回路配置利用権の件数 / 一件につき三千円` | 3,000 | `circuitTransferInheritanceOrMergerFee` | ✅ |
| 319 | （二）ロ その他 | `回路配置利用権の件数 / 一件につき九千円` | 9,000 | `circuitTransferOtherFee` | ✅ |
| 320 | （三）専用利用権/通常利用権の設定 | `専用利用権又は通常利用権の件数 / 一件につき九千円` | 9,000 | `circuitUseRightEstablishmentFee` | ✅ |
| 321 | （四）質権設定/処分制限 | `債権金額 / 千分の四` | 4/1000 | `circuitPledgeSecurityRate` | ✅ |
| 323 | （五）イ 相続・法人合併 | `回路配置利用権等の件数 / 一件につき千五百円` | 1,500 | `circuitUseRightTransferInheritanceOrMergerFee` | ✅ |
| 324 | （五）ロ その他 | `回路配置利用権等の件数 / 一件につき三千円` | 3,000 | `circuitUseRightTransferOtherFee` | ✅ |
| 326 | （六）イ 質権の信託 | `債権金額 / 千分の二` | 2/1000 | `circuitTrustPledgeRate` | ✅ |
| 327 | （六）ロ 質権以外の権利の信託 | `回路配置利用権等の件数 / 一件につき三千円` | 3,000 | `circuitTrustNonPledgeFee` | ✅ |
| 328 | （七）付記/仮/回復/更正/変更 | `回路配置利用権等の件数 / 一件につき千円` | 1,000 | `circuitUpdateRegistrationFee` | ✅ |
| 329 | （八）登録の抹消 | `回路配置利用権等の件数 / 一件につき千円` | 1,000 | `circuitCancellationFee` | ✅ |

**（参考）十八 育成者権の登録**: 原文 row 330–343 に存在するが、レビュー対象（十〜十七）外。W-U は `docs/STAGING_WU.md` および doc-comment で「原文に含まれない／対象外」と申告済み → BY-DESIGN（下記 §2）。

---

## 2. 照合結果

### 件数サマリ

| 分類 | 件数 | 意味 |
|---|---|---|
| **CONFIRMED** | **0（ゼロ）** | 原文と Lean の実際の食い違い（誤訳・桁違い・率違い・簡体字混入）は**検出されなかった**。81 項目すべてが一致。 |
| **BY-DESIGN** | **7** | caller-established／明示された境界として妥当と判定（下記 B-1〜B-7）。 |
| **UNRESOLVED** | **2** | 判断保留。pinned 原文十〜十七 のみでは決定不能で人間の法的レビューを要する（下記 U-1〜U-2）。 |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

### CONFIRMED（0 件）

- 金額: 定額 63 項目すべて一致（桁違いなし。8,000/18,000 等の誤記なし）。
- 率: 割合 18 項目すれべて `4/1000` または `2/1000` で一致。
- 簡体字混入: 3 モジュールの `def` 本文・doc-comment に簡体字（権→权、債→债、質→质、許→许、証→证、録→录 等）は**混入していない**。検出された `与` / `体` は正しい日本語漢字（「与えられた」「具体的」等）であり混入ではない。
  - 補足（モジュール外の観察）: `docs/STAGING_WT.md` には「特许権」という簡体字 `许` が見られるが、これは STAGING ドキュメント側の表記ゆれであり、Lean モジュールの `def` / doc-comment は「特許権」で統一されている。照合対象（Lean def）には影響しない。

### BY-DESIGN（7 件）

- **B-1 課税標準（債権金額）caller-established**: 3 モジュールすべての doc-comment に明記。割合型は与えられた `base` に税率を乗じる算術のみ。→ 境界として明示済み。
- **B-2 該当性・原因判定 caller-established**: 相続／法人の合併／その他、設定／保存／移転／信託／抹消 等の Bool を金額式に入れない設計が 3 モジュールすべてで明記。→ 明示済み。
- **B-3 件数・個数 caller-established / Nat 掛け算なし**: 定額は「一件につき」の単価のみ、件数を掛ける演算を行わない設計が明記。→ 明示済み。
- **B-4 軽減・免税 NOT YET COVERED / caller-established**: 3 モジュールすべてで「登録免許税法全体の軽減・免税・税率の特例は NOT YET COVERED」と明記。→ 明示済み。
- **B-5 W-T の 15,000 円採用（指示 18,000 円との食い違い）**: 独立抽出の結果、十三（一）ロ の原文は row 262 / offset 9333 の「その他の原因による移転の登録**特许権**の件数一件につき**一万五千円**」= **15,000**。原文の「一万八千円」は十（一）ロ（row 220 / offset 8083）、十一（二）ロ（row 236 / offset 8587）、十七（一）（row 316 / offset 11503）の 3 箇所のみで、十三 には存在しない。したがって `patentTransferOtherFee = 15_000` は**原文に忠実であり正しい**。形式化担当が指示例の「18000円」ではなく原文を採った判断は妥当（BY-DESIGN）。※ STAGING_WT の「特许」は上記のとおり表記ゆれで、金額判断には影響しない。
- **B-6 育成者権（十八）の対象外**: W-U が STAGING_WU.md と doc-comment で申告済み。十〜十七のレビュー範囲外。→ 明示済み。
- **B-7 タスク例示の軽減・除外は十〜十七に存在しない**: 原文を全文検索した結果、
  - 「更新の登録を除く。」は別表第一に 163 回出現するが、**十〜十七の範囲内では 0 回**（二十三 キャリアコンサルタント、二十四 情報処理安全確保支援士、三十四の二 警備業 等、他の号のみ）。
  - 「再登録その他政令で定める登録を除く。」は別表第一に 1 回のみ（offset 38463、電波法 無線局の登録＝三十四号付近）で、十〜十七には存在しない。
  - 「既に…については一万五千円」は別表第一に 19 回の「既に」が出現するが、いずれも検査機関の登録等（offset 53026 以降）で、十〜十七には存在しない。
  - よってこれらを 3 モジュールに反映する義務はなく、反映漏れではない。→ BY-DESIGN（スコープ外）。

### UNRESOLVED（2 件）

- **U-1 端数処理（floor）の法的正当性**: 原文十〜十七は「千分の四」「千分の二」とし、当該区分に端数規定を持たない。3 モジュールは `TaxRate.applyFloor`（切り捨て）を「per-law business data」として採用し doc-comment で明示している。モデル上の選択は透明だが、**登録免許税の端数処理が本当に切り捨てであるかは pinned 原文十〜十七 からは決定不能**（他要目・通則法的取扱いの確認が必要）。→ 人間の法律専門家による確認を要する。
- **U-2 対象内の「除く」条件の doc-comment での個別列挙の有無**: 十〜十七の範囲内にも以下の除外条件が存在する。
  - 十五・十六の号見出し: 「国際登録簿への登録を除く。」（offset 10389 / 10905）。
  - 十三（二）: 「（仮専用実施権に係る特許出願について特許権の設定の登録があつたことに伴い当該仮専用実施権の設定行為で定めた範囲内において受けるものを除く。）」（row 263）。
  - 十三（六）・十四（六）・十五（六）・十六（六）・十七（七）: 「（これらの登録のうち（一）から（五）まで／（一）から（六）までに掲げるものを除く。）」（row 271 / 285 / 299 / 313 / 328）。
  - W-S / W-T / W-U の doc-comment は「登録の該当性・原因の判定／登録の種別の振り分けは caller-established」と**包括的に**宣言しており、これらは一般論として包含され得る。しかし上記の文字列が**個別には列挙されていない**（Spec/Tests にも記載なし）。包括条項で足りるか、個別明記を要するかは判断が分かれる → 判断保留。金額・率そのものの一致（CONFIRMED=0）に影響はしない。

---

## 3. 反例探索の結果

| 攻撃対象 | 結果 |
|---|---|
| 件数 0 | モデルは「一件あたり単価」のみを提供し件数を掛けない（B-3）。件数 0 のとき税額 0 は caller-established の件数入力側の責任であり、定数（例 `copyrightTransferInheritanceOrMergerFee = 3000`）が正でないことをもって原文と矛盾するとは言えない。**矛盾なし**。 |
| 件数 1 | 定数がそのまま 1 件分の額。原文「一件につき△△円」と整合。**矛盾なし**。 |
| 再利用既登録者（“既に…一万五千円” 型軽減） | 該当条項は十〜十七に存在せず（B-7）。モデルに反映漏れなし。**矛盾なし**。 |
| 更新登録（“更新の登録を除く” 型） | 十〜十七に存在せず（B-7）。**矛盾なし**。 |
| 債権金額 0 | 割合型は `applyFloor 0 = 0`。原文「債権金額千分のX」と整合（0 × X = 0）。smoke（例 `copyrightPledgeEstablishmentFee 0 = 0`）も一致。**矛盾なし**。 |
| 質権信託 | 6 区分すべてで `2/1000`（原文「質権の信託の登録 債権金額千分の二」）と一致。質権以外の権利の信託は定額（3,000 または 9,000）と一致。**矛盾なし**。 |
| saturating Nat 減算 | 3 モジュールからコメントを除去して走査した結果、`Nat.sub` / `sub` / 減算演算子は **0 件**。攻撃対象自体が存在しない（N/A）。 |
| 「除く」条件の扱い | 金額式に Bool を入れない設計（B-2）。ただし doc-comment での個別列挙は U-2 のとおり判断保留。金額計算の矛盾はなし。 |

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

---

## 4. 公理監査結果

- 一時 Lean ファイル（プロジェクトルート `_axiom_audit_temp.lean`）を作成し、3 モジュールの全 `def` / `theorem` 計 **180 宣言**に対して `#print axioms` を実行（`lake env lean`、exit code 0）。
- 監査後、一時ファイルは**削除済み**。`git status --short` はクリーン（Lean モジュール無変更、他ファイル無変更）。

| 監査項目 | 結果 |
|---|---|
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **2 件**: `JapanTaxLaw.RegistryCopyrightFees.rateFee_mono`、`JapanTaxLaw.RegistryDesignTrademarkFees.rateFee_mono`（許容範囲） |
| その他の 178 宣言 | `"does not depend on any axioms"` |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

---

## 5. 総合判定

- 原文（pinned revision `342AC0000000035_20261101_508AC0000000021`）の別表第一（二）十〜十七から独立抽出した **81 項目すべて**について、金額・率・fee string と Lean の `Money` / `TaxRate` 定数が一致した。
- **CONFIRMED（実際の食い違い）= 0（ゼロ）**。BY-DESIGN = 7、UNRESOLVED = 2。発見ゼロの場合も本節に明示した。
- 指示例「18000円」に対し W-T が採用した「一万五千円 = 15,000」は、原文 offset 9333 / row 262 により**独立に正しいと確認**した。
- 公理監査は合格（禁止公理なし、propext のみ）。一時ファイルは削除済みで、Lean モジュールは一切変更していない。
- 残る UNRESOLVED（U-1 端数処理の法的正当性、U-2 「除く」条件の個別明記の要否）は、いずれも pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（原文 parse・定数照合・境界値走査・公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## 6. 最終報告（サマリ）

- **CONFIRMED: 0 件** / **BY-DESIGN: 7 件** / **UNRESOLVED: 2 件**
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 2 件（許容）。監査用一時 Lean ファイルは削除済み。
- **STAGING 作成有無**: あり。`docs/STAGING_WS.md`、`docs/STAGING_WT.md`、`docs/STAGING_WU.md` が存在（いずれも本レビューでは読み取りのみ）。
- **Lean モジュール変更**: なし（読み取り専用を遵守）。`git status` クリーン。
- 本レビューは機械的独立照合であり、人間の法的レビューを称するものではない。

---

## Batch H review (2026-11-18)

- **レビュア役割**: Adversarial Review Agent（形式化担当 W-V / W-W / W-X から独立）。形式化担当の STAGING は信じず、pinned 原文から直接再抽出した機械的照合を持って判定した。
- **対象モジュール（読み取り専用・本レビューで変更していない）**:
  - `JapanTaxLaw/RegistryShipFees.lean`（二 船舶の登記、W-V）
  - `JapanTaxLaw/RegistryPropertyRightsFees.lean`（四〜四の四 ダム使用権・公共施設等運営権・樹木採取権・漁港水面施設運営権、W-W）
  - `JapanTaxLaw/RegistryCorporateSecurityFees.lean`（六 企業担保権／六の二 企業価値担保権／七 鉄道財団／八 動産抵当権／九 動産・債権譲渡、W-X）
  - 各 `-Spec.lean` / `-Tests.lean` も読み取りのみ。
- **一次資料（pinned・改変禁止）**: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
  - law_id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`、適用日 2026-11-01。
- **独立抽出方法**: JSON の `law_full_text.children[1].children[508]`（`AppdxTable`＝別表第一）配下の `TableStruct / Table` の `TableRow` 計 **1,414 行**を Python で再帰走査し、各 `TableColumn`（区分／課税標準／税率の 3 列）の文字列を取得。日本語数字（二十・二十八・一万五千・七千五百・二・五・一・五 等）を自前の Arabic 変換器でパースし、率は `fractions.Fraction` で有理数比較（分子・分母の書式差を無視）。対象行は **船舶 54–77 / 四〜四の四 93–156 / 六〜九 166–216**（0-based row）。

### H-1. 独立抽出した fee 一覧（row → 条号 → 金額／率 → 原文文字列 → Lean 定数）

原文 fee string は `区分 | 課税標準 | 税率` の 3 列をそのまま転記したもの（`／` は列区切り）。抽出値は Arabic 変換後の値。全 **110 照合ポイント**（率 69／定額 41。共有定数は複数行で重複照合）を機械照合し、不一致は 0 件。

#### （一）二 船舶の登記（row 54–77）— W-V

| row | 条号区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 55 | （一）所有権の保存 | `船舶の価額／千分の四` | 4/1000 | `shipOwnershipPreservationRate` |
| 57 | （二）イ 相続又は法人の合併 | `船舶の価額／千分の四` | 4/1000 | `shipOwnershipTransferInheritanceOrMergerRate` |
| 58 | （二）ロ 遺贈・贈与その他無償名義 | `船舶の価額／千分の二十` | 20/1000 | `shipOwnershipTransferGratuitousRate` |
| 59 | （二）ハ その他の原因 | `船舶の価額／千分の二十八` | 28/1000 | `shipOwnershipTransferOtherRate` |
| 60 | （三）委付 | `船舶の価額／千分の四` | 4/1000 | `shipAbandonmentRate` |
| 61 | （四）賃借権の設定・転貸・移転 | `船舶の価額／千分の一・五` | 15/10000 (=1.5/1000) | `shipLeaseholdRate` |
| 62 | （五）抵当権設定・差押え等 | `債権金額又は極度金額／千分の四` | 4/1000 | `shipMortgageSecurityRate` |
| 64 | （六）イ 抵当権移転・相続合併 | `債権金額又は極度金額／千分の一` | 1/1000 | `shipMortgageTransferInheritanceOrMergerRate` |
| 65 | （六）ロ 抵当権移転・その他 | `債権金額又は極度金額／千分の二` | 2/1000 | `shipMortgageTransferOtherRate` |
| 66 | （七）根抵当権一部譲渡・分割 | `共有者の数で除した金額／千分の二` | 2/1000 | `shipSweepMortgagePartialTransferOrDivisionRate` |
| 67 | （八）抵当権の順位変更 | `抵当権の件数／一件につき千円` | ¥1,000/件 | `shipMortgageRankChangeFeePerCase` |
| 68 | （九）先順位優先同意 | `賃借権及び抵当権の件数／一件につき千円` | ¥1,000/件 | `shipLeaseholdPriorityConsentFeePerCase` |
| 70 | （十）イ 所有権の信託 | `船舶の価額／千分の四` | 4/1000 | `shipOwnershipTrustRate` |
| 71 | （十）ロ 抵当権の信託 | `債権金額又は極度金額／千分の二` | 2/1000 | `shipMortgageTrustRate` |
| 72 | （十）ハ その他の権利の信託 | `船舶の価額／千分の一・五` | 15/10000 (=1.5/1000) | `shipOtherRightTrustRate` |
| 74 | （十一）イ 所有権移転の仮登記 | `船舶の価額／千分の四` | 4/1000 | `shipOwnershipTransferProvisionalRate` |
| 75 | （十一）ロ その他の仮登記 | `船舶の隻数／一隻につき二千円` | ¥2,000/隻 | `shipOtherProvisionalFeePerVessel` |
| 76 | （十二）付記・回復・更正変更 | `船舶の隻数／一隻につき千円` | ¥1,000/隻 | `shipSupplementaryRegistrationFeePerVessel` |
| 77 | （十三）登記の抹消 | `船舶の隻数／一隻につき千円` | ¥1,000/隻 | `shipCancellationFeePerVessel` |

#### （二）四〜四の四（row 93–156）— W-W

4 権利は同一体系。下表はダム使用権の 12 項目を原文どおり掲載し、他 3 権利は権利名の差し替えのみであることを別途確認した（差分は後述）。

| row | 条号区分（ダム使用権） | 原文 fee string | 抽出値 | Lean 定数（dam／pfc／tree／port 共通接頭辞） |
|---|---|---|---|---|
| 94 | （一）設定 | `ダム使用権の価額／千分の一` | 1/1000 | `…ThousandthRate` |
| 96 | （二）イ 相続又は法人の合併 | `ダム使用権の価額／千分の一` | 1/1000 | `…ThousandthRate` |
| 97 | （二）ロ その他 | `ダム使用権の価額／千分の五` | 5/1000 | `…FiveThousandthsRate` |
| 98 | （三）抵当権設定等 | `債権金額又は極度金額／千分の四` | 4/1000 | `…FourThousandthsRate` |
| 100 | （四）イ 相続又は法人の合併 | `債権金額又は極度金額／千分の一` | 1/1000 | `…ThousandthRate` |
| 101 | （四）ロ その他 | `債権金額又は極度金額／千分の二` | 2/1000 | `…TwoThousandthsRate` |
| 102 | （五）根抵当権一部譲渡等 | `共有者の数で除した金額／千分の二` | 2/1000 | `…TwoThousandthsRate` |
| 103 | （六）抵当権の順位変更 | `抵当権の件数／一件につき千円` | ¥1,000/件 | `…PerCaseFee` |
| 105 | （七）イ 抵当権の信託 | `債権金額又は極度金額／千分の二` | 2/1000 | `…TwoThousandthsRate` |
| 106 | （七）ロ 抵当権以外の権利の信託 | `ダム使用権の価額／千分の一` | 1/1000 | `…ThousandthRate` |
| 107 | （八）付記・仮・回復・更正変更 | `ダム使用権の件数／一件につき千円` | ¥1,000/件 | `…PerCaseFee` |
| 108 | （九）登録の抹消 | `ダム使用権の件数／一件につき千円` | ¥1,000/件 | `…PerCaseFee` |

他権利の header row: 四の二 公共施設等運営権 = row 109、四の三 樹木採取権 = row 125、四の四 漁港水面施設運営権 = row 141。各々 12 項目（row header+1〜header+16）について、率・定額はダム使用権と同一（例: 公共施設等運営権（一）= row 110「公共施設等運営権の価額／千分の一」→ `pfcThousandthRate`）。**唯一の文言差**: 四の二（二）イは原文 row 112「**法人の合併**による移転の登録」（相続を含まない）。他 3 権利は row 96/128/144「相続又は法人の合併」。

#### （三）六〜九（row 166–216）— W-X

| row | 条号区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 167 | 六（一）企業担保権の設定 | `債権金額／千分の二・五` | 25/10000 (=2.5/1000) | `corporateSecurityEstablishmentRate` |
| 168 | 六（二）移転 | `債権金額／千分の一・五` | 15/10000 (=1.5/1000) | `corporateSecurityTransferRate` |
| 169 | 六（三）順位変更 | `企業担保権の件数／一件につき六千円` | ¥6,000/件 | `corporateSecurityRankChangeFeePerCase` |
| 170 | 六（四）信託 | `債権金額／千分の一・五` | 15/10000 | `corporateSecurityTrustRate` |
| 171 | 六（五）付記・仮等 | `申請件数／一件につき六千円` | ¥6,000/件 | `corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication` |
| 172 | 六（六）抹消 | `申請件数／一件につき六千円` | ¥6,000/件 | `corporateSecurityCancellationFeePerApplication` |
| 174 | 六の二（一）設定 | `企業価値担保権の件数／一件につき三万円` | ¥30,000/件 | `enterpriseValueSecurityEstablishmentFeePerCase` |
| 175 | 六の二（二）移転 | `企業価値担保権の件数／一件につき六千円` | ¥6,000/件 | `enterpriseValueSecurityTransferFeePerCase` |
| 176 | 六の二（三）順位変更 | `企業価値担保権の件数／一件につき六千円` | ¥6,000/件 | `enterpriseValueSecurityRankChangeFeePerCase` |
| 177 | 六の二（四）信託 | `企業価値担保権の件数／一件につき六千円` | ¥6,000/件 | `enterpriseValueSecurityTrustFeePerCase` |
| 178 | 六の二（五）付記等 | `申請件数／一件につき六千円` | ¥6,000/件 | `enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication` |
| 179 | 六の二（六）抹消 | `申請件数／一件につき六千円` | ¥6,000/件 | `enterpriseValueSecurityCancellationFeePerApplication` |
| 181 | 七（一）抵当権設定・強制競売 | `債権金額又は極度金額／千分の二・五` | 25/10000 | `railwayFoundationMortgageEstablishmentRate` |
| 182 | 七（二）抵当権移転 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `railwayFoundationMortgageTransferRate` |
| 183 | 七（三）根抵当権一部譲渡等 | `共有者の数で除した金額／千分の一・五` | 15/10000 | `railwayFoundationRootMortgagePartialTransferRate` |
| 184 | 七（四）順位変更 | `抵当権の件数／一件につき六千円` | ¥6,000/件 | `railwayFoundationMortgageRankChangeFeePerCase` |
| 185 | 七（五）信託 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `railwayFoundationTrustRate` |
| 186 | 七（六）付記・更正変更 | `財団の数／一個につき六千円` | ¥6,000/個 | `railwayFoundationIncidentalOrCorrectionFeePerFoundation` |
| 187 | 七（七）抹消 | `財団の数／一個につき六千円` | ¥6,000/個 | `railwayFoundationCancellationFeePerFoundation` |
| 190 | 八（一）イ 農業用動産・設定 | `債権金額又は極度金額／千分の三` | 3/1000 | `agriculturalMovableMortgageEstablishmentRate` |
| 191 | 八（一）ロ 移転 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `agriculturalMovableMortgageTransferRate` |
| 192 | 八（一）ハ 根抵当一部 | `共有者の数で除した金額／千分の一・五` | 15/10000 | `agriculturalMovableRootMortgagePartialTransferRate` |
| 193 | 八（一）ニ 順位変更 | `抵当権の件数／一件につき千円` | ¥1,000/件 | `agriculturalMovableMortgageRankChangeFeePerCase` |
| 194 | 八（一）ホ 信託 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `agriculturalMovableMortgageTrustRate` |
| 195 | 八（一）ヘ 付記等 | `申請件数／一件につき千円` | ¥1,000/件 | `agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication` |
| 196 | 八（一）ト 抹消 | `申請件数／一件につき千円` | ¥1,000/件 | `agriculturalMovableCancellationFeePerApplication` |
| 198 | 八（二）イ 建設機械・設定 | `債権金額又は極度金額／千分の三` | 3/1000 | `constructionMachineryMortgageEstablishmentRate` |
| 199 | 八（二）ロ 移転 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `constructionMachineryMortgageTransferRate` |
| 200 | 八（二）ハ 根抵当一部 | `共有者の数で除した金額／千分の一・五` | 15/10000 | `constructionMachineryRootMortgagePartialTransferRate` |
| 201 | 八（二）ニ 順位変更 | `抵当権の件数／一件につき千円` | ¥1,000/件 | `constructionMachineryMortgageRankChangeFeePerCase` |
| 202 | 八（二）ホ 信託 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `constructionMachineryMortgageTrustRate` |
| 203 | 八（二）ヘ 付記等 | `建設機械の数／一個につき千円` | ¥1,000/個 | `constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit` |
| 204 | 八（二）ト 抹消 | `建設機械の数／一個につき千円` | ¥1,000/個 | `constructionMachineryCancellationFeePerUnit` |
| 206 | 八（三）イ 自動車・設定 | `債権金額又は極度金額／千分の三` | 3/1000 | `automobileMortgageEstablishmentRate` |
| 207 | 八（三）ロ 移転 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `automobileMortgageTransferRate` |
| 208 | 八（三）ハ 根抵当一部 | `共有者の数で除した金額／千分の一・五` | 15/10000 | `automobileRootMortgagePartialTransferRate` |
| 209 | 八（三）ニ 信託 | `債権金額又は極度金額／千分の一・五` | 15/10000 | `automobileMortgageTrustRate` |
| 210 | 八（三）ホ 回復・更正変更 | `自動車の数／一両につき千円` | ¥1,000/両 | `automobileRestorationOrCorrectionFeePerVehicle` |
| 211 | 八（三）ヘ 抹消 | `自動車の数／一両につき千円` | ¥1,000/両 | `automobileCancellationFeePerVehicle` |
| 213 | 九（一）動産の譲渡 | `申請件数／一件につき一万五千円` | ¥15,000/件 | `movableTransferFeePerApplication` |
| 214 | 九（二）債権譲渡・質権設定 | `申請件数／一件につき一万五千円` | ¥15,000/件 | `claimTransferOrPledgeEstablishmentFeePerApplication` |
| 215 | 九（三）存続期間の延長 | `申請件数／一件につき七千五百円` | ¥7,500/件 | `termExtensionFeePerApplication` |
| 216 | 九（四）抹消 | `申請件数／一件につき千円` | ¥1,000/件 | `movableOrClaimRegistrationCancellationFeePerApplication` |

**照合結果**: 上記 110 照合ポイント（船舶 19／四〜四の四 48／六〜九 43）すべてで原文の率・金額と Lean 定数が有理数として一致。不一致 0 件（モデル値の観点では **発見ゼロ**）。

### H-2. 率訂正の独立判定（Coordinator の 25/10000・15/10000 は正しいか）

原文から独立抽出した率文字列と、Coordinator が統合前に適用した訂正を照合した。

| 原文率文字列（pinned row） | 数学的意味 | 旧値 ⟨num,1000⟩ | 訂正後 ⟨num,10000⟩ | 独立判定 |
|---|---|---|---|---|
| `千分の二・五` （row 167 六（一）、row 181 七（一）） | 2.5/1000 = **0.0025** = 2.5‰ | 25/1000 = 0.025（10 倍過大） | 25/10000 = 0.0025 | **訂正は正しい** |
| `千分の一・五` （row 168/170/182/183/185/191/192/194/199/200/202/207/208/209） | 1.5/1000 = **0.0015** = 1.5‰ | 15/1000 = 0.015（10 倍過大） | 15/10000 = 0.0015 | **訂正は正しい** |
| `千分の三` （row 190/198/206） | 3/1000 = 0.003 | — | 3/1000 （変更なし） | 正しい |

- 「千分の二・五」は **二・五 = 2.5** を千で割るので 2.5/1000。整数分子で表すには 25/10000 が正確（25/1000 は 25‰＝2.5% で 10 倍）。Coordinator の「2.5%、10 倍過大」という説明も数学的に整合。
- 「千分の一・五」も同様に 1.5/1000 = 15/10000。W-V の船舶Mono（row 61/72）は訂正前から独立に `⟨15,10000⟩` を採用しており、W-X との間で符号化が統一された。
- **判定: 訂正自体は誤りではない。したがって「訂正が誤り」という意味での CONFIRMED は 0 件。Coordinator の訂正は数学的に正しい（BY-DESIGN / CORRECT）。**

### H-3. 条件漏れ・例外漏れの独立検証

| チェック項目 | pinned 原文での出現（別表第一全体 / 本スコープ内） | MODEL / doc-comment の反映 | 判定 |
|---|---|---|---|
| `（更新の登録を除く。）` | 全体 163 回 / **スコープ内 0 回** | 反映義務なし（対象外） | BY-DESIGN |
| `既に…については一万五千円`（既に登録を受けている者への 9 万円→1.5 万円軽減） | 「既に」全体 19 回 / **スコープ内 0 回**。スコープ内の「一万五千円」は row 213/214 のみで、いずれも単純な「一件につき一万五千円」（軽減条項なし） | `movableTransferFeePerApplication` / `claimTransferOrPledgeEstablishmentFeePerApplication` = 15000 で正しい | BY-DESIGN |
| `相続又は法人の合併` vs `法人の合併のみ` | スコープ内で「法人の合併による移転」は 10 行。内 **row 112（四の二（二）イ）のみ「法人の合併による移転の登録」（相続を含まない）**、他 9 行は「相続又は法人の合併」 | `RegistryPropertyRightsFees.lean` 行 108–109 の doc-comment が「（二）イは原文『法人の合併による移転の登録』（相続を含まない）に注意」と明記。率は 1/1000 で同一、該当性は caller-established | BY-DESIGN（正しく反映） |

### H-4. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **1**（モデル値の誤りは 0、doc-comment の陳腐化 1） |
| **BY-DESIGN** | **7** |
| **UNRESOLVED** | **2** |

> **モデル定数・率・金額の原文との食い違いは 0 件（ゼロ）。** 発見ゼロの場合も本節に明示する。下記 CONFIRMED は実装値ではなく、**校正漏れのコメント**に関するものであり、両者を混同しないこと。

#### CONFIRMED（1 件）

- **C-1 コメントと実装値の不一致（stale doc-comment）**: Coordinator の率訂正が実装 `def`・smoke・Spec の数式には反映されたが、**説明コメントが旧値のまま**残っている。
  - `RegistryCorporateSecurityFees.lean`: 行 23/24/26 が `25/100000` `15/100000`、行 39/40/43 が `25/1000` `15/1000`、行 48–53 が `15/1000`、行 61–62 が「分母 1000」、行 91–169 の各率定数 doc-comment が `den=1000`（数え上げ **34 行**）。実コードはすべて `⟨25,10000⟩` / `⟨15,10000⟩`。
  - `RegistryCorporateSecurityFeesSpec.lean`: 行 17/18 に `(base * 25) / 10000 （pinned モデル num=25, den=1000）`、行 32–68 の各 doc-comment も `den=1000`（**22 行**）。数式自体は `/ 10000` で正しい。
  - `RegistryCorporateSecurityFeesTests.lean`: 行 173–175 のコメントが旧 `25/1000: 12345→308` / `15/1000: 12345→185` を記載。直下の `example` は訂正後（`12345→30` / `12345→18`）で正しい。
  - **影響**: コードの振る舞い・税額計算には影響なし（`agreeRegistryCorporateSecurityFees = true` が `by decide` で成立）。ただし「原文の率文字列を一字も変えず保持」という doc-comment の趣旨に反し、pinned evidence として読むと誤った分母が示される。**修正は形式化担当の責任範囲（本レビューは読み取り専用のため未修正）。**

#### BY-DESIGN（7 件）

- **B-1 課税標準は caller-established**: 「船舶の価額」「債権金額又は極度金額」「共有者の数で除して計算した金額」は 3 モジュールとも入力側の責任として明記。本モデルは与えられた `base` への税率適用のみ。
- **B-2 該当性・原因・件数は caller-established**: 相続／法人の合併／遺贈・無償／その他、設定／移転／信託／抹消、隻数・件数・財団数・両数の数え方を Bool 化せず金額式に入れない設計を明記。
- **B-3 定額は単価のみ・Nat 掛け算なし**: 一件／一隻／一個／一両あたりの定数のみを提供し、件数を掛けない設計を明記。
- **B-4 端数処理は `TaxRate.applyFloor`（切り捨て）**: 原文に当該区分の端数規定がなく、per-law business data として採用したことを明示。法的正当性は U-1 で保留。
- **B-5 スコープ外条項の非反映**: `更新の登録を除く`（0 回）、`既に…一万五千円`（0 回）、五 工場財団等・十以降は対象外。反映漏れではない。
- **B-6 Coordinator の率訂正は妥当**: H-2 のとおり 25/10000・15/10000 は数学的に正しく、10 倍過大の是正として正しい。
- **B-7 四の二（二）イの「法人の合併のみ」は doc-comment に記録済み**: 率は 1/1000 で同一、文言差のみ。該当性は caller-established の範囲。

#### UNRESOLVED（2 件）

- **U-1 端数処理（floor）の法的正当性**: 原文は「千分の X」のみで端数規定を持たない。モデルは `applyFloor`＝`base * num / den` の Nat 切り捨てを採用。pinned 原文のみでは登録免許税の端数処理が切り捨てであるか決定不能。人間の法律専門家の確認を要する（バッチ G U-1 と同趣旨）。
- **U-2 「除く」条件の個別列挙の要否**: スコープ内にも除外文言が存在する（船舶（十二）row 76「（一）から（十一）までに掲げるものを除く。」、4 権利の（八）、六（五）row 171、六の二（五）row 178、七（六）row 186、八（一）ヘ row 195、八（二）ヘ row 203）。doc-comment は「該当性は caller-established」と包括的に宣言するが個別列挙はない。包括宣言で足りるかの判断は保留。金額・率の一致（発見ゼロ）には影響しない。

### H-5. 反例探索結果

| 攻撃対象 | 結果 |
|---|---|
| 件数 0／1 | 定額は単価のみを提供し件数を掛けない（B-3）。件数 0 のとき税額 0 は caller-established の入力側責任。定数が正であることと原文が矛盾しない。**矛盾なし**。 |
| 課税標準（債権金額）0 | 全 49 割合型定数について `applyFloor 0 = 0` を機械確認。**矛盾なし**。 |
| ちょうど等しい金額（境界） | 例: `base=1000` で 4/1000→4、20/1000→20、28/1000→28、1/1000→1、2/1000→2、3/1000→3。分子分母を約分した有理数と一致。**矛盾なし**。 |
| 小数点率の丸め | タスク例 `base=1000` で 25/10000 → (1000×25)/10000 = 2.5 → floor **2**。Lean の `corporateSecurityEstablishmentFee 1000 = 2` / `railwayFoundationMortgageEstablishmentFee 1000 = 2` と一致。旧 25/1000 なら 25（10 倍）となり、訂正の効果も確認できた。**矛盾なし**。 |
| 端数境界 | 15/10000: 667→1、1000→1；船舶 15/10000: 666→0、667→1。Spec の独立定式 `(base*X)/10000` と impl が 20 点グリッドで `agree… = true`。**矛盾なし**。 |
| 既登録者軽減・更新登録 | スコープ内に該当条項なし（B-5）。**矛盾なし**。 |
| 単調性 | 3 モジュールの `rateFee_mono` は `Nat.mul_le_mul_right` + `Nat.div_le_div_right` による証明で、全税率について順序を保存。反例なし。 |

**反例探索で検出された原文・Lean 間の税額矛盾: 0 件（ゼロ）。**

### H-6. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchH_axiom_probe.lean` を作成し、3 モジュールの名前付き `def`／`theorem` 計 **216 宣言**すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。監査後、一時ファイルおよび一時スクリプトは**削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 216（船舶 53 / 財産権 57 / 企業担保 106） |
| axiom-free（`does not depend on any axioms`） | **213** |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **3 件**: `RegistryShipFees.rateFee_mono`、`RegistryPropertyRightsFees.rateFee_mono`、`RegistryCorporateSecurityFees.corporateSecurityRateFee_mono`（いずれも `simp` 由来、許容範囲） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### H-7. 総合判定・最終報告

- 原文（pinned revision `342AC0000000035_20261101_508AC0000000021`）の別表第一（二）二・四〜四の四・六〜九から独立抽出した 110 照合ポイントすべてで、金額・率と Lean 定数が一致した。**税額モデル値の食い違いは 0 件（ゼロ）**。
- **率訂正の独立判定: Coordinator の `⟨25,10000⟩` / `⟨15,10000⟩` は数学的に正しい。訂正自体が誤りという意味での CONFIRMED は 0 件。**
- **CONFIRMED: 1 件**（C-1: コメントの分母陳腐化／モデル値自体は正しい） / **BY-DESIGN: 7 件** / **UNRESOLVED: 2 件**。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも 0 件。propext のみ 3 件（許容）。監査用一時 Lean ファイルは削除済み。
- **Lean モジュール変更**: なし（3 対象モジュールおよび Spec/Tests は読み取り専用）。作業ツリーには他エージェントによる既存の無関係な変更があるが、本レビューでは一切触れていない。
- 残る UNRESOLVED（U-1 端数処理の法的正当性、U-2 「除く」条件の個別明記の要否）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（原文 parse・定数照合・境界値走査・公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。
