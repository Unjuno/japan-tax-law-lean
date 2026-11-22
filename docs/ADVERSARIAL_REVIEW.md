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

## Batch G review (2026-11-18)

### 1. 独立抽出した fee 一覧（原文 → 抽出値 → Lean def）

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

---

## Batch I review (2026-11-18)

- **レビュア役割**: Adversarial Review Agent（形式化担当 W-Y / W-Z / W-AA から独立）。担当者の STAGING は信じず、pinned 原文から直接再抽出した機械的照合をもって判定した。
- **対象モジュール（読み取り専用・本レビューで変更していない）**:
  - `JapanTaxLaw/RegistryMiningFees.lean`（十九〜二十二の二 鉱業権等、W-Y）
  - `JapanTaxLaw/RegistryForeignCompanyFees.lean`（二十二末尾〜二十五 外国会社等、W-Z）
  - `JapanTaxLaw/RegistryTrustMarriageFees.lean`（二十六〜三十一 信託・夫婦財産契約等、W-AA）
  - 各 `-Spec.lean` / `-Tests.lean` も読み取りのみ。
- **一次資料（pinned・改変禁止）**: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
  - law_id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`、適用日 2026-11-01。
- **独立抽出方法**: `law_full_text.children[1].children[508]`（AppdxTable＝別表第一）配下の `TableStruct/Table` の `TableRow` **1,414 行**を Python で再帰走査し、各 `TableColumn`（区分／課税標準／税率）の文字列を取得。対象は **0-based row 344〜600**（十九〜三十一）。日本語数字（九万・四万五千・千二百・一万五千・二・五・一・五 等）を自前パーサで Arabic 変換し、率は分数比較した。**担当者の抜粋ファイル `reg_rem_A/B/C.txt` は信じず、pinned JSON を唯一の根拠とした**（この判断が下記 C-1〜C-3 の発見に直結した。抜粋 3 ファイルはいずれも文中で切れていることを確認済み）。

### I-1. 独立抽出した fee 一覧（区分 → 金額／率 → 原文文字列）

原文 fee string は `区分 | 課税標準 | 税率` の 3 列から税率列を転記したもの。抽出値は日本語数字を Arabic 変換した値。全範囲で **196 の fee 行**（十九〜二十二の二 101／二十三〜二十五 50／二十六〜三十一 45）を抽出・照合した。

#### （一）十九 鉱業権又は租鉱権（row 344–383、31 fee）— W-Y

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 345 | （一）試掘権設定 | `一個につき九万円` | 90,000 | `miningTrialMiningRightEstablishment` |
| 347 | （二）イ 鉱区増加 | `一個につき四万五千円` | 45,000 | `miningTrialAreaIncreaseChange` |
| 348 | （二）ロ 鉱区減少 | `一個につき六千円` | 6,000 | `miningTrialAreaDecreaseChange` |
| 350 | （三）イ 移転・相続合併 | `一個につき九千円` | 9,000 | `miningTrialTransferInheritanceOrMerger` |
| 351 | （三）ロ 移転・その他 | `一個につき四万五千円` | 45,000 | `miningTrialTransferOther` |
| 352 | （四）放棄消滅 | `一個につき三千円` | 3,000 | `miningTrialAbandonmentExtinction` |
| 353 | （五）採掘権設定 | `一個につき十八万円` | 180,000 | `miningMiningRightEstablishment` |
| 355 | （六）イ 鉱区増加 | `一個につき九万円` | 90,000 | `miningMiningAreaIncreaseChange` |
| 356 | （六）ロ 鉱区減少 | `一個につき一万二千円` | 12,000 | `miningMiningAreaDecreaseChange` |
| 357 | （六）ハ 合併後 | `一個につき四万五千円` | 45,000 | `miningMiningAreaMergerChange` |
| 358 | （六）ニ 分割後 | `一個につき四万五千円` | 45,000 | `miningMiningAreaDivisionChange` |
| 360 | （七）イ 移転・相続合併 | `一個につき一万八千円` | 18,000 | `miningMiningTransferInheritanceOrMerger` |
| 361 | （七）ロ 移転・その他 | `一個につき九万円` | 90,000 | `miningMiningTransferOther` |
| 362 | （八）放棄消滅 | `一個につき三千円` | 3,000 | `miningMiningAbandonmentExtinction` |
| 363 | （九）租鉱権設定 | `一個につき一万八千円` | 18,000 | `miningRoyaltyRightEstablishment` |
| 365 | （十）イ 租鉱区増加 | `一個につき六千円` | 6,000 | `miningRoyaltyAreaIncreaseChange` |
| 366 | （十）ロ 租鉱区減少 | `一個につき千二百円` | 1,200 | `miningRoyaltyAreaDecreaseChange` |
| 368 | （十一）イ 移転・相続合併 | `一個につき千八百円` | 1,800 | `miningRoyaltyTransferInheritanceOrMerger` |
| 369 | （十一）ロ 移転・その他 | `一個につき九千円` | 9,000 | `miningRoyaltyTransferOther` |
| 370 | （十二）満了前消滅 | `一個につき千円` | 1,000 | `miningRoyaltyExtinctionBeforeExpiry` |
| 371 | （十三）抵当権設定 | `千分の四` | 4/1000 | `miningMortgageEstablishment` |
| 372 | （十四）51条承諾変更 | `一個につき三千円` | 3,000 | `miningMortgageChangeByMiningLaw51Consent` |
| 373 | （十五）順位変更（（十四）除く） | `一個につき六千円` | 6,000 | `miningMortgageRankChangeByOrderChange` |
| 375 | （十六）イ 移転・相続合併 | `一個につき四千五百円` | 4,500 | `miningMortgageTransferInheritanceOrMerger` |
| 376 | （十六）ロ 移転・その他 | `一個につき九千円` | 9,000 | `miningMortgageTransferOther` |
| 377 | （十七）抵当権順位変更 | `一件につき千円` | 1,000 | `miningMortgageRankChange` |
| 379 | （十八）イ 抵当権信託 | `千分の二` | 2/1000 | `miningMortgageTrust` |
| 380 | （十八）ロ その他信託 | `一個につき九千円` | 9,000 | `miningNonMortgageRightTrust` |
| 381 | （十九）共同権者脱退 | `一個につき四千五百円` | 4,500 | `miningCoOwnerWithdrawal` |
| 382 | （二十）付記等（（一）〜（十九）除く） | `一個につき千円` | 1,000 | `miningIncidentalOrRestorationOrCorrection` |
| 383 | （二十一）抹消 | `一個につき千円` | 1,000 | `miningCancellation` |

#### （二）二十 砂鉱権又は租鉱権（row 384–413、24 fee）— W-Y

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 385 | （一）砂鉱権設定 | `十万平方メートルにつき四千五百円` | 4,500/100,000m² | `placerRightEstablishmentPerArea` |
| 387 | （二）イ 鉱区増加 | `十万平方メートルにつき三千円` | 3,000 | `placerIncreasedAreaChangePerArea` |
| 388 | （二）ロ 鉱区減少 | `一個につき千円` | 1,000 | `placerAreaDecreaseChange` |
| 389 | （二）ハ 合併後 | `一個につき二千円` | 2,000 | `placerAreaMergerChange` |
| 390 | （二）ニ 分割後 | `一個につき二千円` | 2,000 | `placerAreaDivisionChange` |
| 392 | （三）イ 移転・相続合併 | `一個につき四千五百円` | 4,500 | `placerTransferInheritanceOrMerger` |
| 393 | （三）ロ 移転・その他 | `一個につき一万三千五百円` | 13,500 | `placerTransferOther` |
| 394 | （四）放棄消滅 | `一個につき千円` | 1,000 | `placerAbandonmentExtinction` |
| 395 | （五）租鉱権設定 | `十万平方メートルにつき四百五十円` | 450 | `placerRoyaltyEstablishmentPerArea` |
| 397 | （六）イ 租鉱区増加 | `十万平方メートルにつき三百円` | 300 | `placerIncreasedRoyaltyAreaChangePerArea` |
| 398 | （六）ロ 租鉱区減少 | `一個につき千円` | 1,000 | `placerRoyaltyAreaDecreaseChange` |
| 399 | （七）租鉱権移転 | `一個につき千五百円` | 1,500 | `placerRoyaltyTransfer` |
| 400 | （八）満了前消滅 | `一個につき千円` | 1,000 | `placerRoyaltyExtinctionBeforeExpiry` |
| 401 | （九）抵当権設定 | `千分の四` | 4/1000 | `placerMortgageEstablishment` |
| 402 | （十）51条承諾変更 | `一個につき三千円` | 3,000 | `placerMortgageChangeByMiningLaw51Consent` |
| 403 | （十一）順位変更（（十）除く） | `一個につき六千円` | 6,000 | `placerMortgageRankChangeByOrderChange` |
| 405 | （十二）イ 移転・相続合併 | `一個につき四千五百円` | 4,500 | `placerMortgageTransferInheritanceOrMerger` |
| 406 | （十二）ロ 移転・その他 | `一個につき九千円` | 9,000 | `placerMortgageTransferOther` |
| 407 | （十三）抵当権順位変更 | `一件につき千円` | 1,000 | `placerMortgageRankChange` |
| 409 | （十四）イ 抵当権信託 | `千分の二` | 2/1000 | `placerMortgageTrust` |
| 410 | （十四）ロ その他信託 | `一個につき四千五百円` | 4,500 | `placerNonMortgageRightTrust` |
| 411 | （十五）共同権者脱退 | `一個につき四千五百円` | 4,500 | `placerCoOwnerWithdrawal` |
| 412 | （十六）付記等（（一）〜（十五）除く） | `一個につき千円` | 1,000 | `placerIncidentalOrRestorationOrCorrection` |
| 413 | （十七）抹消 | `一個につき千円` | 1,000 | `placerCancellation` |

#### （三）二十一 鉱業法114条2項（row 414–417、3 fee）／二十二 特定鉱業権（row 418–443、21 fee）— W-Y

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 415 | 二十一（一）新規登録 | `千分の一` | 1/1000 | `damagesRegistration` |
| 416 | 二十一（二）回復・更正 | `一個につき千円` | 1,000 | `damagesRestorationOrCorrection` |
| 417 | 二十一（三）抹消 | `一個につき千円` | 1,000 | `damagesCancellation` |
| 419 | 二十二（一）探査権設定 | `十万平方メートルにつき三百円` | 300 | `specialExplorationEstablishmentPerArea` |
| 420 | 二十二（二）鉱区減少 | `一個につき十二万円` | 120,000 | `specialExplorationAreaDecrease` |
| 422 | 二十二（三）イ 移転・相続合併 | `十万平方メートルにつき三十円` | 30 | `specialExplorationTransferInheritanceOrMergerPerArea` |
| 423 | 二十二（三）ロ 移転・その他 | `十万平方メートルにつき百五十円` | 150 | `specialExplorationTransferOtherPerArea` |
| 424 | 二十二（四）放棄消滅 | `一個につき六万円` | 60,000 | `specialExplorationAbandonmentExtinction` |
| 425 | 二十二（五）採掘権設定 | `十万平方メートルにつき二千四百円` | 2,400 | `specialMiningRightEstablishmentPerArea` |
| 426 | 二十二（六）存続延長 | `十万平方メートルにつき二百四十円` | 240 | `specialMiningTermExtensionPerArea` |
| 427 | 二十二（七）鉱区減少 | `一個につき二十四万円` | 240,000 | `specialMiningAreaDecrease` |
| 429 | 二十二（八）イ 移転・相続合併 | `十万平方メートルにつき二百四十円` | 240 | `specialMiningTransferInheritanceOrMergerPerArea` |
| 430 | 二十二（八）ロ 移転・その他 | `十万平方メートルにつき千二百円` | 1,200 | `specialMiningTransferOtherPerArea` |
| 431 | 二十二（九）放棄消滅 | `一個につき六万円` | 60,000 | `specialMiningAbandonmentExtinction` |
| 432 | 二十二（十）抵当権設定 | `千分の四` | 4/1000 | `specialMiningMortgageEstablishment` |
| 433 | 二十二（十一）順位変更 | `一個につき十二万円` | 120,000 | `specialMortgageRankChangeByOrderChange` |
| 435 | 二十二（十二）イ 移転・相続合併 | `十万平方メートルにつき六十円` | 60 | `specialMortgageTransferInheritanceOrMergerPerArea` |
| 436 | 二十二（十二）ロ 移転・その他 | `十万平方メートルにつき百二十円` | 120 | `specialMortgageTransferOtherPerArea` |
| 437 | 二十二（十三）抵当権順位変更 | `一件につき二万円` | 20,000 | `specialMortgageRankChange` |
| 439 | 二十二（十四）イ 抵当権信託 | `千分の二` | 2/1000 | `specialMiningMortgageTrust` |
| 440 | 二十二（十四）ロ その他信託 | `十万平方メートルにつき百二十円` | 120 | `specialNonMortgageRightTrustPerArea` |
| 441 | 二十二（十五）共有者脱退 | `一個につき九万円` | 90,000 | `specialCoOwnerWithdrawal` |
| 442 | 二十二（十六）付記等（（一）〜（十五）除く） | `一個につき二万円` | 20,000 | `specialIncidentalOrRestorationOrCorrection` |
| 443 | 二十二（十七）抹消 | `一個につき二万円` | 20,000 | `specialCancellation` |

#### （四）二十二の二 試掘権又は貯留権（row 444–472、22 fee）— W-Y／W-Z

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数（担当） |
|---|---|---|---|---|
| 445 | （一）試掘権設定 | `一個につき九万円` | 90,000 | `storageExplorationRightEstablishment`（W-Y） |
| 447 | （二）イ 試掘区域増加 | `一個につき四万五千円` | 45,000 | `storageExplorationAreaIncreaseChange` |
| 448 | （二）ロ 試掘区域減少 | `一個につき六千円` | 6,000 | `storageExplorationAreaDecreaseChange` |
| 450 | （三）イ 移転・相続合併 | `一個につき九千円` | 9,000 | `storageExplorationTransferInheritanceOrMerger` |
| 451 | （三）ロ 移転・その他 | `一個につき四万五千円` | 45,000 | `storageExplorationTransferOther` |
| 452 | （四）貯留権設定 | `一個につき十八万円` | 180,000 | `storageRightEstablishment` |
| 454 | （五）イ 貯留区域増加 | `一個につき九万円` | 90,000 | `storageAreaIncreaseChange` |
| 455 | （五）ロ 貯留区域減少 | `一個につき一万二千円` | 12,000 | `storageAreaDecreaseChange` |
| 456 | （五）ハ 合併後 | `一個につき四万五千円` | 45,000 | `storageAreaMergerChange` |
| 457 | （五）ニ 分割後 | `一個につき四万五千円` | 45,000 | `storageAreaDivisionChange` |
| 459 | （六）イ 移転・相続合併 | `一個につき一万八千円` | 18,000 | `storageTransferInheritanceOrMerger` |
| 460 | （六）ロ 移転・その他 | `一個につき九万円` | 90,000 | `storageTransferOther` |
| 461 | （七）抵当権設定 | `千分の四` | 4/1000 | `storageMortgageEstablishment` |
| 462 | （八）CO2法承諾変更 | `一個につき三千円` | 3,000 | `storageMortgageChangeByCO2LawConsent` |
| 463 | （九）順位変更（（八）除く） | `一個につき六千円` | 6,000 | `storageMortgageRankChangeByOrderChange` |
| 465 | （十）イ 移転・相続合併 | `一個につき四千五百円` | 4,500 | `storageMortgageTransferInheritanceOrMerger` |
| 466 | （十）ロ 移転・その他 | `一個につき九千円` | 9,000 | `storageMortgageTransferOther` |
| 467 | （十一）抵当権順位変更 | `一件につき千円` | 1,000 | `storageMortgageRankChange` |
| 469 | （十二）イ 抵当権信託 | `千分の二` | 2/1000 | `storageMortgageTrust` |
| 470 | （十二）ロ その他信託 | `一個につき九千円` | 9,000 | `storageNonMortgageRightTrust`（W-Y） |
| **471** | **（十三）付記等（（一）〜（十二）除く）** | **`一個につき千円`** | **1,000** | **`miningAreaChangeRegistrationFeePerArea`（W-Z）／W-Y は未モデル化 → C-2** |
| **472** | **（十四）抹消** | **`一個につき千円`** | **1,000** | **`miningAreaCancellationFeePerArea`（W-Z）／W-Y は言及なし → C-2** |

#### （五）二十三 漁業権又は入漁権（row 473–497、18 fee）／二十四・二十五（row 498–541）— W-Z

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 475 | 二十三（一）イ 移転・相続合併 | `一件につき千八百円` | 1,800 | `fishingRightTransferByInheritanceOrMergerFeePerCase` |
| 476 | 二十三（一）ロ 移転・その他 | `一件につき九千円` | 9,000 | `fishingRightTransferOtherFeePerCase` |
| 478 | 二十三（二）イ 持分・相続合併 | `一件につき千五百円` | 1,500 | `fishingRightShareTransferByInheritanceOrMergerFeePerCase` |
| 479 | 二十三（二）ロ 持分・その他 | `一件につき三千円` | 3,000 | `fishingRightShareTransferOtherFeePerCase` |
| 480 | 二十三（三）入漁権設定 | `一件につき六千円` | 6,000 | `anglingRightEstablishmentFeePerCase` |
| 481 | 二十三（四）入漁権保存 | `一件につき千五百円` | 1,500 | `anglingRightPreservationFeePerCase` |
| 483 | 二十三（五）イ 移転・相続合併 | `一件につき千五百円` | 1,500 | `anglingRightTransferByInheritanceOrMergerFeePerCase` |
| 484 | 二十三（五）ロ 移転・その他 | `一件につき四千五百円` | 4,500 | `anglingRightTransferOtherFeePerCase` |
| 486 | 二十三（六）イ 持分・相続合併 | `一件につき千五百円` | 1,500 | `anglingRightShareTransferByInheritanceOrMergerFeePerCase` |
| 487 | 二十三（六）ロ 持分・その他 | `一件につき三千円` | 3,000 | `anglingRightShareTransferOtherFeePerCase` |
| 488 | 二十三（七）処分制限 | `千分の四` | 4/1000 | `fishingRightLienPreservationRate` |
| 490 | 二十三（八）イ 移転・相続合併 | `一件につき千五百円` | 1,500 | `lienOrMortgageTransferByInheritanceOrMergerFeePerCase` |
| 491 | 二十三（八）ロ 移転・その他 | `一件につき三千円` | 3,000 | `lienOrMortgageTransferOtherFeePerCase` |
| 492 | 二十三（九）順位変更 | `一件につき千円` | 1,000 | `mortgageRankChangeFeePerCase` |
| 494 | 二十三（十）イ 先取特権信託 | `千分の二` | 2/1000 | `fishingRightLienTrustRate` |
| 495 | 二十三（十）ロ その他信託 | `一件につき四千五百円` | 4,500 | `nonLienOrMortgageRightTrustFeePerCase` |
| 496 | 二十三（十一）付記等 | `一件につき千円` | 1,000 | `fishingIncidentalOrRestorationOrCorrectionFeePerCase` |
| 497 | 二十三（十二）抹消 | `一件につき千円` | 1,000 | `fishingRightCancellationFeePerCase` |

二十四（一）イ〜チ（row 500–514）は W-Z が明示的に委譲した区分（下記 B-6）。fee 値は `千分の七` ×7（500/503/505/511/513 等）、`千分の一・五` ×2（507/509）、最低税額 `一件につき十五万円/六万円/三万円` の括弧書で、いずれも `RegistrationCommercialTax*.lean` 担当（`commercial24LowMilleRate = ⟨15,10000⟩` を確認）。

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 515 | 二十四（一）リ 相互会社設立 | `一件につき三十万円` | 300,000 | `mutualCompanyEstablishmentFeePerApplication` |
| 516 | 二十四（一）ヌ 新株予約権発行 | `一件につき九万円` | 90,000 | `newShareOptionIssuanceChangeFeePerApplication` |
| 517 | 二十四（一）ル 支店設置 | `一箇所につき六万円` | 60,000 | `branchOrSubsidiaryOfficeEstablishmentFeePerOffice` |
| 518 | 二十四（一）ヲ 移転 | `一箇所につき三万円` | 30,000 | `headOrBranchOfficeRelocationFeePerOffice` |
| 519 | 二十四（一）ワ 取締役会等変更 | `一件につき三万円` | 30,000 | `boardAndCommitteeMatterChangeFeePerApplication` |
| 520 | 二十四（一）カ 役員変更 | `一件につき三万円（資本金一億円以下…一万円）` | 30,000／10,000 | `directorAndOfficerMatterChange*FeePerApplication`（2 定数） |
| 521 | 二十四（一）ヨ 支配人 | `一件につき三万円` | 30,000 | `managerAppointmentOrAgencyRevocationFeePerApplication` |
| 522 | 二十四（一）タ 職務停止等 | `一件につき三万円` | 30,000 | `directorDutySuspensionOrSubstituteAppointmentFeePerApplication` |
| 523 | 二十四（一）レ 解散 | `一件につき三万円` | 30,000 | `companyDissolutionFeePerApplication` |
| 524 | 二十四（一）ソ 継続・回復等 | `一件につき三万円` | 30,000 | `companyContinuationOrRestorationFeePerApplication` |
| 525 | 二十四（一）ツ 登記事項変更（イ〜ソ除く） | `一件につき三万円` | 30,000 | `companyMiscRegistrationChangeFeePerApplication` |
| 526 | 二十四（一）ネ 更正 | `一件につき二万円` | 20,000 | `companyCorrectionFeePerApplication` |
| 527 | 二十四（一）ナ 抹消 | `一件につき二万円` | 20,000 | `companyCancellationFeePerApplication` |
| 529 | 二十四（二）イ 営業所設置 | `一箇所につき九万円` | 90,000 | `foreignCompanyBusinessOfficeEstablishmentFeePerOffice` |
| 530 | 二十四（二）ロ 営業所なし登録 | `一件につき六万円` | 60,000 | `foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication` |
| 531 | 二十四（二）ハ その他 | `一件につき九千円` | 9,000 | `foreignCompanyOtherRegistrationFeePerApplication` |
| 532 | 二十四（二）ニ 更正・抹消 | `一件につき六千円` | 6,000 | `foreignCompanyCorrectionOrCancellationFeePerApplication` |
| 534 | 二十四（三）イ 清算人 | `一件につき九千円` | 9,000 | `foreignCompanyLiquidatorAppointmentFeePerApplication` |
| 535 | 二十四（三）ロ 職務停止等 | `一件につき六千円` | 6,000 | `foreignCompanyLiquidatorDutySuspensionFeePerApplication` |
| 536 | 二十四（三）ハ 清算結了 | `一件につき二千円` | 2,000 | `foreignCompanyLiquidationCompletionFeePerApplication` |
| 537 | 二十四（三）ニ 変更・更正・抹消 | `一件につき六千円` | 6,000 | `foreignCompanyLiquidationMiscFeePerApplication` |
| 539 | 二十五（一）特定目的会社設立 | `一件につき三万円` | 30,000 | `specialPurposeCompanyEstablishmentFeePerApplication` |
| 540 | 二十五（二）その他 | `一件につき一万五千円` | 15,000 | `specialPurposeCompanyOtherRegistrationFeePerApplication` |
| **541** | **二十五（三）抹消** | **`一件につき一万円`** | **10,000** | **未モデル化 → C-1** |

#### （六）二十六〜三十一（row 542–600、37 fee）— W-AA

| row | 区分 | 原文 fee string | 抽出値 | Lean 定数 |
|---|---|---|---|---|
| 543 | 二十六（一）投資法人設立 | `一件につき三万円` | 30,000 | `investmentCorporationFormationFee` |
| 544 | 二十六（二）その他 | `一件につき一万五千円` | 15,000 | `investmentCorporationOtherRegistrationFee` |
| 545 | 二十六（三）抹消 | `一件につき一万円` | 10,000 | `investmentCorporationErasureFee` |
| 548 | 二十七（一）イ 効力発生 | `一件につき六万円` | 60,000 | `llpContractEffectivenessFee` |
| 549 | 二十七（一）ロ 従たる事務所設置 | `一件につき六万円` | 60,000 | `llpBranchInstallationFee` |
| 550 | 二十七（一）ハ 移転 | `一件につき三万円` | 30,000 | `llpRelocationFee` |
| 551 | 二十七（一）ニ 組合員事項変更 | `一件につき一万円` | 10,000 | `llpPartnerMattersChangeFee` |
| 552 | 二十七（一）ホ 業務執行停止等 | `一件につき三万円` | 30,000 | `llpPartnerSuspensionOrDeputyFee` |
| 553 | 二十七（一）ヘ その他 | `一件につき三万円` | 30,000 | `llpOtherRegistrationFee` |
| 554 | 二十七（一）ト 更正 | `一件につき二万円` | 20,000 | `llpCorrectionFee` |
| 555 | 二十七（一）チ 抹消 | `一件につき二万円` | 20,000 | `llpErasureFee` |
| 557 | 二十七（二）イ 清算人 | `一件につき六千円` | 6,000 | `llpLiquidatorRegistrationFee` |
| 558 | 二十七（二）ロ その他 | `一件につき六千円` | 6,000 | `llpLiquidationOtherFee` |
| 559 | 二十七（二）ハ 清算結了 | `一件につき二千円` | 2,000 | `llpLiquidationCompletionFee` |
| 560 | 二十七（二）ニ 更正・抹消 | `一件につき六千円` | 6,000 | `llpLiquidationCorrectionOrErasureFee` |
| 563 | 二十八（一）イ 効力発生 | `一件につき三万円` | 30,000 | `viclpContractEffectivenessFee` |
| 564 | 二十八（一）ロ その他 | `一件につき一万五千円` | 15,000 | `viclpOtherRegistrationFee` |
| 565 | 二十八（一）ハ 更正 | `一件につき一万円` | 10,000 | `viclpCorrectionFee` |
| 566 | 二十八（一）ニ 抹消 | `一件につき一万円` | 10,000 | `viclpErasureFee` |
| 568 | 二十八（二）イ 清算人 | `一件につき六千円` | 6,000 | `viclpLiquidatorRegistrationFee` |
| 569 | 二十八（二）ロ その他 | `一件につき六千円` | 6,000 | `viclpLiquidationOtherFee` |
| 570 | 二十八（二）ハ 清算結了 | `一件につき二千円` | 2,000 | `viclpLiquidationCompletionFee` |
| 571 | 二十八（二）ニ 更正・抹消 | `一件につき六千円` | 6,000 | `viclpLiquidationCorrectionOrErasureFee` |
| 573 | 二十八の二（一）定め登記 | `一件につき三万円` | 30,000 | `limitedLiabilityTrustProvisionFee` |
| 574 | 二十八の二（二）新事務処理地 | `一件につき一万五千円` | 15,000 | `limitedLiabilityTrustNewOfficeFee` |
| 575 | 二十八の二（三）その他 | `一件につき一万五千円` | 15,000 | `limitedLiabilityTrustOtherRegistrationFee` |
| 576 | 二十八の二（四）更正 | `一件につき一万円` | 10,000 | `limitedLiabilityTrustCorrectionFee` |
| 577 | 二十八の二（五）抹消 | `一件につき一万円` | 10,000 | `limitedLiabilityTrustErasureFee` |
| 579 | 二十八の二（六）イ 清算受託者 | `一件につき六千円` | 6,000 | `limitedLiabilityTrustLiquidatorRegistrationFee` |
| 580 | 二十八の二（六）ロ その他 | `一件につき六千円` | 6,000 | `limitedLiabilityTrustLiquidationOtherFee` |
| 581 | 二十八の二（六）ハ 清算結了 | `一件につき二千円` | 2,000 | `limitedLiabilityTrustLiquidationCompletionFee` |
| 582 | 二十八の二（六）ニ 更正・抹消 | `一件につき六千円` | 6,000 | `limitedLiabilityTrustLiquidationCorrectionOrErasureFee` |
| 585 | 二十九（一）イ 商号新設等 | `一件につき三万円` | 30,000 | `individualNameEstablishmentOrChangeFee` |
| 586 | 二十九（一）ロ 支配人 | `一件につき三万円` | 30,000 | `individualManagerFee` |
| 587 | 二十九（一）ハ 未成年者・後見人 | `一件につき一万八千円` | 18,000 | `individualMinorOrGuardianFee` |
| 588 | 二十九（一）ニ 営業譲渡免責 | `一件につき一万八千円` | 18,000 | `individualBusinessTransferLiabilityFee` |
| 589 | 二十九（一）ホ 廃止・更正等 | `一件につき六千円` | 6,000 | `individualNameAbolitionOrCorrectionFee` |
| 590 | 二十九（一）ヘ 抹消 | `一件につき六千円` | 6,000 | `individualErasureFee` |
| 592 | 二十九（二）イ 支店 | `一件につき九千円` | 9,000 | `individualBranchOfficeFee` |
| 593 | 二十九（二）ロ ホ・抹消 | `一件につき六千円` | 6,000 | `individualBranchOfficeErasureFee` |
| 595 | 三十（一）船舶管理人選任 | `一件につき三万円` | 30,000 | `shipManagerFee` |
| 596 | 三十（二）回復・更正変更 | `一件につき六千円` | 6,000 | `shipManagerCorrectionOrChangeFee` |
| 598 | 三十一（一）民法756条 | `一件につき一万八千円` | 18,000 | `matrimonialPropertyContractFee` |
| 599 | 三十一（二）更正・変更 | `一件につき六千円` | 6,000 | `matrimonialPropertyContractCorrectionOrChangeFee` |
| 600 | 三十一（三）抹消 | `一件につき六千円` | 6,000 | `matrimonialPropertyContractErasureFee` |

> 注: 二十七（一）ヘ（row 553）は原文 `一件につき三万円`、W-AA の doc-comment も三万円で、抽出値 30,000 と一致する（レビュー表の転記ミスは修正済み）。

**照合結果（金額・率）**: 上表のうち、W-Y 99 行／W-Z 43 行（44 定数、二十四（一）カの 10,000 円は 1 行に 2 定数）／W-AA 45 行、合計 **187 行（188 定数）すべて**で原文と Lean 定数が一致。**モデル化された定数・率の食い違いは 0 件（ゼロ）**。ただし未モデル化の 3 列 fee 行が 9 行ある（委譲 8 行＋二十五（三）1 行）。後者は金額が確定しているにもかかわらず脱落している（C-1）。

### I-2. 小数点率の有無と符号化の独立判定

| 槍查 | 独立抽出結果 | 判定 |
|---|---|---|
| 十九〜二十二の二（row 344–472）の `・五` | **0 件**。割合は `千分の四`(4/1000) / `千分の二`(2/1000) / `千分の一`(1/1000) のみ | W-Y の「小数点率なし・分母 1000」は**正しい** |
| 二十三〜二十五（row 473–541）の `二・五` | **0 件** | — |
| 二十三〜二十五（row 473–541）の `一・五` | **2 件**: row 507（二十四（一）ホ）・row 509（二十四（一）ヘ）の `千分の一・五` | W-Z の「本範囲に一・五は現れない」は**モデル化部分に限れば正しい**が、号全体（二十二〜二十五）としては文字列が存在する（下記 BY-DESIGN B-6 の委譲先で `⟨15,10000⟩` として正しく符号化）。記述はやや不正確。 |
| 二十六〜三十一（row 542–600）の `・五` | **0 件**。すべて定額 | W-AA の「小数点率なし・TaxRate 導入せず」は**正しい** |
| 25/10000・15/10000 の妥当性 | `千分の二・五` = 2.5/1000 = 25/10000、`千分の一・五` = 1.5/1000 = 15/10000。過去の `⟨25,1000⟩`/`⟨15,1000⟩`（10 倍過大）は誤り | **25/10000・15/10000 は数学的に正しい**。本バッチの 3 モジュールは decimal 率を一切持たず、`/ 1000` の分母を誤った箇所も smoke・Spec・Tests に**不存在**（`/ 10000` の登場は全て「10000 を使わない」旨の注釈か 10,000 円定額）。→ 10 倍過大バグの再発なし。 |

### I-3. 条件漏れ・軽減除外の独立検証

| チェック項目 | pinned 原文での出現（本スコープ / 別表全体） | モデル側の扱い | 判定 |
|---|---|---|---|
| `更新の登録を除く` | **0 件** / 163 件 | 反映義務なし（他号の条項） | BY-DESIGN（B-4） |
| `既に…については一万五千円`（既登録者軽減） | **0 件** / 19 件 | 反映義務なし。本スコープの `一万五千円` 5 箇所（row 540/544/564/574/575）は全て単純な「一件につき一万五千円」で、Lean 定数 15,000 と一致（軽減条項ではない） | BY-DESIGN（B-5） |
| `（…を除く。）` 型の除外 | **23 行**（row 344/373/382/403/412/442/463/471/496/498/499/500/503/505/525/528/529/537/547/562/576/577/589） | 各モジュールとも「該当性・原因判定は caller-established」と包括宣言し Bool を金額式に入れない。個別列挙はなし | BY-DESIGN（B-2）だが個別明記の要否は UNRESOLVED（U-2） |
| 途中で切れた行の扱い | W-Y が「二十二の二（十三）は fee なし」、W-Z が「二十五（三）は金額確定不能」、W-AA が冒頭「つき一万円」を断片として除外と申告 | **pinned JSON ではいずれも完全な fee string が存在**（row 471 `一個につき千円`、row 472 `一個につき千円`、row 541 `一件につき一万円`）。切断は担当者が作成した抜粋 `reg_rem_A/B/C.txt` の末尾側の現象にすぎない | **CONFIRMED（C-1/C-2/C-3）**。pinned を根拠にすれば「金額を確定できない」は事実誤認。 |

### I-4. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **3** |
| **BY-DESIGN** | **7** |
| **UNRESOLVED** | **2** |

> モデル化された **180 の定数・率の数値自体は原文とすべて一致（発見ゼロ）**。下記 CONFIRMED はすべて「pinned 原文の読み落とし／doc-comment の事実誤認」に関するもので、実装値の誤りではない。両者を混同しないこと。

#### CONFIRMED（3 件）

- **C-1 二十五（三）登記の抹消（¥10,000）の脱落と「金額確定不能」という誤った理由**: pinned row 541 は `（三）登記の抹消 | 申請件数 | 一件につき一万円` と完全。しかし W-Z は `二十五（三）は原文が「申請件数一件に」で切れており金額を確定できないため NOT COVERED` とし、W-AA も担当範囲冒頭の「つき一万円」を「不完全な断片」としてモデル化しなかった。いずれも抜粋ファイル `reg_rem_B.txt` / `reg_rem_C.txt` の末尾切断に起因する誤認。**バッチ I 全体で唯一、金額が確定しているのに未モデル化の fee**（10,000 円）。→ 実質的なカバレッジギャップ＋根拠の事実誤認。修正は形式化担当の責任範囲（本レビューは読み取り専用のため未修正）。
- **C-2 W-Y の二十二の二（十三）（十四）に関する原文記述の誤り**: W-Y の doc-comment／STAGING は「二十二の二（十三）は原文が文中で途切れており fee string を持たないためモデル化しない」と記載するが、pinned row 471 は `一個につき千円`（¥1,000）を持つ。また row 472（十四）登録の抹消 `一個につき千円`（¥1,000）については doc-comment に一切言及がない（黙示的な脱落）。両値は W-Z が `miningAreaChangeRegistrationFeePerArea` / `miningAreaCancellationFeePerArea` としてモデル化しているため**合計ではカバーされている**が、W-Y の「fee string を持たない」という記述は pinned 原文に対して false。
- **C-3 W-Z の区分ラベリング誤り**: W-Z は上記 2 行（row 471/472）を doc-comment で「【二十二 鉱業権（末尾のみ）】変更の登録／（十四）登録の抹消」と表示しているが、pinned 原文ではこれらは**二十二の二（十三）（十四）**（試掘区域又は貯留区域の数一個につき千円）である。金額（1,000）は正しいが、原文の号ラベルが誤っている（fidelity 上の記載誤り）。

#### BY-DESIGN（7 件）

- **B-1 課税標準・面積・件数は caller-established／Nat 掛け算なし**: 3 モジュールすべてで明記。面積型は「十万平方メートル 1 単位あたり」の単価のみで、十万平方メートル単位への除法・端数は呼び出し側の責任。
- **B-2 該当性・原因判定は caller-established／Bool を金額式に入れない**: 相続／法人の合併／その他、設定／変更／移転／消滅／信託／抵当権、砂鉱の別、CO2 貯留事業等を金額式に含めない設計を明記。
- **B-3 端数処理は `TaxRate.applyFloor`（切り捨て）**: per-law business data として明示。法的正当性は U-1 で保留。
- **B-4 更新登録除外はスコープ外**: `更新の登録を除く` は本スコープ 0 件。反映漏れではない。
- **B-5 既登録者軽減はスコープ外**: `既に…一万五千円` は本スコープ 0 件。スコープ内の 15,000 円は全て単純定額で正しく反映。
- **B-6 二十四（一）イ〜チは委譲済み**: `千分の七`・`千分の一・五`・最低税額（15/6/3 万円）は `RegistrationCommercialTax*.lean` 担当。重複定義なし。委譲先の `commercial24LowMilleRate = ⟨15,10000⟩` を確認し、符号化は正しい。W-Z の「本範囲に小数点率なし」はこの委譲部分を除けば成立。
- **B-7 W-AA のスコープ解釈**: 見出しは「二十六〜二十九」だが原文 reg_rem_C.txt が二十六〜三十一を含むため、原文に存在する全 fee（二十六／二十七／二十八／二十八の二／二十九／三十／三十一）を漏れなく対象とした判断は妥当（下記 U-2 を除く）。末尾の「三十二 人の資格…」は見出しのみの断片で除外も妥当（ただし冒頭断片の扱いは C-1 参照）。

#### UNRESOLVED（2 件）

- **U-1 端数処理（floor）の法的正当性**: 原文は「千分の X」のみで当該区分に端数規定を持たない。pinned 原文のみでは登録免許税の端数処理が切り捨てであるか決定不能。**人間の法律専門家による確認を要する**（バッチ G/H と同趣旨）。
- **U-2 「除く」条件の個別列挙の要否**: 本スコープ内にも 23 行の除外文言が存在（例: row 373「（十四）に掲げる登録を除く」、row 382/412/442/471/496/525/537「（一）から…までに掲げるものを除く」、row 576/577「（六）ニに掲げる登記を除く」等）。各モジュールは「該当性は caller-established」と包括宣言するが個別列挙はない。包括宣言で足りるかの判断は保留。金額・率の一致（発見ゼロ）には影響しない。

### I-5. 反例探索結果

| 攻撃対象 | 結果 |
|---|---|
| 件数 0 | 定額は「一件／一個／一箇所あたり」の単価のみ（B-1）。件数 0 のとき税額 0 は caller-established の入力側責任。定数が正であることと原文は矛盾しない。**矛盾なし**。 |
| 件数 1 | 定数がそのまま 1 件分。原文「一件につき△△円」と整合。**矛盾なし**。 |
| 面積 0／十万平方メートル単価の掛け算 | 面積型は 100,000 m² あたり単価（例 `placerRightEstablishmentPerArea = 4_500`）。250,000 m² なら 11,250 円となるが、単位換算・除算・端数は caller-established（B-1）。モデルは単価のみを提供し矛盾しない。**矛盾なし**。 |
| 債権金額 0 | 割合型は `applyFloor 0 = 0`。smoke（例 `fishingRightLienPreservationFee 0 = 0`）も一致。**矛盾なし**。 |
| 境界値（den→num / 999→floor） | 例: 4/1000 で 1,000→4、999→3；2/1000 で 1,000→2、999→1；1/1000 で 1,000→1、999→0。全割合型で smoke が原文の率と整合。**矛盾なし**。 |
| 小数点率の丸め | 本バッチに decimal 率定数はなし。委譲先の 15/10000 は 1,000→1 で正しく、`⟨15,1000⟩` なら 15（10 倍）となるところ訂正効果も確認。**矛盾なし**。 |
| 単調性 | `miningRateFeeMono` は `Nat.mul_le_mul_right` + `Nat.div_le_div_right` の証明で順序保存。反例なし。 |
| 未モデル化行 | C-1（二十五（三）10,000 円）は金額確定済みで脱落 → **矛盾 1 件**。C-2/C-3 の 2 行は W-Z が補完しているため金額上の矛盾はなし。 |

**反例探索で検出された原文・Lean 間の金額矛盾: 1 件（C-1）。それ以外は 0 件。**

### I-6. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchI_axiom_probe.lean` を作成し、3 モジュールの名前付き `def`／`theorem` 計 **388 宣言**（W-Y 208／W-Z 90／W-AA 90）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。監査後、一時ファイルおよび一時スクリプトは**削除済み**（担当者の抜粋ファイル `reg_rem_A/B/C.txt` や他の既存一時ファイルは触れていない）。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 388 |
| axiom-free（`does not depend on any axioms`） | **387** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **1 件**: `JapanTaxLaw.RegistryMiningFees.miningRateFeeMono`（`simp` 由来、許容範囲） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### I-7. 総合判定・最終報告

- pinned revision `342AC0000000035_20261101_508AC0000000021` の別表第一（二）十九〜三十一から独立抽出した **196 fee 行のうち、モデル化された 187 行（188 定数）すべて**で金額・率・fee string が Lean 定数と一致。**モデル化定数の誤りは 0 件（ゼロ）**。
- **小数点率判定**: 本バッチの 3 モジュールの担当範囲に decimal 率は存在しない（分母 1000 が正しい）。号範囲全体では 二十四（一）ホ/ヘ に `千分の一・五` が 2 件あるが委譲済みで `⟨15,10000⟩` として正しく符号化。**25/10000・15/10000 の訂正は数学的に正しく、10 倍過大バグの再発なし**。
- **CONFIRMED: 3 件**（C-1 二十五（三）10,000 円の脱落＋誤った「確定不能」理由／C-2 W-Y の二十二の二（十三）（十四）に関する原文記述誤り／C-3 W-Z の号ラベル誤り）。いずれもモデル値の誤りではなく原文読み落とし・記載誤り。金額矛盾は C-1 の 1 件のみ。
- **BY-DESIGN: 7 件** / **UNRESOLVED: 2 件**。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 1 件（許容）。監査用一時 Lean ファイルは削除済み。
- **Lean モジュール変更: なし**（3 対象モジュールおよび Spec/Tests は読み取り専用）。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみで、既存のバッチ G/H レビューは保持した。
- 残る UNRESOLVED（U-1 端数処理の法的正当性、U-2 「除く」条件の個別明記要否）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（原文 parse・定数照合・境界値走査・公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch J review (2026-11-18)

### J-0. 範囲・独立性の申告
- 対象: `JapanTaxLaw/RegistryQualificationFeesJ1.lean`（三十三〜三十八）/ `...J2.lean`（三十九〜四十九）/ `...J3.lean`（五十〜五十九）および各 Spec/Tests（読み取り専用）。**Lean モジュールは一切変更していない。**
- 一次資料: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`（law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`、改変せず）。
- `docs/STAGING_WAB.md` / `STAGING_WAC.md` / `STAGING_WAD.md` は参照したが、記載された件数・金額は**信じず**、pinned JSON から Python で独立再抽出して照合した。
- 書き換えたファイルは `docs/ADVERSARIAL_REVIEW.md` のみ。既存のバッチ G/H/I レビューは保持した。

### J-1. 独立抽出 fee 一覧（区分 → 金額 → 原文文字列）
方法: `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化し、`re.sub(r"[\s\u3000]+", "", …)` で正規化。別表第一（二）三十三〜五十九を offset 147142〜157770（正規化文字列）で切り出し（10,628 文字）。その region に対し `につき([日本語数字]+)円` を正規表現で列挙。

- 独立確認した割合型の有無: `千分` **0 回** / `百分` **0 回** / `割合` **0 回** → **本範囲に割合型は実在しない**（num/den 検証対象なし）。
- 抽出された金額付き fee: `につき…円` **124 件** ＋ 括弧内の特例「（電波法第五条第四項の放送をする無線局については、十五万円）」**1 件** ＝ **125 件**。
- 金額内訳（独立抽出）: 十五万円 **76** / 九万円 **43** / 一万五千円 **3** / 三万円 **3** ＝ 125。
- Lean 定数内訳: J1 55 件（15万36/9万17/1.5万2）＋ J2 45 件（15万33/9万12）＋ J3 25 件（15万7/9万14/3万3/1.5万1）＝ **125 件**。multiset は完全一致。
- **順序照合**: 原文出現順と Lean def 定義順を zip して 125 行すべて比較 → **不一致 0**（MISMATCH 0）。各 def の doc-comment 内の日本語金額と def 値の整合も **125/125**（不一致 0）。

下表の「原文 fee 文字列」は独立抽出した region の連続部分（末尾 46 文字＋金額）をそのまま記載したもので、STAGING の needle をコピーしたものではない。

| # | Lean 定数 | 金額 | 独立抽出した原文 fee 文字列 | 一致 |
|---:|---|---:|---|:---:|
| 1 | J1:`certifiedPersonalInfoProtectionOrgCertFee` | 90,000 | …第四十七条第一項（認定）の認定個人情報保護団体の認定（政令で定めるものに限る。）認定件数一件につき九万円 | ✓ |
| 2 | J1:`securityGuardTrainingOrgRegFee` | 90,000 | …律第百十七号）第二十三条第三項（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 3 | J1:`datingInducementInfoProviderRegFee` | 15,000 | …十三号）第十八条第一項（登録誘引情報提供機関の登録）の登録誘引情報提供機関の登録登録件数一件につき一万五千円 | ✓ |
| 4 | J1:`casinoBusinessLicenseFee` | 150,000 | …三十年法律第八十号）第三十九条（免許等）のカジノ事業の免許（更新の免許を除く。）免許件数一件につき十五万円 | ✓ |
| 5 | J1:`casinoFacilityOperationBusinessLicenseFee` | 150,000 | …設区域整備法第百二十四条（免許）のカジノ施設供用事業の免許（更新の免許を除く。）免許件数一件につき十五万円 | ✓ |
| 6 | J1:`casinoRelatedEquipmentBusinessPermitFee` | 150,000 | …業、カジノ関連機器等販売業又はカジノ関連機器等修理業の許可（更新の許可を除く。）許可件数一件につき十五万円 | ✓ |
| 7 | J1:`casinoRelatedEquipmentForeignManufacturerCertFee` | 150,000 | …機器等外国製造業の認定）のカジノ関連機器等外国製造業の認定（更新の認定を除く。）認定件数一件につき十五万円 | ✓ |
| 8 | J1:`foreignBankBusinessLicenseFee` | 150,000 | …年法律第五十九号）第十条第二項第八号（業務の範囲）に規定する外国銀行の営業の免許免許件数一件につき十五万円 | ✓ |
| 9 | J1:`bankForeignBankAgencyBusinessApprovalFee` | 150,000 | …二条の二第一項又は第二項（外国銀行代理業務に係る認可等）の外国銀行代理業務の認可認可件数一件につき十五万円 | ✓ |
| 10 | J1:`longTermCreditBankForeignBankAgencyApprovalFee` | 150,000 | …六条の三第一項又は第二項（外国銀行代理業務に係る認可等）の外国銀行代理業務の認可認可件数一件につき十五万円 | ✓ |
| 11 | J1:`bankForeignBranchEstablishmentApprovalFeePerPlace` | 150,000 | …）銀行に係る法令の規定による次に掲げる認可イ銀行の外国における支店の設置の認可支店の数一箇所につき十五万円 | ✓ |
| 12 | J1:`bankForeignOfficeEstablishmentApprovalFeePerPlace` | 90,000 | …の変更の認可（臨時の営業所の設置に係る認可その他の政令で定める認可を除く。）営業所の数一箇所につき九万円 | ✓ |
| 13 | J1:`bankForeignBusinessOutsourcingContractApprovalFee` | 90,000 | …）営業所の数一箇所につき九万円ハ銀行の外国における業務の委託契約の締結に係る認可認可件数一件につき九万円 | ✓ |
| 14 | J1:`subsidiaryForeignBankBranchEstablishmentApprovalFeePerPlace` | 150,000 | …る次に掲げる認可イ銀行法第十条第二項第八号に規定する外国銀行の支店の設置の認可支店の数一箇所につき十五万円 | ✓ |
| 15 | J1:`subsidiaryForeignBankOfficeEstablishmentApprovalFeePerPlace` | 90,000 | …の変更の認可（臨時の営業所の設置に係る認可その他の政令で定める認可を除く。）営業所の数一箇所につき九万円 | ✓ |
| 16 | J1:`creditCooperativeBusinessLicenseFee` | 150,000 | …政令で定める認可を除く。）営業所の数一箇所につき九万円（六）信用金庫の事業の免許免許件数一件につき十五万円 | ✓ |
| 17 | J1:`creditCooperativeForeignBankAgencyApprovalFee` | 150,000 | …号）第五十四条の二第一項（外国銀行代理業務に係る認可等）の外国銀行代理業務の認可認可件数一件につき十五万円 | ✓ |
| 18 | J1:`creditCooperativeSubOfficeEstablishmentApprovalFeePerPlace` | 90,000 | …件数一件につき十五万円（八）信用金庫の従たる事務所の設置に係る定款変更の認可事務所の数一箇所につき九万円 | ✓ |
| 19 | J1:`financialInstitutionConversionApprovalFee` | 150,000 | …よる転換（当該転換後の法人が労働金庫又は信用協同組合であるものを除く。）の認可転換の件数一件につき十五万円 | ✓ |
| 20 | J1:`financialInstitutionRegistrationFee` | 150,000 | …融商品取引法（昭和二十三年法律第二十五号）第三十三条の二（金融機関の登録）の登録登録件数一件につき十五万円 | ✓ |
| 21 | J1:`trustBusinessConcurrentOperationApprovalFee` | 150,000 | …法律（昭和十八年法律第四十三号）第一条第一項（兼営の認可）の規定による営業の認可認可件数一件につき十五万円 | ✓ |
| 22 | J1:`bankHoldingCompanyApprovalFee` | 150,000 | …銀行法第五十二条の十七第一項又は第三項ただし書（銀行持株会社に係る認可等）の認可認可件数一件につき十五万円 | ✓ |
| 23 | J1:`longTermCreditBankHoldingCompanyApprovalFee` | 150,000 | …十六条の二の四第一項又は第三項ただし書（長期信用銀行持株会社に係る認可等）の認可認可件数一件につき十五万円 | ✓ |
| 24 | J1:`bankAgencyBusinessPermitFee` | 90,000 | …機関の代理業の許可（一）銀行法第五十二条の三十六第一項（許可）の銀行代理業の許可許可件数一件につき九万円 | ✓ |
| 25 | J1:`longTermCreditBankAgencyBusinessPermitFee` | 90,000 | …用銀行法第十六条の五第一項（長期信用銀行代理業の許可）の長期信用銀行代理業の許可許可件数一件につき九万円 | ✓ |
| 26 | J1:`creditCooperativeAgencyBusinessPermitFee` | 90,000 | …件につき九万円（三）信用金庫法第八十五条の二第一項（許可）の信用金庫代理業の許可許可件数一件につき九万円 | ✓ |
| 27 | J1:`laborBankAgencyBusinessPermitFee` | 90,000 | …和二十八年法律第二百二十七号）第八十九条の三第一項（許可）の労働金庫代理業の許可許可件数一件につき九万円 | ✓ |
| 28 | J1:`creditCooperativeFinancialBusinessAgencyPermitFee` | 90,000 | …八十三号）第六条の三第一項（信用協同組合代理業の許可）の信用協同組合代理業の許可許可件数一件につき九万円 | ✓ |
| 29 | J1:`electronicPaymentOperatorRegFee` | 150,000 | …者協会等の認定（一）銀行法第五十二条の六十の三（登録）の電子決済等取扱業者の登録登録件数一件につき十五万円 | ✓ |
| 30 | J1:`creditCooperativeElectronicPaymentOperatorRegFee` | 150,000 | …円（二）信用金庫法第八十五条の三第一項（登録）の信用金庫電子決済等取扱業者の登録登録件数一件につき十五万円 | ✓ |
| 31 | J1:`creditCooperativeFinancialBusinessElectronicPaymentOperatorRegFee` | 150,000 | …一項（信用協同組合電子決済等取扱業の登録）の信用協同組合電子決済等取扱業者の登録登録件数一件につき十五万円 | ✓ |
| 32 | J1:`certifiedElectronicPaymentOperatorAssociationCertFee` | 150,000 | …二十五（認定電子決済等取扱事業者協会の認定）の認定電子決済等取扱事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 33 | J1:`certifiedCreditCooperativeElectronicPaymentOperatorAssociationCertFee` | 150,000 | …金庫電子決済等取扱事業者協会の認定）の認定信用金庫電子決済等取扱事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 34 | J1:`certifiedCreditCooperativeFinancialBusinessElectronicPaymentAssociationCertFee` | 150,000 | …電子決済等取扱事業者協会の認定）の認定信用協同組合電子決済等取扱事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 35 | J1:`electronicPaymentProxyOperatorRegFee` | 90,000 | …協会等の認定（一）銀行法第五十二条の六十一の二（登録）の電子決済等代行業者の登録登録件数一件につき九万円 | ✓ |
| 36 | J1:`creditCooperativeElectronicPaymentProxyOperatorRegFee` | 90,000 | …円（二）信用金庫法第八十五条の四第一項（登録）の信用金庫電子決済等代行業者の登録登録件数一件につき九万円 | ✓ |
| 37 | J1:`laborBankElectronicPaymentProxyOperatorRegFee` | 90,000 | …円（三）労働金庫法第八十九条の五第一項（登録）の労働金庫電子決済等代行業者の登録登録件数一件につき九万円 | ✓ |
| 38 | J1:`creditCooperativeFinancialBusinessElectronicPaymentProxyOperatorRegFee` | 90,000 | …一項（信用協同組合電子決済等代行業の登録）の信用協同組合電子決済等代行業者の登録登録件数一件につき九万円 | ✓ |
| 39 | J1:`certifiedElectronicPaymentProxyOperatorAssociationCertFee` | 150,000 | …の十九（認定電子決済等代行事業者協会の認定）の認定電子決済等代行事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 40 | J1:`certifiedCreditCooperativeElectronicPaymentProxyAssociationCertFee` | 150,000 | …金庫電子決済等代行事業者協会の認定）の認定信用金庫電子決済等代行事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 41 | J1:`certifiedLaborBankElectronicPaymentProxyAssociationCertFee` | 150,000 | …金庫電子決済等代行事業者協会の認定）の認定労働金庫電子決済等代行事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 42 | J1:`certifiedCreditCooperativeFinancialBusinessElectronicPaymentProxyAssociationCertFee` | 150,000 | …電子決済等代行事業者協会の認定）の認定信用協同組合電子決済等代行事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 43 | J1:`newInsuranceBusinessLicenseFee` | 150,000 | …八十五条第一項（免許）又は第二百十九条第一項（免許）の規定による保険業の新規免許免許件数一件につき十五万円 | ✓ |
| 44 | J1:`smallShortTermInsuranceBusinessOperatorRegFee` | 150,000 | …につき十五万円（二）保険業法第二百七十二条第一項（登録）の少額短期保険業者の登録登録件数一件につき十五万円 | ✓ |
| 45 | J1:`specialInsuranceBusinessApprovalFee` | 150,000 | …特例）の特定保険業の認可（国の行政機関による認可として政令で定めるものに限る。）認可件数一件につき十五万円 | ✓ |
| 46 | J1:`insuranceBrokerRegFee` | 90,000 | …認可件数一件につき十五万円（四）保険業法第二百八十六条（登録）の保険仲立人の登録登録件数一件につき九万円 | ✓ |
| 47 | J1:`specialInsuranceSolicitorRegFee` | 15,000 | …れる委託又は再委託で財務省令で定めるものを除く。）を受けた者に係るものに限る。）登録件数一件につき一万五千円 | ✓ |
| 48 | J1:`insuranceClaimsTrustBusinessApprovalFee` | 150,000 | …き一万五千円（六）保険業法第九十九条第七項（業務の範囲等）の保険金信託業務の認可認可件数一件につき十五万円 | ✓ |
| 49 | J1:`insuranceHoldingCompanyApprovalFee` | 150,000 | …法第二百七十一条の十八第一項又は第三項ただし書（保険持株会社に係る認可等）の認可認可件数一件につき十五万円 | ✓ |
| 50 | J1:`trustBusinessLicenseFee` | 150,000 | …第百五十四号）第三条（免許）又は第五十三条第一項（免許）の規定による信託業の免許免許件数一件につき十五万円 | ✓ |
| 51 | J1:`managementTypeTrustCompanyRegFee` | 150,000 | …円（二）信託業法第七条第一項（登録）の管理型信託会社の登録（更新の登録を除く。）登録件数一件につき十五万円 | ✓ |
| 52 | J1:`managementTypeForeignTrustCompanyRegFee` | 150,000 | …信託業法第五十四条第一項（登録）の管理型外国信託会社の登録（更新の登録を除く。）登録件数一件につき十五万円 | ✓ |
| 53 | J1:`selfTrustBusinessRegFee` | 150,000 | …信託についての特例）の自己信託に係る事務に関する事業の登録（更新の登録を除く。）登録件数一件につき十五万円 | ✓ |
| 54 | J1:`universityTechnologyTransferApprovedBusinessRegFee` | 150,000 | …大学技術移転事業に係る信託についての特例）の特定大学技術移転事業承認事業者の登録登録件数一件につき十五万円 | ✓ |
| 55 | J1:`trustContractAgencyRegFee` | 90,000 | …数一件につき十五万円（六）信託業法第六十七条第一項（登録）の信託契約代理店の登録登録件数一件につき九万円 | ✓ |
| 56 | J2:`securedBondTrustBizLicenseFee` | 150,000 | …る信託事業の免許担保付社債信託法第三条（免許）の担保付社債に関する信託事業の免許免許件数一件につき十五万円 | ✓ |
| 57 | J2:`enterpriseValueSecurityTrustBizLicenseFee` | 150,000 | …令和六年法律第五十二号）第三十二条（免許）の企業価値担保権に関する信託業務の免許免許件数一件につき十五万円 | ✓ |
| 58 | J2:`financialProductMarketOpeningLicenseFee` | 150,000 | …制業務の認可（一）金融商品取引法第八十条第一項（免許）の金融商品市場の開設の免許免許件数一件につき十五万円 | ✓ |
| 59 | J2:`internationalCooperationEmissionReductionMarketApprovalFee` | 150,000 | …する二以上の会社（金融商品会員制法人を含む。）に共通する業務に係るものを除く。）認可件数一件につき十五万円 | ✓ |
| 60 | J2:`financialExchangeOrgReorganizationApprovalFee` | 150,000 | …五万円（三）金融商品取引法第百一条の十七第一項（組織変更の認可）の組織変更の認可認可件数一件につき十五万円 | ✓ |
| 61 | J2:`otcSecuritiesMarketOpeningApprovalFee` | 150,000 | …）金融商品取引法第六十七条の十二（規則の認可）の店頭売買有価証券市場の開設の認可認可件数一件につき十五万円 | ✓ |
| 62 | J2:`foreignMarketTransactionApprovalFee` | 150,000 | …につき十五万円（五）金融商品取引法第百五十五条第一項（認可）の外国市場取引の認可認可件数一件につき十五万円 | ✓ |
| 63 | J2:`financialExchangeHoldingCompanyApprovalFee` | 150,000 | …十五万円（六）金融商品取引法第百六条の十第一項又は第三項ただし書（認可等）の認可認可件数一件につき十五万円 | ✓ |
| 64 | J2:`certifiedFinancialInstrumentsFirmAssociationCertFee` | 150,000 | …法第七十八条第一項（認定金融商品取引業協会の認定）の認定金融商品取引業協会の認定認定件数一件につき十五万円 | ✓ |
| 65 | J2:`certifiedInvestorProtectionOrgCertFee` | 90,000 | …七十九条の七第一項（認定投資者保護団体の目的及び業務）の認定投資者保護団体の認定認定件数一件につき九万円 | ✓ |
| 66 | J2:`selfRegulatoryBusinessApprovalFee` | 150,000 | …融商品取引法第百二条の十四（自主規制法人による自主規制業務）の自主規制業務の認可認可件数一件につき十五万円 | ✓ |
| 67 | J2:`financialInstrumentsBusinessRegistrationFee` | 150,000 | …債務引受業務の認可（一）金融商品取引法第二十九条（登録）の金融商品取引業者の登録登録件数一件につき十五万円 | ✓ |
| 68 | J2:`financialInstrumentsBusinessChangeRegistrationFee` | 150,000 | …法第二十九条の二第一項第八号若しくは第九号の業務を行うために受けるものに限る。）登録件数一件につき十五万円 | ✓ |
| 69 | J2:`financialInstrumentsBusinessApprovalFee` | 150,000 | …登録件数一件につき十五万円（三）金融商品取引法第三十条第一項（認可）の業務の認可認可件数一件につき十五万円 | ✓ |
| 70 | J2:`foreignSecuritiesUnderwritingPermissionFee` | 90,000 | …万円（四）金融商品取引法第五十九条第一項（引受業務の一部の許可）の引受業務の許可許可件数一件につき九万円 | ✓ |
| 71 | J2:`exchangeTransactionBusinessPermissionFee` | 150,000 | …（五）金融商品取引法第六十条第一項（取引所取引業務の許可）の取引所取引業務の許可許可件数一件につき十五万円 | ✓ |
| 72 | J2:`electronicOtcDerivativeBusinessPermissionFee` | 150,000 | …項（電子店頭デリバティブ取引等業務の許可）の電子店頭デリバティブ取引等業務の許可許可件数一件につき十五万円 | ✓ |
| 73 | J2:`financialInstrumentsIntermediaryRegistrationFee` | 90,000 | …一件につき十五万円（七）金融商品取引法第六十六条（登録）の金融商品仲介業者の登録登録件数一件につき九万円 | ✓ |
| 74 | J2:`creditRatingAgencyRegistrationFee` | 90,000 | …件につき九万円（八）金融商品取引法第六十六条の二十七（登録）の信用格付業者の登録登録件数一件につき九万円 | ✓ |
| 75 | J2:`investmentManagementRelatedBusinessTrusteeRegistrationFee` | 90,000 | …円（九）金融商品取引法第六十六条の七十一（登録）の投資運用関係業務受託業者の登録登録件数一件につき九万円 | ✓ |
| 76 | J2:`financialInstrumentsBusinessChangeRegistrationArticle66_75Fee` | 90,000 | …六十六条の七十二第一項第六号（登録の申請）の業務の種別の増加に係るものに限る。）登録件数一件につき九万円 | ✓ |
| 77 | J2:`financialInstrumentClearingCorpDebtAssumptionLicenseFee` | 150,000 | …品取引法第百五十六条の二（免許）の金融商品取引清算機関の金融商品債務引受業の免許免許件数一件につき十五万円 | ✓ |
| 78 | J2:`foreignFinancialInstrumentClearingCorpDebtAssumptionLicenseFee` | 150,000 | …百五十六条の二十の二（免許）の外国金融商品取引清算機関の金融商品債務引受業の免許免許件数一件につき十五万円 | ✓ |
| 79 | J2:`linkedFinancialInstrumentDebtAssumptionApprovalFee` | 150,000 | …他の金融商品取引清算機関等と連携する場合の認可）の連携金融商品債務引受業務の認可認可件数一件につき十五万円 | ✓ |
| 80 | J2:`securitiesFinanceCompanyLicenseFee` | 150,000 | …融商品取引法第百五十六条の二十四第一項（免許及び免許の申請）の証券金融会社の免許免許件数一件につき十五万円 | ✓ |
| 81 | J2:`specifiedFinancialCompanyRegistrationFee` | 150,000 | …行等に関する法律（平成十一年法律第三十二号）第三条（登録）の特定金融会社等の登録登録件数一件につき十五万円 | ✓ |
| 82 | J2:`moneyLenderRegistrationFee` | 150,000 | …号）第三条第一項（登録）の内閣総理大臣がする貸金業者の登録（更新の登録を除く。）登録件数一件につき十五万円 | ✓ |
| 83 | J2:`moneyLendingBusinessManagerTrainingInstitutionRegistrationFee` | 90,000 | …金業法第二十四条の二十五第二項（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 84 | J2:`mutualFinancingBusinessLicenseFee` | 150,000 | …の認可（一）無尽業法（昭和六年法律第四十二号）第二条第一項（免許）の無尽業の免許免許件数一件につき十五万円 | ✓ |
| 85 | J2:`mutualFinancingCompanyBranchOfficeApprovalFee` | 90,000 | …尽業法第七条第三号（認可）の無尽会社の出張所又は代理店の設置の認可出張所又は代理店の数一箇所につき九万円 | ✓ |
| 86 | J2:`financialServicesIntermediaryRegistrationFee` | 90,000 | …関する法律（平成十二年法律第百一号）第十二条（登録）の金融サービス仲介業者の登録登録件数一件につき九万円 | ✓ |
| 87 | J2:`financialServicesIntermediaryChangeRegistrationFee` | 90,000 | …録（同法第十三条第一項第四号（登録の申請）の業務の種別の増加に係るものに限る。）登録件数一件につき九万円 | ✓ |
| 88 | J2:`certifiedFinancialServicesIntermediaryAssociationCertFee` | 150,000 | …律第四十条（認定金融サービス仲介業協会の認定）の認定金融サービス仲介業協会の認定認定件数一件につき十五万円 | ✓ |
| 89 | J2:`thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee` | 150,000 | …第五十九号）第七条（第三者型発行者の登録）の第三者型前払式支払手段の発行者の登録登録件数一件につき十五万円 | ✓ |
| 90 | J2:`fundsTransferServiceProviderRegistrationFee` | 150,000 | …円（二）資金決済に関する法律第三十七条（資金移動業者の登録）の資金移動業者の登録登録件数一件につき十五万円 | ✓ |
| 91 | J2:`fundsTransferServiceProviderChangeRegistrationFee` | 150,000 | …につき十五万円（三）資金決済に関する法律第四十一条第一項（変更登録等）の変更登録登録件数一件につき十五万円 | ✓ |
| 92 | J2:`electronicPaymentInstrumentEtcTransactionBusinessRegistrationFee` | 150,000 | …法律第六十二条の三（電子決済手段等取引業者の登録）の電子決済手段等取引業者の登録登録件数一件につき十五万円 | ✓ |
| 93 | J2:`electronicPaymentInstrumentEtcTransactionBusinessChangeRegistrationFee` | 150,000 | …き十五万円（五）資金決済に関する法律第六十二条の七第一項（変更登録等）の変更登録登録件数一件につき十五万円 | ✓ |
| 94 | J2:`cryptoAssetExchangeBusinessRegistrationFee` | 150,000 | …決済に関する法律第六十三条の二（暗号資産交換業者の登録）の暗号資産交換業者の登録登録件数一件につき十五万円 | ✓ |
| 95 | J2:`electronicPaymentCryptoAssetServiceIntermediaryRegistrationFee` | 90,000 | …・暗号資産サービス仲介業者の登録）の電子決済手段・暗号資産サービス仲介業者の登録登録件数一件につき九万円 | ✓ |
| 96 | J2:`electronicPaymentCryptoAssetServiceIntermediaryChangeRegistrationFee` | 90,000 | …円（八）資金決済に関する法律第六十三条の二十二の六第一項（変更登録等）の変更登録登録件数一件につき九万円 | ✓ |
| 97 | J2:`foreignExchangeAnalysisBusinessPermissionFee` | 150,000 | …に関する法律第六十三条の二十三（為替取引分析業者の許可）の為替取引分析業者の許可許可件数一件につき十五万円 | ✓ |
| 98 | J2:`businessCategoryChangePermissionFee` | 150,000 | …決済に関する法律第六十三条の三十三第一項（業務の種別の変更の許可等）の変更の許可許可件数一件につき十五万円 | ✓ |
| 99 | J2:`fundsClearingBusinessLicenseFee` | 150,000 | …）資金決済に関する法律第六十四条第一項（資金清算機関の免許等）の資金清算業の免許免許件数一件につき十五万円 | ✓ |
| 100 | J2:`certifiedFundsSettlementBusinessAssociationCertFee` | 150,000 | …する法律第八十七条（認定資金決済事業者協会の認定）の認定資金決済事業者協会の認定認定件数一件につき十五万円 | ✓ |
| 101 | J3:`limitedLiabilityAuditCorpRegFee` | 150,000 | …団体等の認定（一）公認会計士法第三十四条の二十四（有限責任監査法人の登録）の登録登録件数一件につき十五万円 | ✓ |
| 102 | J3:`registeredListedCompanyAuditFirmRegFee` | 90,000 | …万円（二）公認会計士法第三十四条の三十四の二（登録上場会社等監査人の登録）の登録登録件数一件につき九万円 | ✓ |
| 103 | J3:`cpaPracticalTrainingOrgCertFee` | 150,000 | …件につき九万円（三）公認会計士法第十六条第一項（実務補習）の実務補習団体等の認定認定件数一件につき十五万円 | ✓ |
| 104 | J3:`consumerAffairsCounselorExamOrgRegFee` | 150,000 | …法律第五十号）第十条の三第一項（登録試験機関の登録）の登録（更新の登録を除く。）登録件数一件につき十五万円 | ✓ |
| 105 | J3:`specifiedQualifiedConsumerOrgCertFee` | 15,000 | …十六号）第七十一条第一項（特定適格消費者団体の認定）の認定（更新の認定を除く。）認定件数一件につき一万五千円 | ✓ |
| 106 | J3:`telecomBusinessRegFee` | 150,000 | …同法第十条第一項第三号（電気通信事業の登録）の業務区域の増加に係るものに限る。）登録件数一件につき十五万円 | ✓ |
| 107 | J3:`certifiedCyberAttackResponseAssocCertFee` | 150,000 | …サイバー攻撃対処協会の認定）の認定送信型対電気通信設備サイバー攻撃対処協会の認定認定件数一件につき十五万円 | ✓ |
| 108 | J3:`telecomChiefEngineerTrainingOrgRegFee` | 90,000 | …十五条の二第一項（登録講習機関の登録）の登録講習機関の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 109 | J3:`terminalEquipmentCertOrgRegFee` | 90,000 | …第八十六条第一項（登録認定機関の登録）の登録認定機関の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 110 | J3:`registeredSenderOptimizationOrgRegFee` | 90,000 | …二十六号）第十四条第一項（登録送信適正化機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 111 | J3:`certifiedCertificationBusinessRegFee` | 90,000 | …年法律第百二号）第四条第一項（認定）の認定認証事業者の認定（更新の認定を除く。）認定件数一件につき九万円 | ✓ |
| 112 | J3:`certifiedForeignCertificationBusinessRegFee` | 90,000 | …関する法律第十五条第一項（認定）の認定外国認証事業者の認定（更新の認定を除く。）認定件数一件につき九万円 | ✓ |
| 113 | J3:`certifiedElectronicPowerOfAttorneyBusinessRegFee` | 90,000 | …電子委任状取扱業務の認定）の認定電子委任状取扱事業者の認定（更新の認定を除く。）認定件数一件につき九万円 | ✓ |
| 114 | J3:`radioStationLicenseFee` | 30,000 | …設備に係る特例）に規定する実験等無線局その他政令で定める無線局の免許を除く。）無線局の数一局につき三万円 | ✓ |
| 115 | J3:`broadcastRadioStationLicenseFee` | 150,000 | …定める無線局の免許を除く。）無線局の数一局につき三万円（電波法第五条第四項の放送をする無線局については、十五万円 | ✓ |
| 116 | J3:`radioStationRegFee` | 30,000 | …条の二十一第一項（登録）の無線局の登録（再登録その他政令で定める登録を除く。）無線局の数一局につき三万円 | ✓ |
| 117 | J3:`radioEquipmentInspectionBusinessRegFee` | 90,000 | …事業者の登録）の無線設備等の検査又は点検に係る事業者の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 118 | J3:`foreignRadioEquipmentInspectionBusinessRegFee` | 90,000 | …二第一項（外国点検事業者の登録）の外国における無線設備等の点検に係る事業者の登録登録件数一件につき九万円 | ✓ |
| 119 | J3:`registeredRadioEquipmentCertOrgRegFee` | 90,000 | …条の二の二第一項（登録証明機関の登録）の登録証明機関の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 120 | J3:`registeredFrequencyTerminationOrgRegFee` | 90,000 | …十一条の三の二第一項（登録周波数終了対策機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円 | ✓ |
| 121 | J3:`certifiedKeyBroadcastBusinessCertFee` | 90,000 | …十二号）第九十三条第一項（認定）の認定基幹放送事業者の認定（更新の認定を除く。）認定件数一件につき九万円 | ✓ |
| 122 | J3:`registeredGeneralBroadcastBusinessRegFee` | 90,000 | …いる業務区域の属する都道府県における業務区域の増加に係るものを除く。）に限る。）登録件数一件につき九万円 | ✓ |
| 123 | J3:`certifiedBroadcastHoldingCompanyCertFee` | 150,000 | …数一件につき九万円（三）放送法第百五十九条第一項（認定）の認定放送持株会社の認定認定件数一件につき十五万円 | ✓ |
| 124 | J3:`generalMailBusinessLicenseFee` | 90,000 | …関する法律（平成十四年法律第九十九号）第六条（事業の許可）の一般信書便事業の許可許可件数一件につき九万円 | ✓ |
| 125 | J3:`specifiedMailBusinessLicenseFee` | 30,000 | …事業者による信書の送達に関する法律第二十九条（事業の許可）の特定信書便事業の許可許可件数一件につき三万円 | ✓ |

### J-2. needle 健全性の独立検証
`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、`RegistryQualificationFeesJ1/J2/J3` の 3 check に含まれる needle を抽出して検証した（STAGING の needle テキストを信じず、実際に CI が使う文字列を検査）。

| 項目 | 結果 |
|---|---|
| needle 総数 | **56**（J1 15 / J2 17 / J3 24） |
| U+3000（全角空白）を含む needle | **0 件** |
| pinned 正規化テキスト長 | 211,508 文字 |
| `.find()` 結果 | **56/56 FOUND、MISS 0** |
| 出現回数 | 全 needle で **count = 1**（一意） |

- J1 needle の offset: 147158 / 147240 / 147355 / 147519 / 147759 / 147901 / 148155 / 148750 / 149017 / 149346 / 149795 / 150555 / 150999 / 151329 / 151528。
- J2 needle の offset: 151638 / 151855 / 152073 / 152290 / 152506 / 152724 / 152943 / 153160 / 153376 / 153593 / 153809 / 154025 / 154241 / 154458 / 154675 / 154891 / 155108（すべて count 1）。
- J3 needle の offset: 155251 / 155348 / 155441 / 155534 / 156007 / 156113 / 156199 / 156263 / 156348 / 156464 / 156540 / 156603 / 156793 / 156883 / 156960 / 157022 / 157094 / 157159 / 157221 / 157322 / 157464 / 157569 / 157622 / 157691（すべて count 1）。
- 補足: `STAGING_WAC.md` §3 は「原文の … 全角空白等も保持」と書いているが、**実際に `transcription_audit.py` に組み込まれた needle は正規化済みで U+3000 を一切含まない**。Coordinator による初回の全角空白検出・正規化が反映済みであり、pinned 原文の正規化テキストに対する `.find()` は全件通る。原文側の全角空白は `_norm` で除去されるため、needle が原文の全角空白を含んでいても検証は通るが、現状は含まない。

### J-3. 条件漏れ・デーミング・削除条項の扱い（独立確認）

| 原文現象 | 独立抽出での確認 | モデル側の扱い | 判定 |
|---|---|---|---|
| 「更新の登録（免許／許可／認定）を除く。」 | region に `更新` **23 回** | 該当性は caller-established、Bool は金額式に入れず | BY-DESIGN |
| 「政令で定めるものに限る。」「政令で定める認可を除く。」等 | region に `政令` **6 回** | 同上（caller-established） | BY-DESIGN |
| 三十七（注）「…特定保険募集人の登録とみなす。」 | region に `みなす` 2 回のうち 1 回 | 金額なし。**fee def なし**、doc-comment に逐語記載のみ | BY-DESIGN |
| 五十一（注）「…変更の認定は当該登録とみなす。」 | `みなす` 2 回のうち 1 回 | 金額なし。**fee def なし**、doc-comment（caller-established）のみ | BY-DESIGN |
| 四十二及び四十三「削除」 | region に `削除` 2 回のうち 1 回 | fee string なし。**fee def なし**（impl/Spec/Tests とも対応定数なし） | BY-DESIGN |
| 五十六から五十八まで「削除」 | `削除` 2 回のうち 1 回 | 同上。**fee def なし** | BY-DESIGN |
| 「既に…については一万五千円」の軽減（デーミング）規定 | **本範囲（三十三〜五十九）に 0 回**。pinned 全文では 19 回だが、いずれも百号台（百一〜百十九・百四十二の三 等）で本バッチ範囲外 | 本バッチの範囲外として **NOT COVERED**（正しい範囲扱い） | BY-DESIGN |
| 「〜数一箇所につき」（三十五(四)イ・ロ、(五)イ・ロ、(八)） | 原文どおり一箇所あたり単価 | `...PerPlace` suffix、箇所数は caller-established（Nat 掛け算なし） | BY-DESIGN |
| 五十四(一) 特例「放送をする無線局については、十五万円」 | region に 1 回（括弧内） | 独立定数 `broadcastRadioStationLicenseFee` = 150,000 としてモデル化、適用判定は caller-established | BY-DESIGN |

- 「消防設備等」について: pinned 原文では **`六十` 号**（「六十消防の設備等に係る登録検定機関の登録…」）であり、五十〜五十九の region には `消防` **0 回**。`transcription_audit.py` の J3 check 名にある「消防設備等」は**表記の緩み**だが、needle はすべて五十〜五十九内（offset 155251〜157691）、六十 は NOT YET COVERED であり、**fee 欠落・金額不一致ではない**。

### J-4. 反例探索

| 反例 | 結果 |
|---|---|
| 件数 0 | 全 125 件が定額 `Money` 定数なので計算は存在しない。件数 0 のとき 0 円を返すのは呼び出し側の責任（caller-established）。定数側に矛盾なし。 |
| 件数 1 | 定数がそのまま 1 件分の額（例: `insuranceBrokerRegFee = 90_000`）。原文「一件につき九万円」と一致。矛盾なし。 |
| 境界値（更新登録・既登録者・業務区域増加等） | 適用判定 Bool を金額式に組んでいないため、どの条件でも定数値は不変。矛盾なし。 |
| ゼロ円定数 | 全 125 定数に `*_pos : fee > 0 := by decide` が付与され、原文の最小額も 15,000 円。**0 円定数なし**。 |
| 割合型の誤転記（10 倍過大） | 本範囲に割合型が存在しないため対象外。小数点率定数は 1 件もない。 |
| 単調性 | 本モジュールは定数のみで関数計算がないため、単調性定理の対象なし（BY-DESIGN）。 |

**反例探索で見つかった原文↔Lean の矛盾: 0 件。**

### J-5. 公理監査
一時ファイル `C:\Users\junny\AppData\Local\Temp\opencode\BatchJAxiomProbe.lean` を作成し、3 モジュール＋3 Spec の**名前付き宣言 378 件**（J1 impl 110 / J1Spec 56 / J2 impl 90 / J2Spec 46 / J3 impl 50 / J3Spec 26）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 378 |
| `does not depend on any axioms` | **378/378** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

一時 lean ファイル（および一時 Python スクリプト・出力）は**削除済み**。

### J-6. 判定

#### CONFIRMED（0 件）
**ゼロ。** 金額不一致・fee 脱落・needle MISS・公理混入・反例矛盾はいずれも発見されなかった。

#### BY-DESIGN（9 件）
- **B-J1** 全 125 件が定額 `Money` 定数。件数・箇所数の Nat 掛け算は行わず caller-established。
- **B-J2** 本範囲に割合型なし（`千分`/`百分`/`割合` 各 0 回を独立確認）。`TaxRate`/`applyFloor` 不使用。
- **B-J3** 「更新の登録を除く」「政令で定めるものに限る」等の適用判定は caller-established、Bool を式に入れない。
- **B-J4** 三十七（注）・五十一（注）のみなし（デーミング）規定は金額なし、fee def なし（doc-comment のみ）。
- **B-J5** 四十二・四十三、五十六〜五十八の削除行は fee def なし。
- **B-J6** 「既に…については一万五千円」軽減規定は本範囲に存在せず、百一以降の範囲外として NOT COVERED。
- **B-J7** 「一箇所につき」5 件は `PerPlace` suffix（一箇所あたり単価）、箇所数は caller-established。
- **B-J8** 五十四(一) の放送用無線局の特例十五万円は独立定数としてモデル化、適用判定は caller-established。
- **B-J9** 五十以前・六十以降（消防設備等＝六十 を含む）は NOT YET COVERED。check 名の「消防設備等」は表記の緩みで、needle・fee への影響なし。

#### UNRESOLVED（2 件）
- **U-J1** 「更新の登録を除く」「政令で定めるものに限る」「業務区域の増加に係るものに限る」等の適用条件をモデル化せず caller-established とする処理が、形式化として法的に十分か。pinned 原文のみでは解けず、**人間の法律専門家によるレビューを要する**（バッチ I の U-2 と同種）。
- **U-J2** 五十四(一) の「放送をする無線局については、十五万円」という条件付き代替額を独立定数で表現することが原文の法的意味に合致するか。pinned 原文のみでは確定できず、**専門家判断を要する**。

#### 要約
- **CONFIRMED: 0 件（発見ゼロ）** / **BY-DESIGN: 9 件** / **UNRESOLVED: 2 件**。
- needle 健全性: U+3000 **0 件**、**56/56 FOUND**（MISS 0、すべて count 1）。
- 公理結果: Choice / sorryAx / Quot.sound / propext すべて **0 件**、378/378 axiom-free。一時ファイルは削除済み。
- Lean モジュール変更: **なし**。書き換えたのは本ファイルのみ（既存 G/H/I レビュー保持）。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・125 定数との金額/順序照合・needle の `.find()` 検証・反例走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Batch K review (2026-11-18)

### K-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当 W-AE / W-AF / W-AG から独立）。担当者の STAGING は参照したが、率・算術・原文文字列は**pinned JSON から Python で直接再抽出**して照合し、STAGING の数値・needle 記載は信じていない。
- **対象モジュール（読み取り専用・本レビューで変更していない）**:
  - `JapanTaxLaw/LocalTaxLightOilQuantity.lean`（+ `-Spec.lean` / `-Tests.lean`）— 地方税法施行令 art. 43の13、W-AE
  - `JapanTaxLaw/LocalTaxVehicleSnowRate.lean`（+ `-Spec.lean` / `-Tests.lean`）— 同 art. 44の3、W-AF
  - `JapanTaxLaw/LocalTaxInsuranceEstimate.lean`（+ `-Spec.lean` / `-Tests.lean`）— 同 art. 52の10の2（NOT MODELLED）/ 56の89の6、W-AG
- **一次資料（pinned・改変禁止）**: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
  - Python で直接確認: `law_info.law_id = 325CO0000000245`、`revision_info.law_revision_id = 325CO0000000245_20261101_508CO0000000083`、`amendment_enforcement_date = 2026-11-01`、`current_revision_status = CurrentEnforced`、`amendment_law_id = 508CO0000000083`。
- **抽出方法**: `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化（1,220,459 文字／正規化後 1,219,606 文字）。`MainProvision` 配下の `Article` を走査し（全 855 条文）、`ArticleTitle` が `第四十三条の十三` / `第四十四条の三` / `第五十二条の十の二` / `第五十六条の八十九の六` の本文を逐語取得した。率は `fractions.Fraction` で有理数比較した。
- **書き換えたファイルは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。Lean モジュール・Spec・Tests は読み取り専用（レビュー前後で `git status --short` はクリーン）。commit / push / merge / ブランチ切替は行っていない。

### K-1. 独立抽出結果（条号 → 率／算術 → 原文文字列）

原文文字列は pinned JSON の `Article` 本文を `re.sub(r"[\s\u3000]+", "", …)` で正規化したもの（各条文の全角空白 U+3000 は 0 個）。

| 条号 | 抽出した原文部分文字列 | 独立抽出した率／算術 | Lean 定数／式 | 照合 |
|---|---|---|---|---|
| 43の13 特約業者 | `当該軽油の数量に百分の一を乗じて得た数量` | 百分の一 = 1/100 = 0.01 | `tokuteiReductionRate = ⟨1,100⟩` / `lightOilReduction = quantity * 1 / 100` | ✅ |
| 43の13 元売業者 | `当該軽油の数量に百分の〇・三を乗じて得た数量` | 百分の〇・三 = 0.3/100 = **30/10000 = 3/1000 = 0.003** | `motouriReductionRate = ⟨30,10000⟩` / `motouriLightOilReduction = quantity * 30 / 10000` | ✅ |
| 44の3 冒頭 | `十分の十から` | 十分の十 = 10/10 = 1 | `fullRate = ⟨10,10⟩` | ✅ |
| 44の3 月数キャップ | `月数（当該月数が四を超える場合には、四）` | cap = 4 | `capSnowMonths = min s 4` | ✅ |
| 44の3 控除率 | `に十分の〇・七五を乗じて得た数を控除したものとする` | 十分の〇・七五 = 0.75/10 = **75/1000 = 3/40 = 0.075**（1 月あたり控除率） | `monthlyReductionRate = ⟨3,40⟩` | ✅ |
| 44の3 軽減割合 | 上記の合成（十分の十 − min(s,4)×十分の〇・七五） | (40 − 3·min(s,4)) / 40 | `snowReductionRatioNum = 40 - 3 * cap` / `snowReductionRatio` / `snowReducedTax`（`applyFloor`） | ✅ |
| 44の3 第2項 | `２前項の月数は、暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる` | 月数の算定方法（算術出力ではない） | **NOT MODELLED**（needle で逐語保持、`snowMonths` は caller-established） | ✅（BY-DESIGN） |
| 52の10の2 | `価格に…割合を乗じて得た価格に相当する部分とする` | 課税客体（家屋・償却資産の部分）の定義。税額／見込額の算術出力なし | **NOT MODELLED**（needle 5 で逐語保持） | ✅（BY-DESIGN） |
| 56の89の6 除数 | `前年度分の国民健康保険税額を十二（…月数）で除して` | 除数 = 12（発生が前年度初日後なら「発生月から前年度三月までの月数」） | `divisor` は caller-established、`standardInsuranceTaxEstimate` は除数 12 | ✅ |
| 56の89の6 乗数 | `で除して得た額に十二を乗じて得た額` | 乗数 = **十二（12）** | `insuranceTaxEstimate p d`（multiplier = 12 固定） | ✅ |
| 56の89の6 端数 | `当該金額に百円未満の端数があるときは、その端数金額を切り捨てた金額` | 百円未満切り捨て（乗算後に適用） | `estimateHundredYenFloor x = x / 100 * 100`、算術全体は `((p / d) * 12) / 100 * 100` | ✅ |

**全文逐語（4 条文・独立抽出）**:

- **43の13**（156 文字）: `（法第百四十四条の十四第三項の引取りの際減少すべき軽油の数量）第四十三条の十三法第百四十四条の十四第三項に規定する政令で定める数量は、特約業者からの引取りに係る軽油については当該軽油の数量に百分の一を乗じて得た数量とし、元売業者からの引取りに係る軽油については当該軽油の数量に百分の〇・三を乗じて得た数量とする。`
- **44の3**（183 文字）: `（法第百五十四条第三項の自動車税の税率に乗ずる割合）第四十四条の三法第百五十四条第三項に規定する政令で定める割合は、十分の十から積雪により自動車を運行の用に供することができないと認められる期間の月数（当該月数が四を超える場合には、四）に十分の〇・七五を乗じて得た数を控除したものとする。２前項の月数は、暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる。`
- **52の10の2**（213 文字）: `（法第三百四十九条の三第十七項の家屋及び償却資産の部分）第五十二条の十の二法第三百四十九条の三第十七項に規定する水道又は工業用水道の用に供するものとして政令で定める部分は、独立行政法人水資源機構が所有するダムの用に供する家屋及び償却資産のうち、当該固定資産の価格に当該ダムの新築又は改築に要する費用の額につき当該ダムを水道又は工業用水道の用に供する者が負担する額の当該費用の額に対する割合を乗じて得た価格に相当する部分とする。`
- **56の89の6**（215 文字）: `（支払回数割保険税額の見込額の算定方法）第五十六条の八十九の六法第七百十八条の八第二項に規定する政令で定めるところにより算定した額は、当該年度の前年度分の国民健康保険税額を十二（当該国民健康保険税の納税義務が当該前年度の初日後に発生したものである場合にあつては、その発生した日の属する月から当該前年度の三月までの月数）で除して得た額に十二を乗じて得た額（当該金額に百円未満の端数があるときは、その端数金額を切り捨てた金額）とする。`

### K-2. 最重要 3 点の独立判定

| # | 争点 | 委譲元要約 | pinned 原文（独立抽出） | ワーカーの採用 | 独立判定 |
|---|---|---|---|---|---|
| 1 | art. 44の3 の軽減率 | 「月数に**十分の一**を乗じて**減じた数**」（1/10、4 ヶ月で 0.6） | 「月数（…四）に**十分の〇・七五**を乗じて得た数を**控除したものとする**」 | 〇・七五 = 0.75/10 = 75/1000 = **3/40**（4 ヶ月で 0.7） | **ワーカーは原文に忠実（正しい）。要約のほうが誤り。CONFIRMED ではない（BY-DESIGN）。** |
| 2 | art. 43の13 の小数点率 | （指示に特段の食い違いなし） | 「元売業者…数量に**百分の〇・三**を乗じて得た数量」 | 30/10000 = 3/1000 = 0.003（0.3%） | **ワーカーは原文に忠実（正しい）。30/1000 = 3% の 10 倍過大バグは不在。CONFIRMED ではない（BY-DESIGN）。** |
| 3 | art. 56の89の6 の算術 | 「残りの納期の数を乗じて得た額」 | 「十二で除して得た額に**十二を乗じて得た額**（百円未満端数切り捨て）」 | 乗数 12 固定（`insuranceTaxEstimate`）、除数 12（`standardInsuranceTaxEstimate`） | **ワーカーは原文に忠実（正しい）。要約のほうが誤り。CONFIRMED ではない（BY-DESIGN）。** |

補足（判定の理由）:

- **〇・七五 = 3/40**: 十進「〇・七五」を 0.75 として `0.75 / 10 = 0.075 = 3/40` に通分したもの。Nat 分数では `⟨7.5,10⟩` と表現できないため `⟨3,40⟩` を採ったのは整数化として妥当。軽減割合 `(40 − 3·min(s,4))/40` は s=0→1.0 / s=1→0.925 / s=4→0.7 / s≥4→0.7 で、原文の「十分の十から…控除」と整合。もし要約の 1/10 を採れば s=4 で 0.6 となり原文と矛盾し、かつ needle が pinned 正規化テキストに MISS する。
- **百分の〇・三 = 30/10000**: `0.3 / 100 = 0.003 = 3/1000 = 30/10000`。`⟨30,1000⟩` なら 0.03（3%）で 10 倍過大。実装は `⟨30,10000⟩` で、smoke `motouriLightOilReduction 1000 = 3` も独立再計算（1000×30/10000 = 3）と一致。
- **÷12×12**: 原文は「十二で除して得た額に十二を乗じて得た額」であり除数・乗数とも十二。実装 `(p / 12) * 12` はこれに一致。百円未満切り捨ては乗算**後**に適用（`floor100((p/d)*12)`）されており、原文の「得た額（当該金額に百円未満の端数…）」の適用順序とも整合。委譲要約の「残りの納期の数」という読みにも対応する一般形 `insuranceTaxEstimateWithMultiplier` も併設されているが、原文忠実形は `insuranceTaxEstimate` として明示されている。

→ **3 点すべてでワーカーの判断は pinned 原文に忠実であり、モデル値の誤りは発見されなかった。委譲要約の 2 点（十分の一、残りの納期の数）は原文と食い違うが、これは本レビュー対象の Lean モジュールの欠陥ではない。**

### K-3. needle 健全性（CI 実装を直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、`law_id = 325CO0000000245` の check（3 件）に実際に組み込まれた needle を抽出して検証した（STAGING の needle 記載ではなく CI が使う文字列を検査）。

| 項目 | 結果 |
|---|---|
| law 325CO0000000245 の check 数 | **3**（43の13 / 44の3 / 56の89の6、各 3 / 4 / 5 needle） |
| needle 総数 | **12**（43の13: 3 / 44の3: 4 / 56の89の6: 5、うち 1 本は 52の10の2 の原文保持） |
| U+3000（全角空白）を含む needle | **0 件** |
| 長さ範囲 | 61〜90 文字（すべて 60〜130 の範囲内） |
| pinned 正規化テキスト（1,219,606 文字）に対する `.find()` | **12/12 FOUND、MISS 0** |
| `.count()` | 全 needle で **1**（一意） |

- 43の13 needle offsets（正規化）: 236223 / 236195 / 236243。
- 44の3 needle offsets（正規化）: 241741 / 241819 / 241862 / 241795。
- 56の89の6 + 52の10の2 needle offsets（正規化）: 437046 / 437132 / 437196 / 437113 / 334564。
- 52の10の2 の needle は NOT MODELLED 判定の根拠として原文保持されており、needle 自体は FOUND（モデル化漏れではない）。

**needle 健全性: 問題なし（12/12 FOUND、U+3000 0 件、MISS 0）。**

### K-4. 条件漏れ・端数処理の反映

| チェック項目 | pinned 原文での確認 | モデル側の扱い | 判定 |
|---|---|---|---|
| 52の10の2（定義規定）の NOT MODELLED | 原文は「価格に…割合を乗じて得た価格に相当する部分とする」で、課税客体（どの部分が水道・工業用水道用とみなされるか）を定義。割合・価格・費用額・負担額はすべて caller-established で、税額／見込額の算術出力は存在しない | fee/tax の def を作らず NOT MODELLED。needle 5 で原文を逐語保持 | **BY-DESIGN（妥当）**。なお原文には「価格×割合」の乗算が定義上存在するため、委譲要約の「算術なし」はやや簡略化された表現だが、**金額算術（納付税額の算定）ではない**という STAGING §8 の説明は原文と整合し、NOT MODELLED の判断は支持できる。 |
| 44の3 第2項「一月に満たない端数を切り捨てる」 | 月数の算定方法（暦に従う・一月未満切捨て）を定める規定であり、軽減割合・税額の算術ではない | snowMonths を caller-established の入力として扱い NOT MODELLED。needle 3 で逐語保持 | **BY-DESIGN**（入力確定は呼び出し側責任）。法的十分性は U-K2 で保留。 |
| 百円未満切り捨て（56の89の6） | 原文に明記 | `estimateHundredYenFloor = x / 100 * 100` として明示的にモデル化、乗算後に適用 | **BY-DESIGN（原文忠実）**。 |
| Nat 除算の切り捨て（56の89の6 の「÷除数」、43の13・44の3 の end 数除算） | 原文に端数規定の明記なし | Nat の商（floor）を採用 | **BY-DESIGN**（モデル選択として明示）。法的正当性は U-K1 で保留。 |
| 該当性・数量・税額・区分の caller-established 化 | — | Bool を算術式に入れず、率選択にのみ使用。数量・基準税額・前年度税額・除数・該当性はすべて caller-established と doc-comment で明記 | **BY-DESIGN**。 |

### K-5. CONFIRMED / BY-DESIGN / UNRESOLVED の件数

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **8** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = ゼロ）を明示する。** モデル化された率・算術・定数・needle・公理のいずれにも原文との食い違いは検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 率: 43の13 の 1/100 と 30/10000、44の3 の 10/10・3/40・cap 4、56の89の6 の ÷12×12・百円未満切り捨て、すべて原文と一致。
- 算術: `(quantity*1)/100`、`(quantity*30)/10000`、`(40−3·min(s,4))/40`、`((p/d)*12)/100*100` は原文の定式と一致（K-2、K-6 参照）。
- needle: 12/12 FOUND、U+3000 0 件、MISS 0（K-3）。
- 公理: 禁止公理 0 件（K-7）。
- 3 点の委譲要約との相違（K-2）は**ワーカーが原文を採ったことで解消済み**であり、CONFIRMED に計上しない。

#### BY-DESIGN（8 件）

- **B-K1** 43の13 元売業者を `⟨30,10000⟩`（= 3/1000 = 0.3%）とした判断は原文「百分の〇・三」に忠実。10 倍過大バグ（`⟨30,1000⟩`）は不在で、Tests の `1000 → 3` ガードも独立計算と一致。
- **B-K2** 44の3 の控除率を 〇・七五 = 3/40 とした判断は原文に忠実。委譲要約の 1/10（4 ヶ月で 0.6）は原文と矛盾するため採用しなかったのは正しい。
- **B-K3** 56の89の6 の乗数を十二・除数を十二とした判断は原文に忠実。委譲要約の「残りの納期の数」は原文と矛盾する。一般形 `insuranceTaxEstimateWithMultiplier` の併設も差し支えなし（原文忠実形が標準として明示されている）。
- **B-K4** 52の10の2 を NOT MODELLED とした判断（K-4）。定義規定で税額算術出力なし、needle で原文保持。
- **B-K5** 44の3 第2項の月数算定（暦計算・一月未満切捨て）を NOT MODELLED とし、snowMonths を caller-established とした判断（K-4）。
- **B-K6** 数量・基準税額・前年度税額・除数・該当性・事業者区分はすべて caller-established、Bool は率選択のみに使用し算術式に入れない設計。
- **B-K7** 端数処理を Nat floor / `TaxRate.applyFloor` / 百円未満切り捨てとして明示（法的正当性は U-K1 で保留、原文に明記のある百円未満切り捨てはそのまま模型化）。
- **B-K8** 44の3 の割合を `⟨40−3·min, 40⟩` とし、Spec の `⟨1000−75·cap, 1000⟩` と 25 倍関係で同値にした符号化（impl ≡ spec を交差掛けで確認）。

#### UNRESOLVED（2 件）

- **U-K1 端数処理（floor）の法的正当性**: 43の13（数量×率の端数）と 44の3（割合適用後の税額）は原文に端数規定を持たず、モデルは Nat の切り捨てを採用。56の89の6 も「前年度税額÷除数」の Nat 除算は切り捨て（原文に明記があるのは百円未満切り捨てのみ）。pinned 原文のみではこれらの切り捨てが法的に正しいか決定不能。**人間の法律専門家による確認を要する**（バッチ G/H/I/J の U-1 と同趣旨）。
- **U-K2 44の3 第2項の月数算定の NOT MODELLED が法的に十分か**: 「暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる」は原文に明記された算定ルールだが、本モデルでは月数を caller-established として扱い未モデル化。透明に申告されているが、この扱いで足りるかは pinned 原文のみでは解けず、**専門家判断を要する**。率・税額の一致（発見ゼロ）には影響しない。

### K-6. 反例探索（独立再計算）

Python で Lean と同一の整数式を再計算し、指定された攻撃点を走査した。下表の値はすべて Lean の `by decide` smoke と一致（矛盾 0 件）。

| 攻撃対象 | 独立再計算 | Lean smoke | 結果 |
|---|---|---|---|
| 軽油数量 0／1／99 | 特約 0/0/0、元売 0/0/0 | 同じ | 矛盾なし |
| 軽油数量 100 | 特約 1、元売 0 | `lightOilReduction 100 = 1` / `motouriLightOilReduction 100 = 0` | 矛盾なし |
| 軽油数量 334（切上がり境界） | 元売 1（334×30/10000 = 1.002） | `motouriLightOilReduction 334 = 1` | 矛盾なし |
| 軽油数量 1000（10 倍ガード） | 元売 3（0.3%）、特約 10 | `motouri 1000 = 3` / `tokutei 1000 = 10` | 矛盾なし（`⟨30,1000⟩` なら 30 となるところ正しく 3） |
| 積雪月数 0/1/4/5（キャップ） | 割合 1.0 / 0.925 / 0.7 / 0.7、base 1000 → 1000 / 925 / 700 / 700 | 同じ | 矛盾なし（s≥4 でキャップ、4 ヶ月で 0.7 を独立確認） |
| 積雪月数 5 と 4 の同値 | `cap 5 = cap 4 = 4` → num 28 で同値 | `snowReducedTax 1000 5 = 700 = snowReducedTax 1000 4` | 矛盾なし |
| 基準税額 0／1 | s=4 で 0 / 0 | `snowReducedTax 0 4 = 0` / `snowReducedTax 1 4 = 0` | 矛盾なし |
| 基準税額 999（端数） | s=1→924、s=5→699 | `snowReducedTax 999 1 = 924` / `999 5 = 699` | 矛盾なし |
| 前年度税額 0 | 見込額 0 | `insuranceTaxEstimate 0 12 = 0` | 矛盾なし |
| 前年度税額 12（割り切れるが百円未満） | (12/12)×12 = 12 → floor100 = 0 | `standardInsuranceTaxEstimate 12 = 0` | 矛盾なし |
| 前年度税額 199／1199／1000000 | 100 / 1100 / 999900 | 同じ | 矛盾なし |
| 除数を月数に変更（6） | 120000/6×12 = 240000 → 240000 | `insuranceTaxEstimate 120000 6 = 240000` | 矛盾なし |
| 乗数 0（委譲要約の「納期数 0」読み） | 0 | `insuranceTaxEstimateWithMultiplier 120000 12 0 = 0` | 矛盾なし（一般形が要約読みも吸収） |
| 除数 0 | Lean の `Nat.div` は 0 を返す → 見込額 0 | `insuranceTaxEstimateWithMultiplier 120000 0 0 = 0`（Tests） | 矛盾なし（除数は caller-established の正値が前提と明記、非現実的入力） |
| 52の10の2 の定義乗算 | 税額出力なし | def なし | 矛盾なし（NOT MODELLED・BY-DESIGN） |

**反例探索で検出された原文↔Lean の矛盾: 0 件（ゼロ）。**

### K-7. 公理監査

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\BatchKAxiomProbe.lean` を作成し、9 モジュール（impl 3 + Spec 3 + Tests 3）の**名前付き宣言 73 件**（43の13: 20 / 44の3: 17 / 56の89の6: 18 / 各 Spec: 4・6・8 / Tests: 名前付き宣言なし＝全て匿名 `example`）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**、error 0）。監査後、一時ファイル・一時スクリプトは**削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **73** |
| `does not depend on any axioms` | **65** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **8 件**: `VehicleSnowRate.capSnowMonths_le_four` / `snowReductionRatioNum_pos` / `snowReductionRatio_num_pos`（3 件）、`InsuranceEstimate.estimateHundredYenFloor_le` / `_id`、`insuranceTaxEstimateWithMultiplier_zero_left` / `_zero_multiplier`、`insuranceTaxEstimate_zero`（5 件）。いずれも `simp` 由来の許容範囲。 |

- 補足（テキスト走査の偽陽性への注意）: `LocalTaxLightOilQuantity.lean` の doc-comment に `sorry` / `admit` / `Classical.choice` / `propext` という文字列が各 1 回現れるが、これは「no `sorry`, `admit`, `Classical.choice` or `propext`」という**禁止公理不在の宣言文**であり実使用ではない。`#print axioms` により当該モジュールを含む全宣言で実使用 0 を確認した。

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### K-8. 総合判定・最終報告

- pinned revision `325CO0000000245_20261101_508CO0000000083`（地方税法施行令、適用日 2026-11-01）から 4 条文（43の13 / 44の3 / 52の10の2 / 56の89の6）を独立抽出し、3 モジュールの率・算術・自然数定式・NOT MODELLED 判定を照合した。**モデル値の食い違いは 0 件（ゼロ）**。
- **最重要 3 点の独立判定**: ① 〇・七五 = 3/40（4 ヶ月で 0.7）は原文に忠実で**正しい**（委譲要約の 1/10 が誤り）／② 百分の〇・三 = 30/10000 = 0.3% は原文に忠実で**正しい**（10 倍過大バグなし）／③ ÷12×12（百円未満切り捨て）は原文に忠実で**正しい**（委譲要約の「残りの納期の数」が誤り）。いずれも CONFIRMED ではない。
- **CONFIRMED: 0 件（発見ゼロ）** / **BY-DESIGN: 8 件** / **UNRESOLVED: 2 件**。
- **needle 健全性**: U+3000 **0 件**、CI 実装の **12/12 FOUND**（MISS 0、すべて count 1）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 8 件（許容）。全 73 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **反例探索**: 月数 0/1/4/5（キャップ）、数量 0、税額 0、端数、除数 0 を含む全攻撃点で矛盾 **0 件**。
- **Lean モジュール変更: なし**（3 対象モジュール＋各 Spec/Tests は読み取り専用）。書き換えたのは本ファイルのみで、既存のバッチ G/H/I/J レビューは保持した。commit / push / merge / ブランチ切替は行っていない。
- 残る UNRESOLVED（U-K1 端数処理の法的正当性、U-K2 44の3 第2項の NOT MODELLED の法的十分性）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・有理数での率照合・integer 式の反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch L review (2026-11-18)

### L-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当 W-AH / W-AI / W-AJ から独立）。担当者の STAGING（STAGING_WAH / WAI / WAJ）は参照したが、率・上限・原文文字列は **pinned JSON から Python で直接再抽出** して照合し、STAGING の数値・needle 記載は信じていない。
- **対象モジュール（読み取り専用・本レビューで変更していない）**:
  - `JapanTaxLaw/LocalTaxOrderRate99A.lean`（+ `-Spec.lean` / `-Tests.lean`）— 地方税法施行令 art. 9の14 / 9の18、W-AH
  - `JapanTaxLaw/LocalTaxOrderRate77.lean`（+ `-Spec.lean` / `-Tests.lean`）— 同 art. 9の22 / 35の4の5、W-AI
  - `JapanTaxLaw/SpecialOrderCapitalGainDeduction.lean`（+ `-Spec.lean` / `-Tests.lean`）— 租税特別措置法施行令 art. 24、W-AJ
- **一次資料（pinned・改変禁止）**:
  - `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`（地方税法施行令、7,509,563 bytes）
  - `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`（租税特別措置法施行令、13,874,873 bytes）
  - Python で直接確認: 前者は `law_id=325CO0000000245` / `revision=325CO0000000245_20261101_508CO0000000083` / `law_title=地方税法施行令` / `amendment_enforcement_date=2026-11-01` / `current_revision_status=CurrentEnforced` / `amendment_law_id=508CO0000000083`。後者は `law_id=332CO0000000043` / `revision=332CO0000000043_20261101_507CO0000000127` / `law_title=租税特別措置法施行令` / 同 enforcement date / `CurrentEnforced` / `amendment_law_id=507CO0000000127`。
- **抽出方法**: `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化（地方令 1,220,459 文字／正規化後 1,219,606 文字、租特令 2,744,019 文字／正規化後 2,743,179 文字）。`MainProvision` 配下の `Article` を走査し、`ArticleTitle` が `第九条の十四` / `第九条の十八` / `第九条の二十二` / `第三十五条の四の五` / `第二十四条` の本文を逐語取得（各 1 件）。率は `fractions.Fraction` で有理数比較した。
- **書き換えたファイルは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。Lean モジュール・Spec・Tests は読み取り専用。commit / push / merge / ブランチ切替は行っていない。

### L-1. 独立抽出結果（条号 → 率／上限 → 原文文字列）

原文文字列は pinned JSON の `Article` 本文を平坦化したもの（いずれも全角空白 U+3000 は 0 個）。

| 条号 | 抽出した原文部分文字列 | 独立抽出した率／上限 | Lean 定数／式 | 照合 |
|---|---|---|---|---|
| 地方令 9の14（法71の25(1)） | `…政令で定める率は、百分の九十九とする。` | 百分の九十九 = 99/100 = 0.99 | `art14Rate = ⟨99,100⟩` / `art14Tax b = b*99/100` | ✅ |
| 地方令 9の18（法71の47(1)） | `…政令で定める率は、百分の九十九とする。` | 百分の九十九 = 99/100 = 0.99 | `art18Rate = ⟨99,100⟩` / `art18Tax b = b*99/100` | ✅ |
| 地方令 9の22（法71の67(1)） | `…政令で定める率は、百分の九十九とする。` | 百分の九十九 = 99/100 = 0.99 | `art9_22Rate = ⟨99,100⟩` / `art9_22Tax b = b*99/100` | ✅ |
| 地方令 35の4の5（法72の76） | `…政令で定める率は、百分の七・七とする。` | 百分の七・七 = 7.7/100 = **77/1000 = 0.077**（10 倍過大の 770/1000 = 0.77 ではない） | `art35_4_5Rate = ⟨77,1000⟩` / `art35_4_5Tax b = b*77/1000` | ✅ |
| 租特令 24（譲渡所得の特別控除額の特例） | `…五千万円の範囲内において、まず…五千万円に満たない場合には、五千万円又は当該満たない部分の金額の範囲内において、順次…` | 上限 = 五千万円 = 50,000,000（`五千万円` 3 回）。満たない部分 = cap − withinCap。優先順位 7 条文 | `capitalGainSpecialDeductionCap = 50_000_000` / `withinCap = min amount cap` / `shortfall = cap − withinCap` / `deductionPriorityOrder = [0..6]` / `specialDeductionTotal = min(sum, cap)` | ✅ |

**全文逐語（5 条文・独立抽出）**:

- **地方令 9の14**（56 文字）: `（法第七十一条の二十五第一項の率）第九条の十四法第七十一条の二十五第一項の政令で定める率は、百分の九十九とする。`
- **地方令 9の18**（56 文字）: `（法第七十一条の四十七第一項の率）第九条の十八法第七十一条の四十七第一項の政令で定める率は、百分の九十九とする。`
- **地方令 9の22**（57 文字）: `（法第七十一条の六十七第一項の率）第九条の二十二法第七十一条の六十七第一項の政令で定める率は、百分の九十九とする。`
- **地方令 35の4の5**（53 文字）: `（法第七十二条の七十六の率）第三十五条の四の五法第七十二条の七十六の政令で定める率は、百分の七・七とする。`
- **租特令 24**（267 文字）: `（譲渡所得の特別控除額の特例）第二十四条法第三十六条に規定する政令で定めるところにより計算した金額は、五千万円の範囲内において、まず法第三十三条の四第一項の規定により控除すべき金額から成るものとし、同項の規定の適用がない場合又は同項の規定により控除すべき金額が五千万円に満たない場合には、五千万円又は当該満たない部分の金額の範囲内において、順次法第三十五条第一項、第三十四条第一項、第三十四条の二第一項、第三十五条の二第一項、第三十四条の三第一項及び第三十五条の三第一項の規定により控除すべき金額から成るものとして計算した金額とする。`

### L-2. 最重要 3 点の独立判定

| # | 争点 | 委譲元要約 | pinned 原文（独立抽出） | ワーカーの採用 | 独立判定 |
|---|---|---|---|---|---|
| 1 | 「百分の七・七」の符号化 | 7.7% = 77/1000（10 倍過大 770/1000 でない） | `第三十五条の四の五…政令で定める率は、百分の七・七とする。` | impl `⟨77,1000⟩` / Spec `specArt35Rate=(77,1000)` かつ `specPercent77Tenths=7*10+7=77` / Tests `art35_4_5Tax 1000 = 77` かつ `≠ 770` | **原文に忠実（正しい）。三層すべてで base=1000→77 を確認。10 倍過大バグなし。CONFIRMED ではない（BY-DESIGN）。** |
| 2 | 「百分の九十九」 | 99/100 | 9の14 / 9の18 / 9の22 のいずれも `…政令で定める率は、百分の九十九とする。` | 3 条例とも `⟨99,100⟩`（den=100、小数点拡大なし） | **原文どおり 99/100。CONFIRMED ではない（BY-DESIGN）。** |
| 3 | art. 24 の 5000 万円上限 | 上限キャップ（min）と優先順位リストをモデル化、各控除額算定は NOT MODELLED | `…五千万円の範囲内において、まず…満たない場合には、五千万円又は当該満たない部分の金額の範囲内において、順次法第三十五条第一項、第三十四条第一項、第三十四条の二第一項、第三十五条の二第一項、第三十四条の三第一項及び第三十五条の三第一項の…` | cap=50_000_000、`withinCap=min`、`shortfall=cap−withinCap`、`deductionPriorityOrder=[0..6]`、`specialDeductionTotal=min(sum,cap)`、各控除額算定は NOT MODELLED | **判断は妥当（上限・満たない部分・7 条文の優先順位はいずれも原文に忠実）。NOT MODELLED も原文に算定式がなく透明に申告されている。CONFIRMED ではない（BY-DESIGN）。法的十分性は U-L2 で保留。** |

補足（判定の理由）:

- **7.7% = 77/1000 の導出**: 十進「七・七」= 7 + 7/10 = 77/10。「百分の七・七」= (77/10)/100 = 77/1000 = 0.077。`Fraction` で `77/1000 == (77/10)/100` を確認し、かつ `77/1000 != 770/1000`（= 0.77 = 77%）を確認。もし 770/1000 を採れば base=1000 で 770 となり原文の「七・七」（7.7%）と矛盾する。impl の `⟨77,1000⟩`、Spec の `specPercent77Tenths = 7*10+7 = 77`（独立定式）、Tests の `1000 → 77`（`≠ 770`）が三層で一致。
- **99/100**: 「百分の九十九」は整数百分率で小数点を含まない。したがって分母 100 のままで正しく、分母 10000 による拡大は不要（小数点率「〇・七五」を扱う他モジュールとは異なる）。
- **art. 24 の上限と優先順位**: 原文の `五千万円` は 3 回出現（冒頭の「五千万円の範囲内」、満たない場合の「五千万円又は…」、優先順位適用時の範囲）。`min(amount, cap)` は「範囲内」を、`cap − min(used, cap)` は「満たない部分の金額」をそれぞれ直接表現。`deductionPriorityOrder = [0,1,2,3,4,5,6]` の対応（0=法33条の4(1) / 1=法35(1) / 2=法34(1) / 3=法34条の2(1) / 4=法35条の2(1) / 5=法34条の3(1) / 6=法35条の3(1)）は原文の「まず 法33条の4(1) → 順次 法35(1)、法34(1)、法34条の2(1)、法35条の2(1)、法34条の3(1)、法35条の3(1)」と 1 対 1 で一致（独立 regex 抽出で確認）。各額は非負 (Nat) なので「順次キャップ」と「合計してからキャップ」は最終合計について同値であり、`min(sum, cap)` は合計額の算定として健全——ただし優先順位による「どの控除が上限を享受するか」の配分は NOT MODELLED（U-L2）。

→ **3 点すべてでワーカーの判断は pinned 原文に忠実であり、モデル値の誤りは発見されなかった。**

### L-3. needle 健全性（CI 実装を直接検証）

`scripts/ci/transcription_audit.py` の 3 件の check（地方令 2 件＋租特令 1 件、計 9 needle）に組み込まれた needle を抽出し、pinned 正規化テキストに対して検証した（STAGING の needle 記載ではなく CI が使う文字列を検査）。

| 項目 | 結果 |
|---|---|
| 対象 check 数 | **3**（99A / 77 / 24） |
| needle 総数 | **9**（99A: 2 / 77: 2 / 24: 5） |
| U+3000（全角空白）を含む needle | **0 件** |
| 長さ範囲 | 53〜99 文字 |
| pinned 正規化テキストに対する `.find()` | **9/9 FOUND、MISS 0** |
| `.count()` | 全 needle で **1**（一意） |

- needle offsets（正規化）: 99A = 112125 / 115314、77 = 118933 / 180552、24 = 284169 / 284220 / 284268 / 284313 / 284351。
- 実 CI ゲートも実行: `python -m scripts.ci.transcription_audit` は **exit code 0**、transcription audit **108/108 checks passed**（3 件の batch L check はいずれも PASS）。
- 24 の 5 本目の needle（優先順位リスト末尾）は NOT MODELLED 判定の根拠として原文保持されており、needle 自体は FOUND（モデル化漏れではない）。

**needle 健全性: 問題なし（9/9 FOUND、U+3000 0 件、MISS 0、count 1）。**

### L-4. 条件漏れ・端数・NOT MODELLED の反映

| チェック項目 | pinned 原文での確認 | モデル側の扱い | 判定 |
|---|---|---|---|
| 「百分の七・七」の 10 倍過大防止 | 原文は「百分の七・七」= 7.7%。770/1000（77%）ではない | `⟨77,1000⟩` + base=1000→77 のガードを impl/Spec/Tests の三層に配置 | **BY-DESIGN（原文忠実）**。 |
| art. 24 の上限キャップ | 「五千万円の範囲内」「五千万円に満たない場合には、五千万円又は当該満たない部分の金額の範囲内において」 | `withinCap = min`、`shortfall = cap − withinCap` | **BY-DESIGN（原文忠実）**。 |
| art. 24 の優先順位リスト | 「まず 法33条の4(1) → 順次 法35(1)、法34(1)、法34条の2(1)、法35条の2(1)、法34条の3(1)、法35条の3(1)」 | `deductionPriorityOrder = [0..6]` として 7 条文を保持（計算には使わない） | **BY-DESIGN（原文忠実）**。配分ロジック自体は NOT MODELLED（U-L2）。 |
| art. 24 の各控除額算定・該当性・「政令で定めるところにより計算した金額」 | 原文は他条文を参照するだけで art. 24 自体に各額の算定式なし | 各額を caller-established の `Money`（Nat）として受け取り NOT MODELLED、Bool を式に入れない | **BY-DESIGN**（透明な bounded slice）。法的十分性は U-L2 で保留。 |
| 端数処理（税率適用後） | 3 モジュールとも原文に丸め細目の明記なし | `TaxRate.applyFloor`（切り捨て）に委ねる | **BY-DESIGN**（モデル選択として明示）。法的正当性は U-L1 で保留。 |
| 該当性・課税標準の caller-established 化 | — | Bool を算術式に入れず、認定はモジュール外 | **BY-DESIGN**。 |

### L-5. CONFIRMED / BY-DESIGN / UNRESOLVED の件数

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **8** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = ゼロ）を明示する。** モデル化された率・上限・定数・needle・公理のいずれにも原文との食い違いは検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 率: 9の14 / 9の18 / 9の22 の 99/100、35の4の5 の 77/1000、24 の 50,000,000 上限、すべて原文と一致。
- 算術: `b*99/100`、`b*77/1000`、`min(sum, cap)`、`cap − min(used, cap)` は原文の定式と一致（L-2、L-6 参照）。
- needle: 9/9 FOUND、U+3000 0 件、MISS 0（L-3）。CI ゲート 108/108 PASS。
- 公理: 禁止公理 0 件（L-7）。

#### BY-DESIGN（8 件）

- **B-L1** 9の14 の「百分の九十九」を `⟨99,100⟩`（den=100、小数点拡大なし）とした判断は原文に忠実。
- **B-L2** 9の18 の「百分の九十九」を `⟨99,100⟩` とした判断も原文に忠実。
- **B-L3** 35の4の5 の「百分の七・七」を 77/1000 とし、10 倍過大（770/1000）を impl/Spec/Tests の三層で明示的に否定した判断は原文に忠実。Spec の `specPercent77Tenths = 7*10+7` という独立定式も妥当。
- **B-L4** 各税率の適用を `TaxRate.applyFloor`（切り捨て）に委ね、課税標準・該当性を caller-established とした設計（法的正当性は U-L1 で保留）。
- **B-L5** art. 24 の上限を `min(amount, 50_000_000)`、満たない部分を `cap − min(used, cap)` とした判断は原文「五千万円の範囲内」「満たない部分の金額」に忠実。
- **B-L6** art. 24 の優先順位を `[0..6]` の 7 条文リストとして保持した判断は原文の「まず…順次…」と 1 対 1 で一致。
- **B-L7** art. 24 の各控除額算定・適用判定を NOT MODELLED とし、合計額のみを `min(sum, cap)` でモデル化した判断（透明な bounded slice、法的十分性は U-L2 で保留）。
- **B-L8** 各 Spec を独立定式（乗法順序の入れ替え、減算のみの `x-(x-cap)`、再帰合計）とし、`agree*`（有限サンプル上の `==`）で impl ≡ spec を spot-check に留めた設計。全称等価証明ではないことを明示している。

#### UNRESOLVED（2 件）

- **U-L1 端数処理（floor）の法的正当性**: 3 モジュールの税率適用は原文に端数規定を持たず、モデルは `TaxRate.applyFloor`（Nat の切り捨て）を採用。pinned 原文のみではこの切り捨てが法的に正しいか決定不能。**人間の法律専門家による確認を要する**（バッチ G/H/I/J/K の U-1 と同趣旨）。
- **U-L2 art. 24 の NOT MODELLED が法的に十分か**: 「政令で定めるところにより計算した金額」、各参照条文（法33条の4 / 35 / 34 / 34条の2 / 35条の2 / 34条の3 / 35条の3）の控除額算定・適用要件、および「まず／順次」の配分ロジックは、上限キャップと優先順位リスト以外がすべて NOT MODELLED。透明に申告されているが、この扱いで足りるかは pinned 原文のみでは解けず、**専門家判断を要する**。特に「各控除額が残り余裕に依存するか」という法的問いに依存するため、`min(sum, cap)` が原文の順次填埋と常に同値かはモデル内では証明できない（合計額の一致には影響しない）。

### L-6. 反例探索（独立再計算）

Python で Lean と同一の整数式を再計算し、指定された攻撃点を走査した。下表の値はすべて Lean の `by decide` smoke と一致（矛盾 0 件）。

| 攻撃対象 | 独立再計算 | Lean smoke | 結果 |
|---|---|---|---|
| 99% base 0 / 1 | 0 / 0 | `art14Tax 0 = 0` / `art14Tax 1 = 0` | 矛盾なし |
| 99% base 100 / 101 | 99 / 99（`101*99//100=99`） | `art14Tax 100 = 99` / `art14Tax 101 = 99` | 矛盾なし |
| 99% base 1000 | 990 | `art14Rate.applyFloor 1000 = 990` | 矛盾なし |
| 7.7% base 0 / 1 / 12 | 0 / 0 / 0 | 同じ | 矛盾なし |
| 7.7% base 13（切上がり境界） | 1（`13*77//1000=1.001`） | `art35_4_5Tax 13 = 1` | 矛盾なし |
| **7.7% base 1000（10 倍ガード）** | **77**（10 倍なら 770） | `art35_4_5Tax 1000 = 77`、`≠ 770`、`numDen ≠ (770,1000)` | 矛盾なし（10 倍過大バグ不在を独立確認） |
| 7.7% base 999 / 2000 / 10000 | 76 / 154 / 770 | 同じ | 矛盾なし |
| 上限 x=0 / 1 | withinCap 0 / 1、shortfall 50,000,000 / 49,999,999 | `withinCap 0=0` / `withinCap 1=1` | 矛盾なし |
| 上限 x=49,999,999 / 50,000,000 / 50,000,001 | withinCap 49,999,999 / 50,000,000 / 50,000,000（shortfall 1 / 0 / 0） | 同じ | 矛盾なし（境界を独立確認） |
| 合計 [30,000,000, 19,999,999] | 49,999,999 | `specialDeductionTotal [...] = 49,999,999` | 矛盾なし |
| 合計 [30,000,000, 20,000,000] / [30,000,000, 20,000,001] | 50,000,000 / 50,000,000 | 同じ | 矛盾なし |
| 合計 [50,000,000, 1] / [50,000,001, 1, 2, 3] | 50,000,000 / 50,000,000 | 同じ | 矛盾なし |
| Spec の `x-(x-cap)`（Nat saturating sub） | min(x,cap) と全点一致 | `agreeWithinCapPoints = true` | 矛盾なし |

**反例探索で検出された原文↔Lean の矛盾: 0 件（ゼロ）。**

（監査上の注記: 独立スクリプトの初回実行で `x-(x-cap)` の検証が Python の負数演算により一度 FAIL したが、これは **レビュア側ハーネスのバグ**（Python int は Nat の saturating 減算を模していない）であり、Nat 減算に修正後は全点一致。Lean モジュールの欠陥ではない。）

### L-7. 公理監査

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\BatchLAxiomProbe.lean` を作成し、9 モジュール（impl 3 + Spec 3 + Tests 3）の **名前付き宣言 68 件**（99A: 13 / 77: 12 / 24: 20 / 各 Spec: 6・9・8 / Tests: 名前付き宣言なし＝全て匿名 `example`）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**、error 0）。監査後、一時ファイル・一時スクリプトは **削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **68** |
| `does not depend on any axioms` | **57** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **11 件**: `art14Tax_le` / `art18Tax_le`（2）、`art9_22Tax_mono` / `art35_4_5Tax_mono`（2）、`withinCap_le_cap` / `withinCap_le_self` / `withinCap_eq_cap_of_ge` / `shortfall_add_withinCap` / `specialDeductionTotal_le_cap` / `specialDeductionTotal_le_sum` / `specialDeductionTotal_cap_of_first_ge`（7）。いずれも `simp` / `Nat.min` 由来の許容範囲。 |

- 補足: Tests 3 モジュールの匿名 `example`（計 66 件、すべて `by decide`）は名前を付けられないため `#print axioms` の対象外だが、doc-comment を除いたコード部を走査して `sorry` / `admit` / `Classical.choice` / `Quot.sound` / `axiom` の **実使用 0** を確認。`by decide` は計算のみで公理を導入しない。

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### L-8. 総合判定・最終報告

- pinned revision 2 件（地方税法施行令 `325CO0000000245_20261101_508CO0000000083`、租税特別措置法施行令 `332CO0000000043_20261101_507CO0000000127`、いずれも適用日 2026-11-01）から 5 条文（9の14 / 9の18 / 9の22 / 35の4の5 / 24）を独立抽出し、3 モジュールの率・上限・整数定式・NOT MODELLED 判定を照合した。**モデル値の食い違いは 0 件（ゼロ）**。
- **最重要 3 点の独立判定**: ① 「百分の七・七」= 77/1000（7.7%）は原文に忠実で **正しい**。三層すべてで base=1000→77 を確認し、10 倍過大（770）バグは不在／② 「百分の九十九」= 99/100 は原文どおり **正しい**／③ art. 24 の 50,000,000 上限・`min` キャップ・7 条文の優先順位リスト・各控除額算定の NOT MODELLED は **妥当**（法的十分性は U-L2 で保留）。いずれも CONFIRMED ではない。
- **CONFIRMED: 0 件（発見ゼロ）** / **BY-DESIGN: 8 件** / **UNRESOLVED: 2 件**。
- **needle 健全性**: U+3000 **0 件**、CI 実装の **9/9 FOUND**（MISS 0、すべて count 1）。CI ゲート 108/108 PASS（exit 0）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 11 件（許容）。全 68 名前付き宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **反例探索**: base 0/1/100/1000/端数、上限 49,999,999 / 50,000,000 / 50,000,001、順次合計の境界を含む全攻撃点で矛盾 **0 件**。
- **Lean モジュール変更: なし**（3 対象モジュール＋各 Spec/Tests は読み取り専用）。書き換えたのは本ファイルのみで、既存のバッチ G/H/I/J/K レビューは保持した。commit / push / merge / ブランチ切替は行っていない。
- 残る UNRESOLVED（U-L1 端数処理の法的正当性、U-L2 art. 24 の NOT MODELLED の法的十分性）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・`Fraction` での率照合・integer 式の反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Batch M review (2026-11-18)

### M-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当 W-AK / W-AL / W-AM から独立）。担当者 STAGING（`STAGING_WAK.md` / `STAGING_WAL.md` / `STAGING_WAM.md`）の数値・needle 記載は参照したが、**その正否は信じず**、pinned JSON から Python で直接再抽出して照合した。
- **対象モジュール（読み取り専用・本レビューで一切変更していない）**:
  - `JapanTaxLaw/LocalTaxMedicalIncomeRatio.lean` — 地方税法施行令 art. 21の8、W-AK
  - `JapanTaxLaw/LocalTaxOfficeApportionment.lean` — 同 art. 56の五十、W-AL
  - `JapanTaxLaw/SpecialOrderPensionMinimum.lean` — 租税特別措置法施行令 art. 26の27、W-AM
  - 各 `-Spec.lean` / `-Tests.lean` も読み取りのみ。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`（地方税法施行令、7,509,563 bytes、適用日 2026-11-01）
  - `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`（租税特別措置法施行令、13,874,873 bytes、適用日 2026-11-01）
- **抽出方法**: `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化（地方令 正規化後 1,219,606 文字、租特令 正規化後 2,743,179 文字）。`MainProvision` 配下の `Article` を走査し、`ArticleTitle` が `第二十一条の八` / `第五十六条の五十` / `第五十六条の八十` / `第二十六条の二十七` の本文を逐語取得（各タイトル **1 件ずつ**、一意）。日本語金額は repo の `scripts/law_audit/kansuji.py`（`kanji_to_int`）で Arabic 変換した。率は `fractions.Fraction` で比較した。
- **書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。Lean モジュール・Spec・Tests・`data/*` は読み取り専用（レビュー前後で `git status --short` はクリーン）。commit / push / merge / ブランチ切替は行っていない。

### M-1. 最重要 3 点の独立判定

| # | 争点 | 委譲元／Coordinator の記述 | pinned 原文（独立抽出） | ワーカーの採用 | 独立判定 |
|---|---|---|---|---|---|
| 1 | W-AL のファイル割当誤りの訂正 | Coordinator プロンプトは「**M2 = 56条の五十**」と誤記 | `第五十六条の五十`（正規化 336 文字）は「…当該従業者給与総額に当該指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合を乗じて得た額とする。」＝**床面積按分算術が実在**。一方 `第五十六条の八十`（437 文字）は「法第七百一条の六十一第八項の**申告書の提出期限**…」で、`事業所床面積` 0 回／`割合を乗じて得た額` 0 回 | W-AL は `local_order_M3.txt`（56条の五十・336 文字）を正規原文として採用 | **ワーカーの訂正は正しい（BY-DESIGN）。** Coordinator の誤記が原因で、形式化モジュールの欠陥ではない。**CONFIRMED ではない。** |
| 2 | art. 21の8 の 3/10 判定 | 医療収入割合 ≤ 3/10 を `medicalIncome*10 ≤ 3*totalIncome` で判定 | 「…医療に関する収入金額中に占める割合が**おおむね常時十分の三以下**であるものとして道府県知事が認めた医療施設…」（`十分の三以下` 1 回／`おおむね常時` 1 回／`道府県知事が認めた` 1 回） | `decide (medicalIncome * 10 ≤ 3 * totalIncome)`（交差掛け）。「おおむね常時」「知事認定」は caller-established Bool として `&&` 結合、金額式外 | **原文「十分の三以下」= ≤ 3/10 に忠実。** 交差掛けは total>0 で同値、total=0 も停止。境界 3/10 は true。Bool は算術を汚していない。**CONFIRMED ではない（BY-DESIGN）。** 「おおむね」の程度は U-M1 で保留。 |
| 3 | art. 26の27 の最低控除額 3 定数 | 118万／168万／90万円 | 「百十八万円」「百六十八万円」「九十万円」が各 1 回（他に `六十五歳` 2 回、`十二月三十一日` 1 回） | `baseMinimumDeduction=1_180_000` / `specialMinimumDeduction=1_680_000` / `adjustedPensionMinimumDeduction=900_000`、`minimumDeduction` は `if` による**定数選択のみ** | **3 定数すべて原文どおり（kansuji 変換で独立確認、multiset 一致）。** Bool は金額算術に入らず定数選択にのみ現れる。**CONFIRMED ではない（BY-DESIGN）。** |

補足（判定の理由）:

- **56条の五十 vs 56条の八十**: pinned JSON の両条文を個別抽出し、キーワード出現を比較した（M-2 表参照）。「第五十六条の五十」に床面積按分の算術が存在すること、「第五十六条の八十」にそれが存在しないことは mechanical に確定した。W-AL の STAGING §0 の申告（`local_order_M2.txt` は 56条の八十／437 文字、`local_order_M3.txt` は 56条の五十／336 文字）は、pinned JSON の独立抽出と整合していた。Coordinator プロンプト側のラベル誤記をワーカーが正しく是正しており、非難すべき実装ミスはない。
- **3/10 の交差掛け**: `10·medicalIncome ≤ 3·totalIncome` は `totalIncome > 0` のとき `medicalIncome/totalIncome ≤ 3/10` と同値（`Fraction(3,10)` で確認）。除算を避けるため `totalIncome = 0` でも停止し、`0 ≤ 0 → true`。原文の「おおむね常時」は程度を定める法的判断であり金額算術ではないため、caller-established Bool（`generallyConstant` / `governorRecognized`）として式外で `&&` 結合する設計は妥当（厳密な境界と「おおむね」の扱いは U-M1）。
- **3 定数の選択**: `minimumDeduction` の本体は `if isAge65OrOlder then (if isAdjustedPension then adjustedPensionMinimumDeduction else specialMinimumDeduction) else baseMinimumDeduction` で、3 つの `Money` 定数を選ぶだけ（乗除・加減なし）。第2項の基準日「その年十二月三十一日」は doc-comment に記録するのみで計算に用いない旨も明記され、原文と整合する。

→ **3 点すべてでワーカーの判断は pinned 原文に忠実であり、モデル値・定数・算術の誤りは発見されなかった。**

### M-2. 独立抽出結果（条号 → 原文 → 算術／定数 → Lean）

| 条号 | 原文（正規化・抜粋／文字数） | 独立抽出した算術／定数 | Lean 定数／式 | 照合 |
|---|---|---|---|---|
| 地方令 21の8 | 「…同項に規定する金額の当該医療施設に係る医療に関する収入金額中に占める割合がおおむね常時十分の三以下であるものとして道府県知事が認めた医療施設…」（182 文字） | 十分の三 = **3/10**、`おおむね常時`・`知事認定` は法的 Bool | `medicalIncomeRatioWithin3Tenths = decide (medicalIncome*10 ≤ 3*totalIncome)`、`medicalFacilityApplicationExcluded = 割合Bool && generallyConstant && governorRecognized` | ✅ |
| 地方令 56の五十 | 「…当該事業所等に係る従業者給与総額は、当該従業者給与総額に当該指定都市等所在部分の事業所床面積の当該事業所等に係る事業所床面積に対する割合を乗じて得た額とする。」（336 文字） | 割合 = 指定都市等所在部分床面積／全事業所床面積、給与総額 × 割合（端数規定なし） | `apportion base numerator denominator = base*numerator/denominator`、`apportionedEmployeeSalary totalSalary designatedCityArea totalArea = apportion totalSalary designatedCityArea totalArea`（分子=部分面積、分母=全面積） | ✅ |
| 地方令 56の八十（比較対照） | 「（法第七百一条の六十一第八項の申告書の提出期限までに提出する意思があつたと認められる場合）第五十六条の八十…」（437 文字） | 床面積按分なし（申告書提出期限の認定要件） | 対応 def なし（スコープ外） | ✅（BY-DESIGN） |
| 租特令 26の27 | 「…同条中「百十八万円」とあるのは、「百六十八万円（…掲げるものである場合にあつては、九十万円）」とする。２前項の居住者の年齢が六十五歳以上であるかどうかの判定は、その年十二月三十一日の年齢によるものとする。」（264 文字） | 百十八万円 = 118×10,000 = **1,180,000**／百六十八万円 = 168×10,000 = **1,680,000**／九十万円 = 90×10,000 = **900,000**、数的関係 900,000 < 1,180,000 < 1,680,000 | 3 `Money` 定数＋`minimumDeduction` の 4 通り選択、すべて `by decide` | ✅ |

- 56条の五十のキーワード出現（独立カウント）: `第五十六条の五十` = 1、`事業所床面積` = 5、`指定都市等所在部分` = 2、`従業者給与総額` = 2、`に対する割合を乗じて得た額とする` = 1。56条の八十では `事業所床面積` = 0、`割合を乗じて得た額` = 0、`申告書の提出期限` = あり。
- 26条の27 の金額リテラルは `kanji_to_int` で変換し、Lean 3 定数と multiset 比較（昇順 [900000, 1180000, 1680000] 同値）を機械確認した。
- 21条の8 の `十分の三以下` / `おおむね常時` / `道府県知事が認めた` はいずれも 1 回で、needle との食い違いなし。

### M-3. needle 健全性（12 本を pinned 正規化テキストに対して直接検証）

STAGING 3 ファイルの JSON ブロックから候補 needle を **文字列としてそのまま Python で parse** し、pinned `law_full_text` の正規化テキスト（`re.sub(r"[\s\u3000]+", "", …)`、`transcription_audit.py` と同一条件）に対して `.find()` / `.count()` を実行した。STAGING の「FOUND」という申告は信じていない。

| 項目 | 結果 |
|---|---|
| needle 総数 | **12**（W-AK/M1: 4 ／ W-AL/M3: 4 ／ W-AM: 4） |
| U+3000（全角空白）を含む needle | **0 件** |
| 長さ範囲 | 60〜105 文字（すべて指定の 60〜130 の範囲内） |
| pinned 正規化テキストに対する `.find()` | **12/12 FOUND、MISS 0** |
| `.count()` | 全 needle で **1**（一意） |

- 正規化 offset: M1 = 149110 / 149173 / 149213 / 149228、M3 = 415534 / 415630 / 415724 / 415765、26の27 = 666182 / 666282 / 666322 / 666377（全部 count 1）。
- 監査上の注記（レビュア側ハーネスの自己訂正）: 最初にレビュアが STAGING の needle を手で打ち直したところ M3 の第 4 本が 95 文字になり一時的に MISS したが、STAGING の JSON ブロックを直接 parse し直すと 105 文字で FOUND（count 1）となった。これは**打ち直しによるレビュア側の転記ミス**であり、STAGING の needle・Lean モジュールの欠陥ではない（バッチ L の注記と同種）。最終結果は上表のとおり 12/12 FOUND。

### M-4. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **7** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = ゼロ）を明示する。** 原文との食い違い（誤記・桁違い・算術不一致・needle MISS・公理混入・反例矛盾）は一切検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 定数: 1,180,000 / 1,680,000 / 900,000 は「百十八万円」「百六十八万円」「九十万円」に一致（kansuji 独立変換）。
- 算術: `medicalIncome*10 ≤ 3*totalIncome`（= ≤ 3/10）、`base*numerator/denominator`（56条の五十の按分）、Bool による 3 定数選択、いずれも原文に忠実。
- 割当: 56条の五十に床面積按分が実在し、56条の八十は別条文（申告書提出期限）。ワーカーの M3 採用は正しい。
- needle: 12/12 FOUND、U+3000 0 件、MISS 0。
- 公理: 禁止公理 0 件（M-6）。

#### BY-DESIGN（7 件）

- **B-M1** W-AL のファイル割当訂正（M3 = 56条の五十を採用）は pinned 原文に照らして正しい。Coordinator プロンプトの「M2 = 56条の五十」は誤記で、実 M2 = 56条の八十。形式化実装の欠陥ではない。
- **B-M2** 21条の8 の「おおむね常時」「道府県知事が認めた」は caller-established Bool（`generallyConstant` / `governorRecognized`）として割合 Bool と `&&` 結合するのみで、金額式には入れない設計。
- **B-M3** 21条の8 の二金額（原文の「同項に規定する金額」と「医療に関する収入金額」）を引数 `medicalIncome` / `totalIncome` へ対応づけるのは caller-established と doc-comment で明記。変数名は便宜的な略称であり、計算自体は与えられた二金額への算術判定のみ。
- **B-M4** 56条の五十の端数処理は Nat 除算の切り捨て（原文に端数規定なし）をモデル規約として明示。法的正当性は U-M2 で保留。
- **B-M5** 56条の五十の面積・給与額・区域判定・該当性は caller-established、Bool を算定式に入れない。「読み替えて適用する」手続指定そのものは NOT MODELLED、`designatedCityFloorArea a = a` は定数的同一値の読み替えとして記録（算術ではない）。
- **B-M6** 26条の27 の `isAge65OrOlder` / `isAdjustedPension` は caller-established Bool で、3 つの `Money` 定数の**選択にのみ**使用（算術には不入）。基準日・年金種別・居住者性・支払の有無はモジュール外（`ConsumptionTaxRate.rateOf` 等と同型の設計）。
- **B-M7** 退化入力（`totalIncome = 0`、`totalArea = 0`、`designatedCityArea = 0`、部分面積 > 全面積）はモデル規約（`Nat.div` の `n/0 = 0`、クランプなし）として明示し、入力妥当性は caller が担保すると宣言。

#### UNRESOLVED（2 件）

- **U-M1 「おおむね常時十分の三以下」の「おおむね」の程度と厳密境界 3/10 の扱い**: 原文は「割合がおおむね常時十分の三以下であるものとして道府県知事が認めた」とし、「おおむね」の許容幅を数値化しない。本モデルは `≤ 3/10`（境界 3/10 を true）と「おおむね常時」の Bool を分離して結合するが、この形式化が原文の法的意味に十分かは pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。定数・境界値の一致（発見ゼロ）には影響しない。
- **U-M2 端数処理（floor）の法的正当性**: 56条の五十は按分の割合を示し端数規定を持たない。モデルは `base*numerator/denominator` の Nat 切り捨てを採用（21条の8 は除算なしのため該当しない）。pinned 原文のみではこの切り捨てが法的に正しいか決定不能。**人間の法律専門家による確認を要する**（バッチ G/H/I/J/K/L の U-1 と同趣旨）。

### M-5. 反例探索（独立再計算＋kernel-decide）

pinned 原文から導いた整数式を Python で再計算し、さらに一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchM_counterexamples.lean` に追加の境界 `example := by decide` を書いて `lake env lean`（exit code **0**、error 0）で走査した。下表はすべて Lean の `by decide` と一致（矛盾 0 件）。

| 攻撃対象 | 独立再計算／Lean 結果 | 結果 |
|---|---|---|
| 医療収入 0 ／ total 0 | `0*10 ≤ 3*0` → true（`0/0` も停止）／`1*10 ≤ 3*0` → false | 矛盾なし |
| 医療収入 0 ／ total 100 | `0 ≤ 300` → true | 矛盾なし |
| 境界 3/10 | `3/10` → true、`4/10` → false、`30/100` → true、`31/100` → false、`300000/1000000` → true、`300001/1000000` → false、`2/7` → true | 矛盾なし（超えで即 false） |
| 適用除外 Bool 8 通り | 割合 true かつ `generallyConstant=true` かつ `governorRecognized=true` のときのみ true（他は false）。`4/10` は Bool が全部 true でも false | 矛盾なし（Bool は算術外） |
| 床面積 0（分子／分母） | `apportion 10 0 3 = 0`、`apportionedEmployeeSalary 10_000_000 0 10_000 = 0`、分母 0 も `0`（`5 3 0 = 0`） | 矛盾なし |
| 按分境界（1:1／端数／按分） | `apportion 100 100 100 = 100`、`apportion 10 7 3 = 23`、`10_000_000*1/3 = 3_333_333`、`10_000_000*3000/10000 = 3_000_000` | 矛盾なし（Nat floor で Original の割合と整合） |
| 部分面積 > 全面積 | `apportionedEmployeeSalary 100 200 100 = 200`（クランプなし、妥当性は caller-established） | 矛盾なし（B-M7） |
| 年金区分 4 通り | (F,F)→1,180,000 ／ (F,T)→1,180,000 ／ (T,F)→1,680,000 ／ (T,T)→900,000。数的関係 900,000 < 1,180,000 < 1,680,000 | 矛盾なし（原文の読み替え順と一致） |

**反例探索で検出された原文↔Lean の矛盾: 0 件（ゼロ）。**

### M-6. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchM_axiom_probe.lean` を作成し、3 モジュールの名前付き `def` / `theorem` 計 **38 宣言**（21の8: 6 ／ 56の五十: 14 ／ 26の27: 18）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。監査後、一時ファイル・一時スクリプトは削除済み。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **38** |
| `does not depend on any axioms` | **28** |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **10 件**: `medicalIncomeRatioWithin3Tenths_true_iff` / `medicalFacilityApplicationExcluded_true_iff`（2）、`apportion_zero_denominator` / `_zero_numerator` / `_one_to_one`、`apportionedEmployeeSalary_zero_totalArea` / `_zero_designatedCityArea` / `_full` / `_mono`（7）、`minimumDeduction_is_one_of`（1）。いずれも `simp` / Nat 補題由来の許容範囲。 |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### M-7. 総合判定・最終報告（サマリ）

- **CONFIRMED: 0 件（ゼロ）** / **BY-DESIGN: 7 件** / **UNRESOLVED: 2 件**。発見ゼロを明示する。
- **最重要 3 点の独立判定**: ① W-AL のファイル割当訂正（M3 = 56条の五十）は **正しい** — pinned で 56条の五十に床面積按分算術が実在し、56条の八十は申告書提出期限の別条文（Coordinator 側の誤記を是正したもので CONFIRMED ではない）／② 21条の8 の `medicalIncome*10 ≤ 3*totalIncome` は原文「十分の三以下」に **忠実**（境界 3/10 true、Bool は算術外）／③ 26条の27 の 1,180,000 / 1,680,000 / 900,000 は原文どおりで、Bool は定数選択のみに使用し金額算術を汚して **いない**。
- **needle 健全性**: U+3000 **0 件**、pinned 正規化テキストに **12/12 FOUND**（MISS 0、すべて count 1）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 10 件（許容）。38 宣言すべてを走査、exit code 0。監査用一時ファイルは削除済み。
- **反例探索**: 医療収入 0／total 0／境界 3/10、床面積 0／按分境界、年金区分 4 通りを含む全攻撃点で矛盾 **0 件**。
- **Lean モジュール変更: なし**（3 対象モジュール＋各 Spec/Tests は読み取り専用）。書き換えたのは本ファイルのみで、既存のバッチ G/H/I/J/K/L レビューは保持した。commit / push / merge / ブランチ切替は行っていない。
- 残る UNRESOLVED（U-M1「おおむね」の程度と境界 3/10 の扱い、U-M2 端数処理の法的正当性）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・kansuji 変換による定数照合・整数式の反例走査・needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Art.25 annuity review (2026-11-18)

### A-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当 Coordinator から独立）。Coordinator の STAGING／doc-comment の記述は参照したが、**その正否は信じず**、pinned JSON から Python で直接再抽出して照合した。
- **対象モジュール（読み取り専用・本レビューで一切変更していない）**:
  - `JapanTaxLaw/InheritanceAnnuityValuation.lean` — 相続税法 art. 25（定期金給付契約の権利の評価）、L4 モデル
  - `JapanTaxLaw/InheritanceAnnuityValuationSpec.lean` — 独立定式 `specAnnuityRightValue` / `agreeInheritanceAnnuityValuation`
  - `JapanTaxLaw/InheritanceAnnuityValuationTests.lean` — 回帰 smoke checks
- **一次資料（pinned・改変禁止）**: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`（856,326 bytes、law_id `325AC0000000073`、revision `325AC0000000073_20260401_506AC0000000008`、適用日 2026-04-01）。Python で直接読み取り、`law_id` / `law_revision_id` / enforcement date 的一致を確認（A-1）。
- **抽出方法**: `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化（正規化後 154,766 文字）。`MainProvision` 配下の `Article`（`attr.Num = 25`）を直接走査し、art. 25 本文を逐語取得。needle は **CI 実装 `scripts/ci/transcription_audit.py` の `checks()` を Python で import して文字列を取得**（手打ちしない）。率は有理数として、反例は Nat 整数式として独立再計算した。
- **ツール**: `lake build`（3 モジュール、exit 0）＋ `lake env lean`（`#print axioms`・`example := by decide`、exit 0）。
- **書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。Lean モジュール・Spec・Tests・`data/*` は読み取り専用（レビュー前後で `git status --short` はクリーン、ブランチ `main` のまま）。commit / push / merge / ブランチ切替は行っていない。

### A-1. 原文 art. 25 の直接抽出と独立判定（百分の九十／解約返戻金）

pinned 原文 art. 25（`Article.attr.Num = 25`、main provision）から直接抽出した逐語（要点）:

> 第二十五条 定期金給付契約（生命保険契約を除く。）で…権利の価額は、次の各号に掲げる場合の区分に応じ、当該各号に定める金額による。**一 当該契約に解約返戻金を支払う旨の定めがない場合** 次に掲げる場合の区分に応じ、それぞれ次に定める金額に、**百分の九十**を乗じて得た金額（イ 予定利率の複利による元利合計額／ロ 複利年金終価率を乗じて得た金額）。**二 前号に掲げる場合以外の場合** …支払われるべき**解約返戻金の金額**。

独立抽出したキーフレーズ出現（pinned art. 25 本文・生テキスト）:

| フレーズ | 出現回数 | 判定 |
|---|---|---|
| `百分の九十` | **1** | 第1号に唯一出現。90/100 の根拠。 |
| `解約返戻金` | **2** | 第1号の条件（「支払う旨の定めがない」）と第2号の金額（「解約返戻金の金額」）に各 1 回。 |
| `生命保険契約を除く` | 1 | 適用範囲（除外）。 |
| `複利年金終価率` | 1 | 第1号ロの基礎額算定（財務省令で定める）。 |
| `財務省令` | 1 | 複利年金終価率の定義を財務省令に委譲。 |

**号区分 → Lean 分岐の独立対応表（反転なし）:**

| 原文 | 区分 | Lean | 金額 |
|---|---|---|---|
| 一 解約返戻金を支払う旨の定めがない場合 | 第1号 | `noSurrenderClause = true` | `base * 90 / 100`（＝ 基礎額 × 百分の九十） |
| 二 前号に掲げる場合以外の場合 | 第2号 | `noSurrenderClause = false` | `baseOrSurrenderValue` をそのまま（＝ 解約返戻金の金額） |

独立判定:

- **`annuityNinetyPercentRate = ⟨90, 100, by decide⟩` は原文「百分の九十」に忠実。** 九十＝90、百＝100 をそのまま分子・分母に写像し、`9/10` へ約分していない点も文言に整合。0.9 倍を表す。`applyFloor r m = m * num / den` なので第1号は `m * 90 / 100`（**掛けてから割る**順序）。`m / 100 * 90` のように先に割る順序を採れば base=99 で 0 となり原文と乖離するが、本実装はそうなっていない（`annuityRightValue_no_surrender_clause` が `rfl` で `base * 90 / 100` を確認）。
- **第2号分岐も忠実。** `noSurrenderClause = false` のとき `annuityRightValue false base = base`。第2号の金額は「解約するとしたならば支払われるべき解約返戻金の金額」であり、引数 `baseOrSurrenderValue` がその解約返戻金を表す（doc-comment の「第2号の解約返戻金も caller-established Money」と整合）。Bool の向きは「定めがない場合 → 第1号 → 90%」で、原文の号番号と一致しており**反転バグは不在**。
- 第1号の基礎額（イの元利合計額／ロの複利年金終価率×平均額）は原文どおり「予定利率の複利による計算」「財務省令で定めるもの」に依存し、モジュールはこれを `Money` 入力として受け取る設計（A-5 の B-A3 / U-A2）。

→ **90/100 ・第2号分岐ともに原文に忠実で、食い違いは検出されず。**

### A-2. needle 健全性（CI 実装の 4 本を直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を import し、law_id `325AC0000000073` かつ check 名に `InheritanceAnnuityValuation` を含む 1 check から needle を抽出。pinned `law_full_text` の正規化テキスト（`re.sub(r"[\s\u3000]+", "", …)`、CI と同一条件）に対して `.find()` / `.count()` を実行した。STAGING の申告は信じていない。

| 項目 | 結果 |
|---|---|
| check 数 | **1**（相続税法 art. 25 ↔ InheritanceAnnuityValuation.lean） |
| needle 総数 | **4**（指定どおり） |
| U+3000（全角空白）を含む needle | **0 件** |
| 長さ | 72 / 64 / 29 / 64 文字 |
| pinned 正規化テキストに対する `.find()` | **4/4 FOUND、MISS 0** |
| `.count()` | 全 needle で **1**（一意） |

- 正規化 offset: #1 = 37922 / #2 = 38026 / #3 = 38195 / #4 = 38348（すべて count 1）。
- 4 本はそれぞれ ①art.25 前文、②第1号（「百分の九十」含有）、③第1号ロの「元利合計額」、④第2号（「解約返戻金の金額」）を逐語保持しており、A-1 の独立抽出とも整合。

**needle 健全性: 問題なし（4/4 FOUND、U+3000 0 件、MISS 0、すべて count 1）。**

### A-3. 反例探索（独立再計算＋kernel-decide）

pinned 原文から導いた整数式（第1号 `floor(base*90/100)`、第2号 `base` そのまま）を Python で独立再計算し、一時 Lean ファイル `#eval` テーブル（18 行）と突き合わせた。さらに一時 Lean ファイルに境界 `example := by decide` を追加し、`lake env lean`（exit code **0**、error / warning 0）で走査した。

| 攻撃対象 | 独立再計算／Lean 結果 | 結果 |
|---|---|---|
| base = 0（Bool 2 通り） | 第1号 0／第2号 0 | 矛盾なし |
| base = 1（切り捨て） | 第1号 `floor(90/100) = 0`／第2号 1 | 矛盾なし（急激な切捨てだが `applyFloor` 規約どおり、U-A1） |
| base = 100（90% 境界） | 第1号 90／第2号 100 | 矛盾なし |
| base = 1,000,000 | 第1号 900,000／第2号 1,000,000 | 矛盾なし |
| 90% 境界付近 | 99 → 89、101 → 90、999 → 899、1001 → 900 | 矛盾なし（超えで即 90% 相当に収束） |
| 端数連続域 | 2 → 1、9 → 8、11 → 9、49 → 44、51 → 45、999,999 → 899,999 | 矛盾なし（すべて Nat floor） |
| Bool 2 通り | `true` = 90%、`false` = 解約返戻金そのまま（全 18 行で確認） | 矛盾なし（反転なし） |

- 走査行数 **18**、不一致 **0**。`floor verified = True`（全行で第1号 = `(base*90)//100`、第2号 = `base`）。
- `example by decide` で `true 0 = 0` / `true 1 = 0` / `true 99 = 89` / `true 100 = 90` / `true 1_000_000 = 900_000` / `false 0 = 0` / `false 1 = 1` / `false 1_000_000 = 1_000_000` をすべて確認。

**反例探索で検出された原文↔Lean の矛盾: 0 件（ゼロ）。**

### A-4. 公理監査

一時 Lean ファイルに 3 モジュールの名前付き `def` / `theorem` 計 **8 宣言**すべてを `#print axioms` 対象として記載し、`lake env lean`（exit code **0**）で走査した。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **8** |
| `does not depend on any axioms` | **7** |
| `Classical.choice`（choice） | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **1 件**: `JapanTaxLaw.annuityRightValue_le_base` のみ（`simp` / Nat 補題由来の**許容**範囲） |

- axiom-free（7 件）: `annuityNinetyPercentRate` / `annuityRightValue` / `annuityNinetyPercentRate_eq` / `annuityRightValue_no_surrender_clause` / `annuityRightValue_with_surrender_clause` / `specAnnuityRightValue` / `agreeInheritanceAnnuityValuation`。
- 3 モジュール内に `sorry` / `admit` / `axiom` / `unsafe` の文字列は **0 件**（grep 確認）。

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### A-5. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **6** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = ゼロ）を明示する。** 率・号区分・定数・算術・needle・公理・反例のいずれにも原文との食い違いは検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 率: `⟨90,100⟩` は原文「百分の九十」に一致（1 回出现、A-1）。
- 号区分: 第1号 → `true` → 90%、第2号 → `false` → 解約返戻金そのまま、反転なし（A-1）。
- 算術: `base * 90 / 100`（掛けてから割る）は「金額に百分の九十を乗じて得た金額」に忠実。`base / 100 * 90` 型の早期切捨てバグは不在（A-1 / A-3）。
- needle: 4/4 FOUND、U+3000 0 件、MISS 0（A-2）。
- 反例: 18 行・矛盾 0（A-3）。
- 公理: 禁止公理 0 件（A-4）。

#### BY-DESIGN（6 件）

- **B-A1** 「百分の九十」を `⟨90,100⟩`（den=100 のまま、`9/10` に約分しない）とした写像は原文の文言に忠実。
- **B-A2** 原文の号区分を Bool `noSurrenderClause` に写像（true=第1号 90%／false=第2号 解約返戻金そのまま）。Bool は金額算術を汚さず分岐選択にのみ現れる。
- **B-A3** 第1号の基礎額（予定利率の複利による元利合計額／複利年金終価率×平均額、財務省令で定める複利計算）と第2号の解約返戻金額は `Money` 入力として caller-established とし、**NOT MODELLED**。doc-comment に「財務省令で定める複利計算に依存」「解約返戻金も caller-established」と明記（法的十分性は U-A2 で保留）。
- **B-A4** 「解約返戻金を支払う旨の定めがない場合」該当性、生命保険契約の除外、定期金給付事由の発生有無は caller-established として算術式の外に置く（原文の適用範囲条件を数式に混入させない設計）。
- **B-A5** 丸めは `TaxRate.applyFloor`（Nat 切り捨て）をモデル規約として明示。art. 25 自体に端数規定はなく、原文は「乗じて得た金額」のみを述べる（法的正当性は U-A1 で保留）。
- **B-A6** `annuityRightValue_le_base` は `propext` に依存するが、これは許容公理。計算本体 `annuityRightValue` / `annuityNinetyPercentRate` は axiom-free。

#### UNRESOLVED（2 件）

- **U-A1 端数処理（floor）の法的正当性**: art. 25 は「百分の九十を乗じて得た金額」とし、円未満端数の切捨て／切り上げを明文で定めない。本モデルは `applyFloor`（Nat 切り捨て）を採用し、base=1 で 0 を返す。pinned 原文のみではこの切り捨てが法的に正しいか決定不能。**人間の法律専門家によるレビューを要する**（バッチ G〜M の U-1 と同趣旨）。定数・率・号区分の一致（発見ゼロ）には影響しない。
- **U-A2 複利基礎額・解約返戻金額を caller-established としたことの法的十分性**: 第1号の基礎額は原文で「予定利率の複利による計算」「財務省令で定める」複利年金終価率に依存し、第2号の金額も解約時に支払われるべき解約返戻金として算定される。本モジュールはこれらを `Money` 入力として受け取り、算定自体を NOT MODELLED とした。この「computable core のみを形式化する」範囲設定が法的に十分かは pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。

### A-6. 総合判定・最終報告（サマリ）

- **CONFIRMED: 0 件（ゼロ）** / **BY-DESIGN: 6 件** / **UNRESOLVED: 2 件**。発見ゼロを明示する。
- **最重要 2 点の独立判定**: ① `annuityNinetyPercentRate = ⟨90,100⟩` と `base * 90 / 100` は原文「百分の九十を乗じて得た金額」に **忠実**（den=100 を維持、早期切捨てなし）／② 第2号の `noSurrenderClause = false → base`（解約返戻金そのまま）は原文「解約返戻金の金額」に **忠実**で、Bool の向きは反転して **いない**。
- **needle 健全性**: U+3000 **0 件**、pinned 正規化テキストに **4/4 FOUND**（MISS 0、すべて count 1）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 1 件（`annuityRightValue_le_base`、許容）。8 宣言すべてを走査、exit code 0。
- **反例探索**: base 0 / 1 / 100 / 1,000,000、Bool 2 通り、90% 境界（99/100/101/999/1001/999,999）、切り捨てを含む 18 行で矛盾 **0 件**。
- **Lean モジュール変更: なし**（3 対象モジュールは読み取り専用）。書き換えたのは本ファイルのみで、既存のバッチ G/H/I/J/K/L/M レビューは保持した。commit / push / merge / ブランチ切替は行っていない。
- 残る UNRESOLVED（U-A1 端数処理の法的正当性、U-A2 複利基礎額・解約返戻金額を caller-established とした範囲設定の法的十分性）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・率／号区分の原文照合・整数式の反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## 国税徴収法 104の2 review (2026-11-18)

### T-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（Coordinator が直接実装したモジュールから独立）。形式化担当の doc-comment／STAGING／CI 申告は参照したが、**その正否は信じず**、pinned JSON から Python で原文を直接再抽出し、Lean カーネルで反例・公理を走査して判定した。
- **対象モジュール（読み取り専用・本レビューで変更していない）**:
  - `JapanTaxLaw/TaxCollectionNextBid.lean`（`nextBidFloor`／`nextBidEligible` と verified facts）
  - `JapanTaxLaw/TaxCollectionNextBidSpec.lean`（独立定式 `specNextBidFloor`／`specNextBidEligible`／`agreeTaxCollectionNextBid`）
  - `JapanTaxLaw/TaxCollectionNextBidTests.lean`（smoke checks）
- **一次資料（pinned・改変禁止）**: `data/raw/334AC0000000147_20260525_506AC0000000052.law.json`
  - law_id `334AC0000000147` / revision `334AC0000000147_20260525_506AC0000000052`（`revision_info.amendment_enforcement_date = 2026-05-25`、モジュール doc-comment と一致）。
  - `data/INVENTORY.json` 経由で当該 raw snapshot を引いた（`raw_snapshot.source_file` が上ファイルであることを確認）。
- **抽出方法**: `law_full_text` を CI `transcription_audit.py` の `text()` と同一ロジックで平坦化・`_norm()`（`re.sub(r"[\s\u3000]+", "", …)`）正規化（正規化後 **93,175** 文字）。`MainProvision` 配下の `Article`（`attr.Num = "104_2"`）を直接走査し、art. 104の2 本文を逐語取得。needle は **CI 実装 `checks()` を Python で import して文字列を取得**（手打ちしない）。
- **書き込み先は `docs/ADVERSARIAL_REVIEW.md` のみ**。commit / push / merge / ブランチ切替は行っていない。`git status --short` はクリーン（Lean モジュール無変更）。監査用一時 Lean ファイル・一時 Python スクリプトはリポジトリ外の TEMP に置き、監査後に削除済み。

### T-1. 原文 art. 104の2 からの直接抽出と独立判定

pinned 原文 `Article[Num=104_2]` から逐語抽出した核心部（正規化テキスト、一字も改変せず引用）:

> （次順位買受申込者の決定）第百四条の二徴収職員は、入札の方法により不動産、船舶、航空機、自動車、建設機械、小型船舶、債権又は電話加入権以外の無体財産権等（以下「不動産等」という。）の公売をした場合において、最高価申込者の入札価額（以下この条において「最高入札価額」という。）に**次ぐ高い価額**（**見積価額以上で、かつ、最高入札価額から公売保証金の額を控除した金額以上であるものに限る。**第三項において同じ。）による入札者（前条第二項の規定によりくじで最高価申込者を定めた場合には、当該最高価申込者以外の最高の価額の入札者とする。第三項において同じ。）から次順位による買受けの申込みがあるときは、その者を次順位買受申込者として定めなければならない。２前項の次順位による買受けの申込みは、最高価申込者の決定後直ちにしなければならない。３第一項の場合において、最高入札価額に次ぐ高い価額による入札者が二人以上あるときは、くじで定める。

※ 上の引用は pinned `Article[Num=104_2]` の正規化本文を逐語（強調のため **太字** を付したのみ）で、一字も改変していない。needle 1 も同じ「不動産等」を含む原文を保持している。

独立抽出したキーフレーズ（すべて art. 104の2 正規化本文に **count = 1** で存在）:

| 原文フレーズ（pinned 逐語） | 意味 | Lean 対応 |
|---|---|---|
| `見積価額以上で、かつ、` | 第1の下限（以上＝ inclusive） | `estimate ≤ floor` |
| `最高入札価額から公売保証金の額を控除した金額以上` | 第2の下限（以上＝ inclusive） | `highestBid - deposit ≤ floor` |
| `最高入札価額に次ぐ高い価額` | 最高より下位（strict < 最高） | `bid < highestBid` |

**独立判定（下限 = max(見積, 最高−保証金) は忠実か）**: 原文は「見積価額以上で、かつ、最高入札価額から公売保証金の額を控除した金額以上であるものに限る。」と、二つの下限を **「で、かつ、」** で接続している。すなわち下位入札価額は `見積価額以上` **かつ** `最高入札価額−公売保証金 以上` を同時に満たす必要があり、その下限は両者の **max** になる。`nextBidFloor = max estimate (highestBid - deposit)` はこの二条件をそのまま算術化しており、**原文に忠実**（BY-DESIGN B-T1）。Spec の独立定式 `if estimate ≤ highest - deposit then highest - deposit else estimate` とも全ポイントで一致（`agreeTaxCollectionNextBid = true` をカーネル確認）。

**saturating 減算（保証金 > 最高で 0）が原文に反しないか**: 原文は「控除した金額」を負数として定義しない（金額は円単位の `Money = Nat`）。`highestBid - deposit` が saturating で 0 になるとき、下限は `max estimate 0 = estimate`（estimate ≥ 0）となる。仮に整数減算で負値を許しても `max estimate (負) = estimate` であり、**下限および適格判定の結果は同一**である。したがって saturating は原文の趣旨（見積価額以上という下限が支配する）を変えず、**原文に反しない**（BY-DESIGN B-T2）。なお実務上は art. 100 の公売保証金（見積価額の百分の十以上）と art. 104 の「見積価額以上の入札者」から `deposit ≤ highest` が通常成り立ち、この場合分けはほぼ仮想的な境界である。

### T-2. 第2項・第3項・art.104(2) 特例の NOT MODELLED 判定

| 条項 | pinned 原文（逐語） | 法的性格 | モデル側の扱い | 判定 |
|---|---|---|---|---|
| 第2項 | `前項の次順位による買受けの申込みは、最高価申込者の決定後直ちにしなければならない。` | 申込時期（手続） | NOT MODELLED／caller-established | ✅ BY-DESIGN |
| 第3項 | `第一項の場合において、最高入札価額に次ぐ高い価額による入札者が二人以上あるときは、くじで定める。` | 同額二人以上のくじ（手続） | NOT MODELLED／caller-established | ✅ BY-DESIGN |
| art. 104(2) の特例（第1項括弧内） | `前条第二項の規定によりくじで最高価申込者を定めた場合には、当該最高価申込者以外の最高の価額の入札者とする。` | 最高価申込者をくじで定めた場合の入札者定義（手続） | NOT MODELLED／caller-established | ✅ BY-DESIGN（下記 U-T2 の注記あり） |
| 対象財産の限定 | `入札の方法により…無体財産権等（以下「不動産等」という。）の公売をした場合において` | 適用対象（公売方法・財産種別） | caller-established（算術条件に Bool を入れない） | ✅ BY-DESIGN |

**判定: いずれも「NOT MODELLED / caller-established」と正しく扱われている。** 3 モジュールの doc-comment は第2項・第3項・art.104(2) 特例を明示的に NOT MODELLED と申告しており、算術コア（下限・適格）だけを形式化する範囲設定と整合する。

**注記（U-T2）**: art. 104(2) で最高価申込者がくじで決まった場合、「当該最高価申込者以外の最高の価額の入札者」の入札価額は **最高入札価額と同額** になり得る（最高額同額のくじ引き残りの片方）。この経路ではモデルの `bid < highestBid` は成立しないため、本モデルは当該経路を表現しない。これは申告済みの NOT MODELLED 境界であり実装の誤りではないが、完全性の判断は pinned 算術原文のみでは解けない（下記 UNRESOLVED 参照）。

### T-3. needle 健全性（CI 実装の 4 本を直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を import し、law_id `334AC0000000147` かつ check 名に `TaxCollectionNextBid` を含む **1 check** から needle を取得（STAGING の申告ではなく CI が実際に使う文字列を検査）。pinned `law_full_text` の正規化テキスト（`_norm()`、CI と同一条件）に対して `.find()` / `.count()` を実行した。

| 監査項目 | 結果 |
|---|---|
| CI check 数（ law `334AC0000000147`） | **1**（`国税徴収法 art. 104の2 … ↔ TaxCollectionNextBid.lean`） |
| needle 総数 | **4**（指定どおり） |
| U+3000（全角空白）を含む needle | **0 件** |
| FOUND / MISS | **4/4 FOUND**（MISS **0**） |
| `.count()` | 全 needle で **1**（一意） |

- needle offsets（正規化テキスト）: **44133 / 44236 / 44333 / 44426**（長さ 76 / 86 / 60 / 26 文字、すべて count 1）。
- 4 本はいずれも art. 104の2 本文（「次順位買受申込者の決定」見出し、上限・下限条件、くじ特例、結語）を逐語保持しており、T-1 のキーフレーズ抽出と整合。
- **needle 健全性: 問題なし（4/4 FOUND、U+3000 0 件、MISS 0、すべて count 1）。**

### T-4. 反例探索結果（Lean カーネル `by decide` で走査）

一時 Lean ファイルに独立期待値を `example … := by decide` として書き、`lake env lean`（exit code **0**、エラーなし）で全件パスした。

| 攻撃対象（入力: 見積／最高／保証金／bid） | 独立期待値 | 結果 |
|---|---|---|
| 見積 > 最高−保証金 (1.9M/2M/0.2M) | floor = max(1.9M,1.8M) = **1.9M** | ✅ 一致／矛盾なし |
| 見積 < 最高−保証金 (1M/2M/0.2M) | floor = max(1M,1.8M) = **1.8M** | ✅ 一致／矛盾なし |
| 保証金 > 最高 (0.1M/0.2M/0.3M) | saturating 0 → floor = **0.1M**（整数減算でも同値） | ✅ 一致／原文に反さない |
| 保証金 = 最高 (0.1M/0.2M/0.2M) | floor = **0.1M** | ✅ 一致 |
| **bid = 最高** (1M/2M/0.2M/**2M**) | `bid < highestBid` 不成立 → **不適格** | ✅ 一致（最高価申込者は別途 art.104） |
| **bid = 下限（最高−保証金 = 1.8M）** | 下限以上かつ最高未満 → **適格** | ✅ 一致（「以上」inclusive） |
| **bid = 下限（見積支配 = 1.9M）** | 適格 | ✅ 一致 |
| **bid < 下限** (1,799,999／1,700,000) | **不適格** | ✅ 一致 |
| bid > 最高 (2.1M) | 不適格 | ✅ 一致 |
| 保証金>最高 で bid=見積 | 適格（下限=見積、最高未満） | ✅ 一致 |
| floor = 最高 (2M/2M/0) → 下限未満 bid | 適格な bid なし → 不適格 | ✅ 一致 |
| 全 0 (0/0/0/0) | `0 < 0` 不成立 → 不適格 | ✅ 一致 |
| impl vs 独立定式 (spec) | 追加ポイント (5,7,3)/(5,7,3,4) も一致 | ✅ `agreeTaxCollectionNextBid = true` |

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

### T-5. 公理監査結果

一時 Lean ファイル（TEMP 配置・監査後削除）に 3 モジュールの名前付き `def`／`theorem` 計 **10 宣言**の `#print axioms` を記載し、`lake env lean`（exit code **0**）で走査。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **10**（本 7: `nextBidFloor`, `nextBidEligible`, 5 theorem／Spec 3: `specNextBidFloor`, `specNextBidEligible`, `agreeTaxCollectionNextBid`。Tests は `example` のみで名前付き宣言なし） |
| axiom-free（`does not depend on any axioms`） | **6**（`nextBidFloor`, `nextBidEligible`, `nextBidEligible_iff`, `specNextBidFloor`, `specNextBidEligible`, `agreeTaxCollectionNextBid`） |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **4 件**: `nextBidFloor_ge_estimate`, `nextBidFloor_ge_highest_minus_deposit`, `nextBidEligible_excludes_highest`, `nextBidEligible_excludes_below_floor`（いずれも `Nat.le_max_*`／`simp` 由来、許容範囲） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### T-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **8** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 原文との食い違い（下限式の誤り・saturating 減算の原文不整合・上限判定の逆転・needle MISS・公理混入・反例矛盾）は一切検出されなかった。件数を手柄にしない。下記 UNRESOLVED は実装の誤りではなく、pinned 算術原文のみでは解けない法的判断の保留である。

#### CONFIRMED（0 件）

- 下限式: `max(見積, 最高−保証金)` は原文の二つの「以上」条件に一致（T-1）。
- saturating 減算: 保証金 > 最高 でも下限結果は不変で、原文に反さない（T-1）。
- 上限: `bid < highestBid` は「最高に次ぐ」の strict 性に一致し、bid=最高 を正しく除外（T-4）。
- 簡体字・全角混入: 3 モジュールの `def`／doc-comment に簡体字混入なし。needle の U+3000 も 0 件（T-3）。

#### BY-DESIGN（8 件）

- **B-T1** 下限 = `max(見積, 最高−保証金)` は原文「見積価額以上で、かつ、…控除した金額以上」の忠実な算術化（T-1）。
- **B-T2** saturating Nat 減算（保証金>最高 → 0）は下限・適格結果を変えず原文に反しない（T-1）。
- **B-T3** `bid < highestBid` は「最高入札価額に次ぐ高い価額」の必要条件的算術化。「次ぐ高い」の順位確定は caller-established（T-1／U-T1）。
- **B-T4** 第2項（申込時期「直ちに」）は手続として NOT MODELLED／caller-established（T-2）。
- **B-T5** 第3項（同額二人以上のくじ）は手続として NOT MODELLED／caller-established（T-2）。
- **B-T6** art. 104(2) のくじ特例は手続として NOT MODELLED／caller-established（T-2／U-T2）。
- **B-T7** 入札価額・見積価額・公売保証金・入札者および公売対象財産は caller-established（doc-comment 明示、T-2）。
- **B-T8** 丸め規定は本条になく金額は円単位 `Money = Nat`。Spec の独立定式と impl が `agreeTaxCollectionNextBid = true` で一致（T-1／T-4）。

#### UNRESOLVED（2 件）

- **U-T1 「次ぐ高い価額」の順位セマンティクス**: 原文は「最高入札価額に次ぐ高い価額」＝最高の直下の順位を要求するが、モデルは `bid < highestBid` と二つの下限のみを checking し、「第3順位以下の入札を『次ぐ高い価額』として扱ってよいか」の順位判定は caller-established に委ねる。モデル算術には矛盾がないが、この範囲設定が法的に十分かは pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。
- **U-T2 art. 104(2) くじ特例の完全性**: くじで最高価申込者を定めた場合、第1項括弧は入札者を「当該最高価申込者以外の最高の価額の入札者」と読み替えるため、その価額は最高入札価額と同額になり得る。モデルの `bid < highestBid` はこの経路を表現しない（NOT MODELLED として申告済みで実装誤りではない）。この経路を別途扱う要否・完全性は法的判断であり、pinned 算術原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。

### T-7. 総合判定・最終報告（サマリ）

- 原文（pinned revision `334AC0000000147_20260525_506AC0000000052`）の `Article[Num=104_2]` から直接抽出した「見積価額以上」「最高入札価額から公売保証金の額を控除した金額以上」を照合し、下限 = `max(見積, 最高−保証金)` が **忠実**であると独立判定した。saturating 減算（保証金>最高 → 0）も下限結果を変えず **原文に反しない**。
- 第2項・第3項・art. 104(2) 特例はいずれも **NOT MODELLED／caller-established と正しく扱われている**（T-2）。
- **CONFIRMED: 0 件（ゼロ）**／**BY-DESIGN: 8 件**／**UNRESOLVED: 2 件**。発見ゼロを明示する。
- **needle 健全性**: U+3000 **0 件**、CI 実装の **4/4 FOUND**（MISS 0、すべて count 1、offsets 44133/44236/44333/44426）。
- **反例探索**: 見積>最高−保証金／保証金>最高／bid=最高／bid=下限／bid<下限 を含む 15 行で矛盾 **0 件**（`lake env lean` exit 0）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 4 件（許容）。10 宣言すべてを走査、exit code 0。
- **Lean モジュール変更: なし**（3 対象モジュールおよび各 Spec/Tests は読み取り専用）。書き換えたのは本ファイルのみで、既存のバッチ G〜M／Art.25 レビューは保持した。commit / push / merge / ブランチ切替は行っていない。監査用一時ファイルは削除済み、`git status --short` はクリーン。
- 残る UNRESOLVED（U-T1 順位セマンティクス、U-T2 くじ特例の完全性）は pinned 原文のみでは解けない法的判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・下限／上限式の原文照合・整数式の反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Art.24 review (2026-11-18)

### R-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当 coordinator から独立）。STAGING／doc-comment は参照したが、**その正否は信じず**、pinned JSON から Python で直接再抽出して照合した。
- **対象モジュール（読み取り専用・本レビューで一切変更していない）**:
  - `JapanTaxLaw/InheritanceAnnuityMaxima.lean` — art. 24(1) 一号・二号・三号（有期／無期／終身の「多い金額」）
  - `JapanTaxLaw/InheritanceAnnuityMinMax.lean` — art. 24(1) 四号・24(3)(4)
  - `JapanTaxLaw/InheritanceAnnuityDeathException.lean` — art. 24(2)(5)
- **一次資料（pinned・改変禁止）**: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`（law_id `325AC0000000073`、revision `325AC0000000073_20260401_506AC0000000008`、適用日 2026-04-01）。
- **抽出方法**: `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化（生 154,908 文字 → `re.sub(r"[\s\u3000]+", "", …)` 正規化後 154,766 文字）。実 art. 24 は平坦本文 offset 36,378〜37,947（次の「第二十五条」手前）を逐語取得した（先頭の「第二十四条」は他条からの参照なので除外）。needle は **CI 実装 `checks()` を Python で import して文字列を取得**（手打ちしない）。
- **ツール**: Python 直接再抽出＋`lake env lean`（`#print axioms` 54 宣言／独立反例 38 行、いずれも exit code 0）。
- **書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。既存の Batch G〜M／Art.25／国税徴収法レビューは**すべて保持**。Lean モジュール・Spec・Tests・`data/*`・L7 CSV は読み取り専用。commit / push / merge / ブランチ切替は行っていない（ブランチ `main` のまま）。監査用一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、repo 外。

### R-1. 原文 art.24 の直接抽出と独立判定（号／項 → 算術 → 原文文字列）

pinned 本文から独立抽出したキーフレーズ出現回数（正規化後 art. 24 本文 1,569 文字）:

| 原文フレーズ（逐語） | 出現回数 | 読み取り |
|---|---:|---|
| `次に掲げる金額のうちいずれか多い金額` | **3** | 一号・二号・三号すべてが 3 値の max。 |
| `いずれか多い金額` | 4 | 上の 3 回＋4 項（「多い金額による」）。 |
| `いずれか少ない金額` | **1** | 3 項のみ（min）。4 項と**反転していない**。 |
| `予定利率で除して得た金額` | **1** | **二号のみ**。一号・三号の「乗じて得た金額」と区別。 |
| `複利年金現価率` | 2 | 一号・三号。二号には出てこない。 |
| `残りの期間` / `余命年数として政令で定めるもの` / `第三号ハにおいて同じ` | 1 / 1 / 1 | 一号＝残りの期間、三号＝政令余命年数。一号の現価率定義が三号ハにも及ぶと明記。 |
| `その給付金額` / `第三条第一項第五号` | 1 / 1 | 四号（一時金）。 |
| `同号の規定にかかわらず` / `同項第三号の規定の適用を受けるもの` | 1 / 1 | 2 項の「同号」＝**第三号**（終身定期金）。 |
| `含む。`（第三者分） / `申告書の提出期限までに死亡し` / `その死亡によりその給付が終了した場合` | 1 / 1 / 1 | 2 項＝権利者分＋第三者分の加算、かつ死亡時期 AND 給付終了。 |
| `準用する` / `第三条第一項第六号` | 1 / 1 | 5 項（法的参照規定）。 |

号／項 → 算術 → 原文文字列 → Lean の独立対応表:

| 号／項 | 原文文字列（逐語・要所） | 導かれる算術 | Lean 定義 | 判定 |
|---|---|---|---|---|
| 1 号 有期 | 「一有期定期金**次に掲げる金額のうちいずれか多い金額**イ…解約返戻金の金額ロ…一時金の金額ハ…**残りの期間**に応じ…平均額に、予定利率による**複利年金現価率**…を**乗じて**得た金額」 | `max(イ,ロ,ハ)` | `termAnnuityValue s l a = max s (max l a)` | 一致 |
| 2 号 無期 | 「二無期定期金**次に掲げる金額のうちいずれか多い金額**イ…解約返戻金の金額ロ…一時金の金額ハ…平均額を、当該契約に係る**予定利率で除して**得た金額」 | `max(イ,ロ,ハ)`（ハは除算値） | `perpetualAnnuityValue s l d = max s (max l d)` | 一致（二号だけ除算） |
| 3 号 終身 | 「三終身定期金**次に掲げる金額のうちいずれか多い金額**イ…ロ…ハ…**余命年数として政令で定めるもの**に応じ…平均額に、予定利率による複利年金現価率を**乗じて**得た金額」 | `max(イ,ロ,ハ)`（max 構造は一号と同一） | `lifetimeAnnuityValue s l a = max s (max l a)` | 一致（区分は別名・doc-comment で明示） |
| 4 号 | 「四第三条第一項第五号に規定する一時金**その給付金額**」 | 恒等 | `lumpSumPaymentAmount a = a` | 一致 |
| 2 項 | 「…**同号の規定にかかわらず**、その権利者が…**受け、又は受けるべき金額**（当該権利者の遺族その他の第三者が…死亡により給付を受ける場合には、その給付を受け、又は受けるべき金額を**含む。**）による。」 | `h + t`（第三者あり）／`h`（なし）、通常価額＝第 3 号 | `deathExceptionValue` / `deathExceptionSelected` / `art24_2Value`（`normalValue`＝第 3 号） | 一致 |
| 3 項 | 「…有期定期金として算出した金額又は…終身定期金として算出した金額の**いずれか少ない金額**による。」 | `min(有期,終身)` | `conditionalAnnuityValue = min` | 一致（min） |
| 4 項 | 「…有期定期金として算出した金額又は…終身定期金として算出した金額の**いずれか多い金額**による。」 | `max(有期,終身)` | `continuingAnnuityValue = max` | 一致（max、反転なし） |
| 5 項 | 「前各項の規定は、第三条第一項第六号に規定する定期金に関する権利で契約に基づくもの以外のものの価額の評価について**準用する**。」 | 数式なし（法的参照） | **NOT MODELLED**（needle で原文保持） | 一致 |

**4 点の独立判定:**

1. **max 構造**: 三号とも原文「次に掲げる金額のうちいずれか多い金額」（出現 3 回）→ `max(surrender, lumpSum, 基礎額)` で正しい。`spec` に依らず `*_eq : rfl` と 3 値 max の定義自体を確認。**二号のみ「平均額を…予定利率で除して得た金額」**で、一号・三号の「乗じて得た金額」と混同されていない（独立引数 `dividedByRate`＋doc-comment）。**三号ハは一号と同じ max 構造だが、ハの根拠が「余命年数（政令）」である点を独立 def 名・doc-comment で区別**しており、原文の「第三号ハにおいて同じ」（現価率定義の共有）とも矛盾しない。→ **反転・混同なし**。
2. **min/max**: 原文「いずれか少ない金額」は 3 項に 1 回のみ、「いずれか多い金額」は一号〜三号＋4 項の 4 回。モデルは 3 項→`min`、4 項→`max` で**反転していない**。`conditional_le_continuing`（min ≤ max）も成立。Bool は `if isContinuingContract then max else min` の選択にのみ現れ算術を汚さない。
3. **死亡特例**: 2 項は「権利者が…受け、又は受けるべき金額（…第三者が…給付を受ける場合には、その給付を受け、又は受けるべき金額を含む。）」＝権利者分＋第三者分の加算。`deathExceptionValue = h + t` と `thirdPartyBenefit` による選択（`false` なら `h` のみ）に一致。さらに「同号の規定にかかわらず」の「同号」＝第三号なので通常価額 `normalValue`＝第 3 号終身定期金という doc-comment も原文と一致。5 項「準用する」は数式のない法的参照規定で、**NOT MODELLED が妥当**（needle で原文保持、実装 def なし）。
4. **NOT MODELLED の妥当性**: 複利年金現価率は原文括弧で「複利の計算で年金現価を算出するための割合として**財務省令で定めるもの**」と定義され数式がない。予定利率は契約依存の外部パラメータ。三号の余命年数は「**政令で定めるもの**」。いずれも pinned 原文のみでは算出不能なので、caller-established の計算済み `Money` として受け取る判断は**範囲設定として整合**。法的十分性は R-5 の U-1 で保留（人間の法律専門家レビューを要する）。

→ **4 点すべて原文に忠実で、食い違いは検出されなかった。**

### R-2. needle 健全性（art.24 の 13 本を独立検証）

CI 実装 `checks()` を import し、check 名に `InheritanceAnnuity` を含む 4 check（art.25 の 4 本を含む）のうち、**art. 24 の 3 check・13 本**を対象とした。pinned `law_full_text` の正規化テキスト（`re.sub(r"[\s\u3000]+", "", …)`、CI と同一条件）に `.find()` / `.count()` を実行。STAGING の申告は信じていない。

| check | needle 数 | 長さ | U+3000 | `.find()` | `.count()` |
|---|---:|---|---|---:|---|
| art. 24(1) 一号〜三号 ↔ `InheritanceAnnuityMaxima.lean` | **6** | 90/110/105/95/105/100 | 0 | 6/6 FOUND | 全て 1 |
| art. 24(1) 四号・(3)(4) ↔ `InheritanceAnnuityMinMax.lean` | **4** | 90/116/120/96 | 0 | 4/4 FOUND | 全て 1 |
| art. 24(2)(5) ↔ `InheritanceAnnuityDeathException.lean` | **3** | 88/115/61 | 0 | 3/3 FOUND | 全て 1 |
| **合計** | **13** | 61〜120（指定 60〜130 内） | **0 件** | **13/13 FOUND、MISS 0** | 全て 1（一意） |

- 正規化 offset: Maxima #1〜#6 = 36450 / 36607 / 36766 / 36923 / 36994 / 37151、MinMax #1〜#4 = 37262 / 37577 / 37741 / 37641、Death #1〜#3 = 37329 / 37438 / 37861。
- 13 本は一号〜三号の「多い金額」・二号の「予定利率で除して得た金額」・三号の「余命年数」、四号・3 項「少ない金額」・4 項「多い金額」、2 項の第三者分「含む。」・5 項「準用する」をそれぞれ逐語保持しており、R-1 の独立抽出とも整合。

**needle 健全性: 問題なし（13/13 FOUND、U+3000 0 件、MISS 0、すべて count 1）。**

### R-3. 反例探索（独立 `by decide` 38 行）

一時 Lean ファイルに一時金なし／あり・大小・等値・0・大数・min/max 境界・第三者分あり／なし・全適用判定の `example := by decide` を **38 行**記述し、`lake env lean`（exit code **0**、error / warning 0）で走査した。

| 攻撃対象 | 代表入力 | 結果 |
|---|---|---|
| 一号 イ／ロ／ハ 各最大・等値・0 | `(0,0,0)=0`、`(100,100,100)=100`、`(5,5,3)=5`、`(3,5,5)=5`、`(1000000,999999,1000001)=1000001`、`(0,7,7)=7`、`(7,0,7)=7` | 矛盾なし |
| 二号（ハ＝除算値）の max | `(7,3,3)=7`、`(3,7,3)=7`、`(3,3,7)=7`、`(4,4,4)=4`、`(0,0,0)=0` | 矛盾なし（三号と同一 max 構造） |
| 三号（ハ＝現価率）の max | `(7,3,3)=7`、`(3,7,3)=7`、`(3,3,7)=7`、`(4,4,4)=4` | 矛盾なし |
| 一時金選択 false／none | `selectLumpSum false 999 = 0`、`lumpSumAmount none = 0` | 矛盾なし（Nat≥0 なので max に影響しない） |
| 3 項 min／4 項 max 境界 | `min(100,1)=1`、`min(1,100)=1`、`min(5,5)=5`、`min(0,0)=0`、`max(100,1)=100`、`max(1,100)=100`、`max(5,5)=5` | 矛盾なし（反転なし） |
| 契約種別 Bool | `false→min=3`、`true→max=7` | 矛盾なし |
| 死亡特例 加算・0・第三者なし | `0+0=0`、`7+0=7`、`0+7=7`、`100+50=150`、`selected true 0 0=0`、`selected false 100 50=100` | 矛盾なし |
| `art24_2Value` 全判定 | `(T,T,T,0,0,999)=0`、`(T,T,F,100,50,999)=100`、`(T,F,T,…,999)=999`、`(F,T,T,…,999)=999` | 矛盾なし（通常価額＝第 3 号にフォールバック） |

**反例探索で検出された原文↔Lean の矛盾: 0 件（ゼロ）。**

### R-4. 公理監査

一時 Lean ファイルに 3 モジュールの**名前付き宣言 54 件**（Maxima 24 ＝ def 8＋theorem 16／MinMax 18 ＝ def 4＋theorem 14／DeathException 12 ＝ def 4＋theorem 8）すべてを `#print axioms` 対象として記載し、`lake env lean`（exit code **0**）で走査した。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **54** |
| `does not depend on any axioms` | **37** |
| `Classical.choice`（choice） | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **17 件**（Maxima 9 ＝ 各号 `*_ge_*`、MinMax 8 ＝ `min`/`max` 補題由来。すべて**許容**範囲） |

- 禁止公理は一切検出されず。計算本体の各 `def` はすべて axiom-free。
- 3 モジュール内に `sorry` / `admit` / `axiom` / `unsafe` の文字列は **0 件**（grep 確認）。

→ **公理監査は合格（choice / sorryAx / Quot.sound ＝ 0、propext のみ）。**

### R-5. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（実際の食い違い）** | **0（ゼロ）** |
| **BY-DESIGN** | **9** |
| **UNRESOLVED** | **3** |

> **発見ゼロ（CONFIRMED ＝ ゼロ）を明示する。** max 構造・二号の除算区別・三号の区分・min/max の向き・死亡特例加算・5 項 NOT MODELLED・needle・反例・公理のいずれにも原文との食い違いは検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 号区分: 一号〜三号の「多い金額」＝ 3 値 max（`*_eq : rfl`、反転なし／R-1・R-3）。
- 二号のハ: 「平均額を予定利率で除して得た金額」を独立引数として区別、一号・三号の「乗じて得た金額」と混同なし（R-1 判定 1）。
- 三号のハ: 一号と同じ max 構造だが「余命年数（政令）」を root とする点を独立 def・doc-comment で区別（R-1 判定 1）。
- 3 項／4 項: 少ない金額＝min／多い金額＝max、反転なし（R-1 判定 2）。
- 死亡特例: 権利者分＋第三者分の加算、5 項「準用」の NOT MODELLED（R-1 判定 3）。
- needle: 13/13 FOUND、U+3000 0 件、MISS 0（R-2）。
- 反例: 38 行・矛盾 0（R-3）。
- 公理: choice / sorryAx / Quot.sound 0 件（R-4）。

#### BY-DESIGN（9 件）

- **B-1** 一号・二号・三号の「次に掲げる金額のうちいずれか多い金額」を `max(イ,ロ,ハ)` の 3 値 max として定式化（原文出現 3 回）。Bool/Option を金額式に入れない。
- **B-2** 二号のハのみ「平均額÷予定利率」を計算済み `Money`（`dividedByRate`）として受け取り、一号・三号の「平均額×複利年金現価率」と区別。
- **B-3** 三号のハは一号と同じ算術（max×現価率）だが、ハの根拠を「残りの期間」（一号）／「余命年数（政令）」（三号）として doc-comment で分離。原文の「第三号ハにおいて同じ」による現価率定義共有とも整合。
- **B-4** 一時金ロの「給付を受けることができる場合」分岐を caller-established の Bool／Option とし、`selectLumpSum`／`lumpSumAmount` で 0 に解決してから max へ渡す（該当しない場合 0）。
- **B-5** 3 項／4 項の契約種別を caller-established Bool で選択（`true`＝4 項 max／`false`＝3 項 min）。Bool は算術ではなく選択にのみ現れる。
- **B-6** 2 項の加算構造 `h + t`（第三者給付がある場合のみ加算）と、`normalValue`＝第 3 号終身定期金（原文「同号」＝第三号）。死亡時期・給付終了・第三者該当性は caller-established Bool。
- **B-7** 複利年金現価率（財務省令）・予定利率（契約依存）・余命年数（政令）・平均額との乗除を **NOT MODELLED** とし、計算済み `Money` を caller-established として受け取る（法的十分性は U-1 で保留）。
- **B-8** 5 項「準用する」は数式のない法的参照規定のため **NOT MODELLED**。needle は原文保持の証拠として残すが対応する実装 def は作らない。
- **B-9** `Money = Nat`（丸めなし・加算／max／min のみ）。`propext` 17 件は Nat の min/max 補題由来の許容公理で、計算本体は axiom-free。

#### UNRESOLVED（3 件）

- **U-1 NOT MODELLED 範囲設定の法的十分性**: 複利年金現価率は「財務省令で定めるもの」、予定利率は契約依存、三号の余命年数は「政令で定めるもの」であり、pinned 原文のみでは算出手順が存在しない。これらを caller-established `Money` として受け取る「computable core のみを形式化する」判断が法的に十分かは**人間の法律専門家によるレビューを要する**（省令／政令との照合が必要）。
- **U-2 2 項の金額算定・事実認定の caller-established 化**: 「受け、又は受けるべき金額」（権利者分・第三者分）の具体的算定、申告書提出期限までの死亡、死亡による給付終了、第三者該当性はすべて caller-established としている。加算構造自体は原文に忠実だが、これらの金額算定・事実認定の法的詳細は pinned 原文のみでは決定不能で、**人間の法律専門家によるレビューを要する**。
- **U-3 モジュール分割に伴う合成の call-site 依存**: 3 項／4 項の「有期定期金として算出した金額」「終身定期金として算出した金額」、および 2 項の通常価額（第 3 号）は、art. 24(1) の各号 max 構造（`InheritanceAnnuityMaxima`）の出力が入るべき値だが、`InheritanceAnnuityMinMax`／`InheritanceAnnuityDeathException` では caller-established `Money` として受け取る。この合成を呼び出し側に委ねているため、統合時の法律的正しさ（特に 2 項の「同号」＝第三号の算出との対応）は本レビューの 3 モジュールだけでは担保されない。**人間の法律専門家によるレビューを要する**。

### R-6. 総合判定・最終報告（サマリ）

- **CONFIRMED: 0 件（ゼロ）** / **BY-DESIGN: 9 件** / **UNRESOLVED: 3 件**。発見ゼロを明示する。
- **最重要 4 点の独立判定**: ①三号とも原文「多い金額」＝3 値 max、二号のみ「予定利率で除して得た金額」、三号ハは一号と同じ max で区分のみ異なる（反転・混同なし）／②3 項＝min・4 項＝max（反転なし）／③2 項＝権利者分＋第三者分の加算、5 項「準用」は NOT MODELLED が妥当／④複利年金現価率・予定利率・余命年数の caller-established 化は範囲設定として整合（法的十分性は U-1 で保留）。
- **needle 健全性**: U+3000 **0 件**、pinned 正規化テキストに **13/13 FOUND**（MISS 0、すべて count 1）。
- **反例探索**: 大小・等値・0・大数・一時金あり／なし・min/max 境界・第三者分あり／なし・適用判定を含む **38 行**で矛盾 **0 件**（`lake env lean` exit 0）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 17 件（Maxima 9／MinMax 8、許容）。54 宣言すべてを走査、exit code 0。`sorry` / `admit` / `axiom` / `unsafe` も 0 件。
- **Lean モジュール変更: なし**（3 対象モジュールは読み取り専用）。書き換えたのは本ファイルのみで、既存の Batch G〜M／Art.25／国税徴収法レビューは**すべて保持**した。commit / push / merge / ブランチ切替は行っていない。監査用一時ファイルは repo 外の approved temp dir に置いた（本レビュー以外の worker による並行変更の有無は本レビューの対象外）。
- 残る UNRESOLVED（U-1 NOT MODELLED 範囲設定、U-2 2 項の金額算定・事実認定、U-3 モジュール合成の call-site 依存）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・号／項と算術の原文照合・反例の `by decide` 走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Article-pinned batch 1 review (2026-11-18)

### 0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent。形式化担当の STAGING／doc-comment の申告は**信じず**、`data/INVENTORY.json` と `data/raw/*.law.json`（pinned）から Python で直接再抽出して照合した。
- **対象（すべて読み取り専用・一切変更していない）**: 下記 12 モジュール（`JapanTaxLaw/` 配下）＋各 `-Spec.lean` / `-Tests.lean`。
- **書き換えたのは本ファイルのみ**。既存の Batch G〜M／Art.25／Art.24／国税徴収法レビューは**すべて保持**。commit / push / merge / ブランチ切替は行っていない（`main` のまま）。監査用一時ファイルは approved temp dir に置き、**すべて削除済み**。
- 作業ツリーには他エージェントによる無関係な変更（`README.md` 等）が存在するが、本レビューでは触れていない。

### 0-A. pin 照合（doc-comment vs `data/INVENTORY.json`）

| law_id | doc-comment の revision | INVENTORY `current_revision` | source_sha256 == ファイル実哈希 | 判定 |
|---|---|---|---|---|
| 340AC0000000034（法人税法） | `…_20261001_508AC0000000012` | 一致 | 一致 | ✅ |
| 340AC0000000033（所得税法） | `…_20261001_507AC0000000070` | 一致 | 一致 | ✅ |
| 325AC0000000073（相続税法） | `…_20260401_506AC0000000008` | 一致 | 一致 | ✅ |
| 332AC0000000026（租税特別措置法） | `…_20261101_507AC0000000013` | 一致 | 一致 | ✅ |
| 337AC0000000066（国税通則法） | `…_20261101_507AC0000000013` | 一致 | 一致 | ✅ |
| 363AC0000000108（消費税法） | `…_20261101_507AC0000000013` | 一致 | 一致 | ✅ |
| 143AC0000000054（関税定率法） | `…_20260601_508AC0000000005` | 一致 | 一致 | ✅ |

→ **7 law_id すべてで doc-comment の pin が INVENTORY 現行と一致（cross_law gate 対象外の montage を含む）。pin の不一致は 0 件。** なお `CustomsDamageReduction.lean` と `CustomsTransactionPrice.lean` の doc-comment は sha256 を記載せず raw snapshot パスのみだが、INVENTORY の `source_sha256` と実ファイル哈希は一致しており、欠陥ではない（観察事項）。

### 0-B. needle 健全性（CI 実装を直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を import し、対象 12 モジュール名を含む check の needle を抽出。pinned `law_full_text` の正規化テキスト（`re.sub(r"[\s\u3000]+", "", …)`）に `.find()` / `.count()` を実行（手打ちせず CI が使う文字列を検査）。

| 項目 | 結果 |
|---|---|
| 対象 check 数 | 17（モジュール 12 に対する art. 対応 check） |
| needle 総数 | **60** |
| FOUND | **60/60**（MISS **0**） |
| U+3000（全角空白）を含む needle | **0 件** |
| `.count()` | 全件 1（一意） |

→ **needle 健全性: 問題なし。** `百分の十九の税率`（法人税法 art.66 内 count 3）、`千万円以下の金額百分の十`（相続税法 art.16 内 count 2）は article 内で複数回出現するが、いずれも FOUND であり MISS ではない。

---

### CorporateTaxRate.lean — 法人税法 art. 66（L4 法人税率）

- **pin**: law_id `340AC0000000034` / revision `…_20261001_508AC0000000012` — INVENTORY 現行と一致。sha256 一致。needle 4/4 FOUND、U+3000 0。
- **独立抽出（原文 → Lean 定数）**:

| 原文（pinned, 正規化） | 独立抽出 | Lean 定数 | 照合 |
|---|---|---|---|
| `百分の二十三・二の税率` | 23.2% = 232/1000 | `ordinaryRate = ⟨232,1000⟩` | ✅ |
| `百分の十九の税率` | 19% = 19/100 | `smeRate = ⟨19,100⟩` | ✅ |
| `年八百万円以下の金額` | ¥8,000,000 | `smeIncomeCap = 8_000_000` | ✅ |
| `資本金の額若しくは出資金の額が一億円以下` | ¥100,000,000 | `smeEligible` の `≤ 100_000_000` | ✅ |

- **小数点率の 10 倍過大バグ**: `二十三・二 = 23.2` を百分で割るので 23.2/100 = **0.232**。もし誤って `⟨232,100⟩` なら 232% となるが実装は `⟨232,1000⟩` で正しい。**バグなし**。
- **反例**: 所得 0 → 0、8,000,000 → 1,520,000（19%）、10,000,000（資本 5,000 万）→ 1,984,000、大法人 8,000,000 → 1,856,000、完全支配フラグ true → 23.2% 適用。すべて独立計算と一致。
- **判定**: **BY-DESIGN**。通算法人・完全支配関係の判定は caller-established、art. 66(4) の月数按分は NOT MODELLED（doc-comment 明示）。CONFIRMED 0 件。

### IndividualIncomeTax.lean — 所得税法 art. 89(1)（L4 超過累進）

- **pin**: `340AC0000000033` / `…_20261001_507AC0000000070` 一致、sha256 一致。needle 4/4 FOUND、U+3000 0。
- **独立抽出（pinned art.89 の速算表を全 band 再抽出）**:

| 上欄（上限） | 下欄 | Lean `taxBands` / `topTaxRate` | 照合 |
|---|---|---|---|
| 1,950,000 円以下 | 5% | `{limit:=1_950_000, pct:=5}` | ✅ |
| 3,300,000 円以下超 | 10% | `{3_300_000, 10}` | ✅ |
| 6,950,000 円以下超 | 20% | `{6_950_000, 20}` | ✅ |
| 9,000,000 円以下超 | 23% | `{9_000_000, 23}` | ✅ |
| 18,000,000 円以下超 | 33% | `{18_000_000, 33}` | ✅ |
| 40,000,000 円以下超 | 40% | `{40_000_000, 40}` | ✅ |
| 四千万円を超える金額 | 45% | `topTaxRate = ⟨45,100⟩` | ✅ |

- **反例**: 各 band 境界（1.95/3.3/6.95/9/18/40M）と 0、10M→1,764,000、50M→17,704,000、山林の 1/5→×5 を独立計算し一致。
- **判定**: **BY-DESIGN**（課税総所得額等は caller-established input）。**UNRESOLVED U-1**: 各 band 積の per-product floor は原文に intra-sum 丸め規定がなく、モデルが明示した候補セマンティクスである（人間の法律専門家レビューを要する）。CONFIRMED 0 件。

### GiftTax.lean — 相続税法 art. 21-7 / 21-5（L4 贈与税）

- **pin**: `325AC0000000073` / `…_20260401_506AC0000000008` 一致、sha256 一致。needle（art.21-7 5 本 + art.21-5 1 本）= 6/6 FOUND、U+3000 0。
- **独立抽出**: 速算表 = 2M→10% / 3M→15% / 4M→20% / 6M→30% / 10M→40% / 15M→45% / 30M→50% / 超→55%。`giftRateTable` の 7 band＋`giftTopRate=⟨55,100⟩` と**全件一致**。基礎控除 `課税価格から六十万円を控除する` = 600,000 → `giftBasicDeduction = 600_000` ✅。
- **反例**: 各上限（2/3/4/6/10/15/30M）の税額 200,000/350,000/550,000/1,150,000/2,750,000/5,000,000/12,500,000、40M→18,000,000、控除境界 600,000→0、600,001→0 すべて一致。
- **観察（モデル値に影響なし）**: doc-comment の親括弧内の率列挙に `三十五`（35%）という記載があるが、直後の正しい一覧（千五百万円以下 45%）と `giftRateTable` の `pct:=45` は原文どおり。**doc-comment の表記ゆれであり定数は正しい**。
- **判定**: **BY-DESIGN**。CONFIRMED 0 件。

### PhaseECorpRates.lean — 租税特別措置法 art. 67の2 / 68（Phase E クロスロー）

- **pin**: 法人税法 `340AC…0034` と租特法 `332AC…0026` の 2 件、いずれも INVENTORY 現行一致、sha256 一致。needle 2/2 FOUND、U+3000 0。
- **独立抽出**:

| 原文 | 抽出 | Lean | 照合 |
|---|---|---|---|
| `百分の十九の税率により`（art.67の2(1)） | 19% | `specialMedicalCorpTax` = `smeRate.applyFloor` = 19/100 | ✅ |
| `十億円（…月数を乗じてこれを十二で除して計算した金額とする。）を超える部分…百分の二十二`（art.68(1)） | 上限 ¥1,000,000,000、超過 22% | `coopSpecialCap = 1_000_000_000*m/12`、`coopSpecialExcessRate = ⟨22,100⟩` | ✅ |

- **反例**: 800M→152M、1B→190M、2B→410M、6 ヶ月上限 500M、1 ヶ月上限 83,333,333（floor）、非適格→19% フォールバック。十九<二十二<二十三・二 の順序も成立。
- **判定**: **BY-DESIGN**（承認・三要件は caller-established）。**UNRESOLVED U-2**: 上限の月数按分 `1_000_000_000*m/12` の除算丸めは原文が规定了していない（art.68(2) の端数処理は月数側）。CONFIRMED 0 件。

### TaxRounding.lean — 国税通則法 art. 118 / 119（L3/L4 端数）

- **pin**: `337AC0000000066` / `…_20261101_507AC0000000013` 一致、sha256 一致。needle 2/2 FOUND、U+3000 0。
- **独立抽出**: art.118(1) `千円未満の端数…切り捨てる` → `thousandYenFloor x = x/1000*1000` ✅。art.119(1) `百円未満の端数…切り捨てる` → `hundredYenFloor x = x/100*100` ✅。除外（118: 印紙税・附帯税／119: 自動車重量税・印紙税・附帯税）も原文逐語と一致。
- **反例**: 0/999/1000/1001/12,345/99,999/100,000/1,234,567 の各 1000・100 floor が `x - x%n` と一致、べき等・単調も成立。
- **判定**: **BY-DESIGN**。art.118(2)(3)・119(2)〜(4) は NOT MODELLED。CONFIRMED 0 件。

### InheritanceTax.lean — 相続税法 art. 15 / 16（L4 相続税）

- **pin**: `325AC0000000073` / `…_20260401_506AC0000000008` 一致、sha256 一致。needle（art.15 1 本 + art.16 4 本）= 5/5 FOUND、U+3000 0。
- **独立抽出**: art.16 速算表 = 10M→10% / 30M→15% / 50M→20% / 100M→30% / 200M→40% / 300M→45% / 600M→50% / 超→55%。`inheritanceRateTable`（7 band）＋`inheritanceTopRate=⟨55,100⟩` と**全件一致**。art.15 `三千万円と六百万円に…相続人の数を乗じて…合計額` → `30_000_000 + 6_000_000*heirs` ✅。art.15(2) の養子数制限（実子≥1→養子 1 まで／実子 0→2 まで）→ `limitedAdoptedHeirs` ✅。
- **反例**: 各上限（10/30/50/100/200/300/600M）の税額 1M/4M/8M/23M/63M/108M/258M、700M→313M、基礎控除 0/1/2/3/10 人、養子境界（1,3→2／0,3→2 等）すべて一致。
- **判定**: **CONFIRMED（公理のみ、下記 A-1）** ＋ **BY-DESIGN**（art.17 の按分は配偶者＋子のみ、法定相続分は caller-established）。税額モデル値自体の誤りは 0 件。

### SpecialGiftRate.lean — 租税特別措置法 art. 70の2の5（Phase E クロスロー）

- **pin**: 相続税法 `325AC…0073` と租特法 `332AC…0026` の 2 件、一致。sha256 一致。needle 2/2 FOUND、U+3000 0。
- **独立抽出（率）**: 2M→10% / 4M→15% / 6M→20% / 10M→30% / 15M→40% / 30M→45% / 45M→50% / 超→55%。`specialGiftRateTable`（7 band）＋`giftTopRate=⟨55,100⟩` と**全件一致**。小数率 10 倍バグなし。
- **CONFIRMED C-1 — 適用前の基礎控除が原文と食い違う（モデル値）**: pinned art.70の2の5(1) の柱書は「相続税法第二十一条の七の規定にかかわらず、**前条の規定による控除後**の課税価格を…」と規定する。この「前条」＝租特法 **art.70の2の4（贈与税の基礎控除の特例）** は pinned 原文で「相続税法第二十一条の五の規定にかかわらず、課税価格から**百十万円**を控除する」と明示（＝1,100,000 円）。しかし `specialGiftTax`（行 142）は `giftBasicDeduction`（=600,000、相続税法 art.21-5）を控除している。doc-comment 行 74–75 は「art.70の2の4 との interplay は NOT MODELLED」と申告しつつ、実装は 60 万円控除を適用しており、**申告と実装も矛盾**している。
  - 反例（独立計算）: 直系尊属からの 1,100,000 円贈与 → モデル 50,000 円／原文準拠 0 円。2,600,000 円 → モデル 200,000 円（Lean の `example` 行 241 がそのままこの値を期待）／原文準拠 150,000 円。5,000,000 円 → 580,000 円／485,000 円。
  - **率表自体は正確**。不一致は控除額の選択のみ。修正は形式化担当の責任範囲（本レビューは読み取り専用のため未修正）。最終的な法的取扱いには専門家確認を要するが、pinned 原文の条文参照に基づく機械的照合では不一致が確定している。
- **判定**: **CONFIRMED 1 件（C-1）** ＋ BY-DESIGN（適格 2 要件は caller-established、art.70の2の5(2)〜(6) は非モデル化）。

### ConsumptionTaxRate.lean — 消費税法 art. 29（L4 税率）

- **pin**: `363AC0000000108` / `…_20261101_507AC0000000013` 一致、sha256 一致。needle 2/2 FOUND、U+3000 0。
- **独立抽出**:

| 原文 | 数学的意味 | Lean | 照合 |
|---|---|---|---|
| `百分の七・八` | 7.8/100 = **0.078** | `standardRate = ⟨78,1000⟩` | ✅ |
| `百分の六・二四` | 6.24/100 = **0.0624** | `reducedRate = ⟨624,10000⟩` | ✅ |

- **小数点率の 10 倍過大バグ**: もし `⟨78,100⟩` や `⟨624,1000⟩` なら 10 倍（78% / 62.4%）となるが実装は正しい分母。**バグなし**。軽減率 = 標準率 × 0.8 の関係も 100,000 円で 6,240×5 = 7,800×4 として成立。
- **反例**: 0 → 0、100,000 → 7,800 / 6,240、単調性。敵対的サンプリングで矛盾なし。
- **判定**: **BY-DESIGN**（軽減対象該当性は caller-established Bool）。CONFIRMED 0 件。

### ConsumptionTaxableBase.lean — 消費税法 art. 28（L4 課税標準）

- **pin**: `363AC0000000108` 一致、sha256 一致。needle 6/6 FOUND、U+3000 0。
- **独立抽出（原文 → モデル）**: art.28(1) 本文「対価の額…消費税額及び…地方消費税額に相当する額を含まない」→ `consideration` を税抜 caller-established とする設計 ✅。ただし書「法人が…役員に譲渡した場合において…著しく低いときは、その価額に相当する金額をその対価の額とみなす」→ `if isOfficerTransfer && markedlyLow then assetValue else consideration` ✅。art.28(2) 特定課税仕入れ＝支払対価の額 → `specifiedPurchaseBase paid = paid` ✅。art.28(3) 一号・二号とも「当該資産の価額に相当する金額」→ `deemedSupplyBase _ v = v` ✅。
- **反例**: (100,000,false,false,1M)→100,000／(…,true,true,…)→1,000,000／(0,true,true,0)→0。caller-established フラグの 4 通りすべて原文と整合。
- **判定**: **BY-DESIGN**。art.28(4)（保税貨物）・(5) は NOT MODELLED。CONFIRMED 0 件。

### ConsumptionTaxInputCredit.lean — 消費税法 art. 30（L4 仕入税額控除）

- **pin**: `363AC0000000108` 一致、sha256 一致。needle 13/13 FOUND、U+3000 0。
- **独立抽出**: `当該特定課税仕入れに係る支払対価の額に百分の七・八を乗じて算出した金額` → `specifiedPurchaseTax = standardRate.applyFloor = paid*78/1000` ✅。art.30(2) の閾値 `課税売上高が五億円を超えるとき、又は…課税売上割合が百分の九十五に満たないとき` → `sales > 500_000_000 || num*100 < 95*den` ✅（95% ちょうどは「満たない」に該当しない）。
- **反例**: 100,000×7.8%=7,800（1 円→0）、合計 20,000+7,800+12,000=39,800、控除後 60,200、underflow→0、5 億ちょうど→按分不要／5 億+1→要、95%→不要／90%→要。すべて一致。
- **CONFIRMED C-2 — doc-comment の陳腐化（モデル値は正しい）**: モジュール先頭の scope notes（行 50）は「art. 30(2)…**NOT YET COVERED**」と記載するが、実際には行 137–203 で `namespace Apportionment` として art.30(2) の按分（`needsApportionment` / `commonPortion` / `apportionedIfSeparated` / `apportionedIfUnseparated`）が実装され、pinned 原文も needle で保持されている。**実装と doc-comment が矛盾**（バッチ H の C-1 と同種）。税額計算・定数には影響なし。修正は形式化担当の責任範囲（未修正）。
- **判定**: **CONFIRMED 1 件（C-2: doc のみ）** ＋ BY-DESIGN（還付は射程外、saturating 減算を明示）。

### CustomsDamageReduction.lean — 関税定率法 art. 10(1)（L4 軽減）

- **pin**: `143AC0000000054` / `…_20260601_508AC0000000005` 一致（sha256 は doc-comment に記載なしだが INVENTORY／実ファイルは一致）。needle 5/5 FOUND、U+3000 0。
- **独立抽出**: 原文は「価格の低下率を基準として、その関税を軽減し、又は…差額以内において、その関税を軽減することができる」であり、**固定の率・金額は存在しない**。低下率は「政令で定めるところにより」→ caller-established `TaxRate` とする設計は原文に忠実。`税率×低下率`（`depreciationReduction`）と `元税額−損傷後税額`（`reductionCap`）の二構造も一致。ただし書（申告等までに変質→低下率基準軽減不可、数量課税を除く）は caller-established Bool として構造に渡す設計を明示。
- **反例**: 1,000,000×10%=100,000、差額 150,000→「差額以内」true、50,000→false、元≤損傷後→差額 0。境界・saturating 減算とも原文に反しない。
- **判定**: **BY-DESIGN**。第 2〜4 項は NOT MODELLED。CONFIRMED 0 件。

### CustomsTransactionPrice.lean — 関税定率法 art. 4（L4 課税価格）

- **pin**: `143AC0000000054` 一致（sha256 は doc-comment に記載なしだが INVENTORY／実ファイルは一致）。needle 9/9 FOUND、U+3000 0。
- **独立抽出**: art.4(1) の加算項目は 一（運賃等）／二イ（手数料）／二ロ（容器）／二ハ（包装）／三イ（材料）／三ロ（工具）／三ハ（消費物品）／三ニ（技術役務）／四（知的財産対価）／五（売手帰属収益）の **10 項目**。`CustomsAdditions` の 10 フィールドと `additionsTotal` の合計順が一致。柱書「現実に支払われた…価格に、その含まれていない限度において…加えた価格」→ `paid + additionsTotal` ✅。
- **反例**: サンプル合計 146,000、1,000,000+146,000=1,146,000、加算 0→paid、paid≤transactionPrice。すべて一致。
- **観察**: タスク記述では「関税法 art.4の4 等」とされているが、モジュールが pin して実装しているのは **関税定率法 art.4（課税価格の決定の原則）** であり、doc-comment・needle・原文は内部整合している。タスク側の表記差でありモジュールの欠陥ではない。
- **判定**: **BY-DESIGN**。政令細目・art.4の2〜4の4 の代替算定は NOT MODELLED。CONFIRMED 0 件。

---

### A. 公理監査（12 モジュール + 各 Spec/Tests を一括）

- 一時 Lean ファイル（approved temp dir）に 36 ファイルの名前付き `def` / `theorem` 計 **187 宣言**すべての `#print axioms` を記載し、`lake env lean`（exit code **0**）で走査。監査後、一時ファイル・一時スクリプトは**すべて削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **187**（axiom-free 148 / propext のみ 38 / その他 1） |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **1 件** ❌（要件 `Quot.sound = 0` を満たさない） |
| `propext` | 38 件（許容範囲、Nat の min/max・`simp` 由来） |

- **A-1 CONFIRMED — `JapanTaxLaw.limitedAdoptedHeirs_le`（`InheritanceTax.lean` 行 135–143）が `[propext, Quot.sound]` に依存**。証明末尾の `omega`（2 箇所）が原因で、独立した最小化プローブ（`split` + `omega` の再現）でも同じ公理依存を確認した。`Quot.sound` は本タスクの禁止対象であり、**公理監査は不合格**。モデル値・税額計算への影響はない（証明技法の問題）。修正は形式化担当の責任範囲（例: `omega` を `simp`/`omega` 以外の Nat 算術補題に置換）。一時プローブは削除済み。
- 残る 186 宣言は禁止公理を含まない（148 axiom-free ＋ 38 propext）。

### B. 反例探索（総括）

Python で各モジュールの算術を独立再実装し、境界値・0・端数・区分境界・丸め・underflow・単調性を含む **102 チェック**を走査 → **MISMATCH 0（ゼロ）**。レビュア側ハーネスの期待値誤記 3 件（所得税 10M/50M の累計と 6 ヶ月上限）は独立再計算で訂正し、最終結果は不一致 0。具体的には 0/控除境界/各 band 上限±1/小数点率（7.8%・6.24%・23.2%）/5 億・95% 閾値/養子数制限/加算 0 などを網羅。**原文↔Lean の税額矛盾は C-1 の控除選択を除き 0 件**。

### C. CONFIRMED / BY-DESIGN / UNRESOLVED 件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **3** |
| **BY-DESIGN** | **9**（統合カテゴリ） |
| **UNRESOLVED** | **3** |

#### CONFIRMED（3 件）

- **C-1** `SpecialGiftRate.lean`: 柱書が参照する前条 art.70の2の4 の控除は **1,100,000 円**（百十万円）だが、実装は `giftBasicDeduction = 600,000` を適用。反例 1,100,000 円贈与で 50,000 円 vs 0 円。率表自体は正しい（詳細は当該モジュール節）。
- **C-2** `ConsumptionTaxInputCredit.lean`: 先頭 doc-comment が art.30(2) を NOT YET COVERED と記載するが、実際には `Apportionment` namespace で実装済み（doc のみの陳腐化、モデル値は正しい）。
- **A-1** `InheritanceTax.lean`: `limitedAdoptedHeirs_le` が `Quot.sound` に依存（`omega` 由来）。公理要件違反。

#### BY-DESIGN（9 件・統合）

- **B-1** 税率表の `limit` は inclusive 上端として原文「〜以下」を忠実に表現（全 4 表で照合済み）。
- **B-2** 小数点率の分母（23.2→1000、7.8→1000、6.24→10000）は十進表記から一意に導かれ、10 倍過大バグなし。
- **B-3** 該当性・原因・適格要件（SME、完全支配、医療法人承認、協同組合三要件、軽減対象、役員、直系尊属・18 歳、免税事業者、変質時期、除く条件等）はすべて caller-established Bool として金額式に入れない設計。
- **B-4** 課税標準・対価・時価・加算項目・低下率・売上割合等は計算済み caller-established 入力。
- **B-5** `applyFloor`（切り捨て）を per-law business data として明記（通則法 art.118/119 は入力側・確定側の別 primitive）。
- **B-6** 控除・按分の saturated Nat 減算は「還付は射程外」として明示し、`*_exact` 定理で input ≤ output の場合のみ正確と限定。
- **B-7** 非モデル化範囲（art.66(4)、art.67の2(2)〜(5)、art.68(2) 月数丸め、相続 art.17 の他区分、art.21-6/21-13、通則法その他の項、消費税法 art.28(4)(5)・30(3)〜(12)、関税 art.10(2)〜(4)・art.4の2〜4の4）はすべて doc-comment で申告済み。
- **B-8** 2 つの関税モジュールの doc-comment に sha256 が無い点、および `GiftTax.lean` doc-comment の率列挙「三十五」は表記上の問題のみで pin／定数には影響しない。
- **B-9** `CustomsTransactionPrice.lean` の対象は関税定率法 art.4（タスク記述の「関税法 art.4の4」とは表記差）で、原文・needle・実装は整合。

#### UNRESOLVED（3 件）

- **U-1** 所得税 art.89 の band 積 intra-sum 丸め（per-product floor）の法的正当性 — 原文に規定なし、**人間の法律専門家によるレビューを要する**。
- **U-2** 租特法 art.68 の上限月数按分 `10億×月数÷12` の除算丸め — 原文が算術の丸めを规定了していない、**人間の法律専門家によるレビューを要する**。
- **U-3** 相続税法 art.17 の共有割合（配偶者＋子のみ）・art.15(2) 養子数制限の caller-established 化が法的に十分か — pinned 原文のみでは決定不能、**人間の法律専門家によるレビューを要する**。

### D. 最終報告（サマリ）

- **CONFIRMED: 3 件**（C-1 特別贈与の控除額 60 万 vs 110 万／C-2 art.30(2) の doc 陳腐化／A-1 `Quot.sound` 混入）／**BY-DESIGN: 9 件**／**UNRESOLVED: 3 件**。
- **needle**: 60/60 FOUND、U+3000 **0 件**、MISS 0。
- **pin**: 7 law_id すべてで doc-comment と INVENTORY 現行 revision・sha256 が一致（不一致 0）。
- **反例**: 102 チェック、原文↔Lean の税額矛盾 0（C-1 の控除選択を除く）。レビュア側ハーネス期待値誤記 3 件は自己訂正済み。
- **公理結果**: `Classical.choice` 0 / `sorryAx` 0 / **`Quot.sound` 1（不合格）**。propext 38 件は許容。187 宣言を走査、exit 0、一時ファイルは削除済み。
- **Lean モジュール変更: なし**（12 モジュール＋Spec/Tests は読み取り専用）。書き換えたのは本ファイルのみで、既存レビューはすべて保持。commit / push / merge / ブランチ切替は行っていない。
- 残る UNRESOLVED はいずれも pinned 原文のみでは解けない法的判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・率／定数の有理数照合・境界値反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。発見候補は確定欠陥と断定せず、上記 CONFIRMED はいずれも pinned 原文・公理出力から機械的に導けるもののみを記載した。

## Batch N review (2026-11-19)

担当: Adversarial Review Agent（形式化担当ワーカーから独立）。commit / push / merge / ブランチ切替は行わず、Lean モジュールは**一切変更していない**（読み取り専用）。書き込みは `docs/ADVERSARIAL_REVIEW.md` のみ。

### N-0. レビュー対象と方法

| 項目 | 内容 |
|---|---|
| 対象 impl | `JapanTaxLaw/PublicPensionWithholding.lean`（所得税法 art. 203の3）／`JapanTaxLaw/SpecialLandHoldingTax.lean`（地方税法 art. 596）／`JapanTaxLaw/RetainedAmountLocalTax.lean`（法人税法施行令 art. 139の10） |
| 対象 Spec/Tests | 各 `*Spec.lean` / `*Tests.lean`（計 9 ファイル、公理監査のみ） |
| pinned 原文 | `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`／`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`／`data/raw/340CO0000000097_20261001_507CO0000000121.law.json` |
| 抽出方法 | STAGING（`STAGING_PPW` / `STAGING_SLH` / `STAGING_RALT`）の数値・needle 申告は**信じず**、pinned JSON の `law_full_text` を Python で直接平坦化・正規化して率・文字列を再抽出。needle 文字列は CI 実装 `scripts/ci/transcription_audit.py` の `checks()` を import して取得（手打ちしない）。率は `Fraction`、反例は Nat の saturating 減算として独立再計算。 |
| 実行 | Python 3（`python -X utf8`）＋ `lake env lean`（`#print axioms`、exit 0 / error 0） |

### N-1. 原文からの独立抽出（pinned JSON 直接）

**N-1-a. 所得税法 art. 203の3**（ArticleTitle `第二百三条の三`、正規化本文 2,299 文字）冒頭を逐語抽出:

> （徴収税額）第二百三条の三前条の規定により徴収すべき所得税の額は、公的年金等の金額から、次の各号に掲げる公的年金等の区分に応じ当該各号に定める金額を控除した残額に**百分の五**（第三号又は第六号に掲げる公的年金等の当該残額が**十六万二千五百円**に当該公的年金等の金額に係る**月数**を乗じて計算した金額を超える場合におけるその超える部分の金額及び第七号に掲げる公的年金等の当該残額については、**百分の十**）の税率を乗じて計算した金額とする。

- 出現回数: `百分の五` = 1、`百分の十` = 1、`十六万二千五百円` = 1。第一号〜第七号まで存在し、税率区分は「第一・二・四・五号＝5%／第三・六号＝5%＋超過分10%／第七号＝10%」。Lean の 3 区分 Bool 選択（`isSeventh` / `isThirdOrSixth` / その他）は全 7 号を漏れなく被覆。
- 各号控除額は原文に実在し、Lean の doc-comment 列挙と**一字一句一致**: 政令月割額×25%＋75,000 円と100,000 円のいずれか多い額／障害者 22,500・特別障害者 35,000／寡婦 22,500・ひとり親 30,000／源泉控除対象配偶者 32,500・老人 40,000／源泉控除対象親族 32,500・特定扶養親族及び特定親族 52,500・老人扶養親族 40,000／同一生計配偶者・扶養親族の障害者 22,500・同居特別障害者 62,500・その他特別障害者 35,000／第七号は公的年金等の金額の 25%。これらは `netAmount`（caller-established の控除後残額）に吸収され、**NOT MODELLED** が正しい。

**N-1-b. 地方税法 art. 596**（第五百九十六条、正規化本文 480 文字）:

> 一 …同条第二項第一号の課税標準額に**第五百九十四条の税率**を乗じて得た額から、**当該額を限度として**、…固定資産税の課税標準となるべき価格に**百分の一・四**を乗じて得た額の合計額を控除した額
> 二 …（同条第二項第二号又は第三号）…不動産取得税の課税標準となるべき価格（…政令で定める額）に**百分の四**を乗じて得た額の合計額を控除した額

- `第五百九十四条の税率` = 2、`当該額を限度として` = 2、`百分の一・四` = 1、`百分の四` = 1、`政令で定める額` = 1。art. 594 は別条文の税率表であり、本モデルが `taxRate : TaxRate` を caller-established で受け取るのは原文構造と整合。
- 「当該額を限度として」＝税額を上限とする `min` 構造を直接支持。1.4%＝14/1000、4%＝4/100 のリテラルを確認（14/100＝140% あるいは 4/1000 という 10 倍誤りは原文に不存在）。

**N-1-c. 法人税法施行令 art. 139の10**（第百三十九条の十、第1項括弧内まで抽出）:

> 法人税額から当該法人税額に係る**税額控除額**を控除した金額に**百分の十・四**を乗じて計算した金額（…特定寄附金…当該特定寄附金の額（当該事業年度の所得の金額の計算上**損金の額に算入されるものに限る**。）の合計額の**百分の四十**に相当する金額と**調整地方税額**（当該計算した金額に次項第二号イ…百分の十・四…を加算した金額から同項第一号イ…百分の十・四…を控除した金額をいう。）に**百分の二十**を乗じて計算した金額とのうち**いずれか少ない金額**を控除した金額）

- `百分の十・四` = 3、`百分の四十` = 1、`百分の二十` = 1、`いずれか少ない金額` = 1、`調整地方税額` = 1、`税額控除額` = 2、`損金の額に算入されるものに限る` = 1。
- 10.4%＝104/1000（1040/1000＝104% の 10 倍誤りは原文に不存在）。min(寄附金×40%, 調整地方税額×20%) と「少ない金額を控除」が一致。調整地方税額の算定定義は原文に存在するが第2項細目依存のため caller-established、損金限定も caller-established が妥当。

### N-2. 最重要チェック 3 点の独立判定

| # | チェック | 原文抽出値 | Lean 定数／構造 | 判定 |
|---|---|---|---|---|
| 1 | art. 203の3 基本 5%／超過・第七号 10%／閾値 162,500×月数 | 百分の五・百分の十・十六万二千五百円×月数（各 1 回） | `pensionWithholdingBasicRate=⟨5,100⟩`、`ExcessRate=⟨10,100⟩`、`pensionExcessThresholdUnit=162_500`、`excessThreshold m = 162500*m`、超過分は saturating | **CONFIRMED（原文どおり）**。各号控除額は全件 NOT MODELLED が妥当（N-1-a）。 |
| 2 | art. 596 一号 14/1000、二号/三号 4/100、min 構造 | 百分の一・四／百分の四／当該額を限度として | `fixedAssetDeductionRate=⟨14,1000⟩`、`realEstateDeductionRate=⟨4,100⟩`、`tax − min tax (dedRate×base)` | **CONFIRMED（原文どおり、10 倍過大でない）**。 |
| 3 | art. 139の10 104/1000、min(40%,20%)、saturating、Option | 百分の十・四／百分の四十／百分の二十／いずれか少ない金額 | `localTaxBaseRate=⟨104,1000⟩`、`donationFortyRate=⟨40,100⟩`、`twentyRate=⟨20,100⟩`、`min`＋saturating、`Option Money` で該当性 | **CONFIRMED（原文どおり、10 倍過大でない）**。 |

3 点とも率和構造は原文と完全一致し、**桁違い（10 倍）バグは検出されなかった**。`Fraction` による独立有理数照合も 8 項目すべて `OK=True`（0.05 / 0.1 / 162500 / 0.014 / 0.04 / 0.104 / 0.4 / 0.2）。

### N-3. needle 健全性（CI 実装を直接検証）

`transcription_audit.py` の `checks()` から 3 check を抽出し、pinned 正規化テキスト（`re.sub(r"[\s　]+","",…)`、CI と同一条件）に `.find()` / `.count()` を実行。STAGING の「FOUND」申告は信じていない。

| 監査項目 | 結果 |
|---|---|
| check 数 | 3（203の3 / 596 / 139の10） |
| needle 総数 | **18**（PPW 8 ／ SLH 5 ／ RALT 5）— 指定どおり |
| U+3000（全角空白）を含む needle | **0 件** |
| FOUND | **18/18**（MISS **0**） |
| 正規化本文長 | PPW 1,095,718 ／ SLH 2,355,516 ／ RALT 1,184,229 文字 |
| `.count()` | 17 本は 1。**SLH の 1 本**（`当該不動産取得税の課税標準となるべき価格として政令で定める額`）はファイル全体で 3。**ただし art. 596 本文内では count 1** であり、残り 2 件は他条文からの参照。CI の `contains()` は存在のみを要求するため欠陥ではない。 |

- offset（正規化）: PPW = 219912 / 219972 / 220017 / 220213 / 220277 / 220360 / 221470 / 222097。SLH = 746768 / 746848 / 746938 / 747195 / 747226。RALT = 459553 / 459608 / 459856 / 459917 / 460032。
- needle 4〜8（PPW）は各号控除額・該当性の原文保持であり、NOT MODELLED 判定の根拠（欠落ではない）。

**needle 健全性: 問題なし（18/18 FOUND、U+3000 0 件、MISS 0）。**

### N-4. 反例探索（境界値・min 両側・端数）

pinned 原文から導いた整数式を Python で独立再計算（Nat 減算は saturating として扱い、負数は出さない）。下表はすべて Lean モジュールの `example := by decide` と一致、**矛盾 0 件**。

| モジュール | 境界ケース | 独立再計算 | Lean の例 |
|---|---|---|---|
| PPW | 閾値ちょうど `162500, m=1` | 5% 分 8,125＋超過 0 = **8,125** | `= 8125` ✓ |
| PPW | 閾値+1 円 `162501, m=1` | 8,125＋floor(1×10%)=0 → **8,125**（1 円の超過は切り捨てで 0） | `= 8125` ✓ |
| PPW | 超過 `1162500, m=1` | 8,125＋100,000 = **108,125** | `= 108125` ✓ |
| PPW | `m=0` → 閾値 0、`100000` | 超過分 10% のみ = **10,000** | `= 10000` ✓ |
| PPW | 残額 < 閾値 `1, m=1` | saturating で超過 0 → **0**（5% も切り捨て） | 同種の例と整合 |
| SLH | 控除 ≥ 税額 | `min` が税額を選択 → 結果 **0**（アンダーフローなし） | `landHoldingTax_eq_zero_of_deduction_ge_tax` ✓ |
| SLH | 控除 0 | 結果 = 税額そのもの | `landHoldingTax_zero_deduction` ✓ |
| SLH | min 両側・端数 `taxRate=103/1000, base=3000, 4%, dedbase=500` | tax=309, ded=20 → **289** | グリッド `slhCheckGrid` が同期を確認 |
| RALT | min 両側 `1000/1000` → 20% 側、**`1000/10000` → 40% 側** | **200 / 400** | `= 200 / = 400` ✓ |
| RALT | 基本 10400 − 調整 200 / 400 | **10200 / 10000** | `= 10200 / = 10000` ✓ |
| RALT | 調整 > 基本 → saturating **0**（還付は射程外） | **0** | `= 0` ✓ |
| RALT | `none` → 基本のみ、`base 1000 → 104`（1040/1000 なら 1040） | **104** | `= 104` ✓ |

### N-5. 条件漏れ（NOT MODELLED）の妥当性

| 対象 | 原文根拠 | 扱い | 判定 |
|---|---|---|---|
| art. 203の3 各号控除額・政令月割額（N-1-a の全額） | 原文に実在するが政令依存・該当性判定を伴う | `netAmount` / `months` / 区分 Bool を caller-established とし NOT MODELLED | **BY-DESIGN（妥当）** |
| art. 203の3 前条手続・復興特別所得税附帯徴収・納付期限 | 本条の税率算術ではない | NOT MODELLED | **BY-DESIGN** |
| art. 596 art. 594 税率 | 別条文（税率表） | `taxRate` パラメータ（caller-established） | **BY-DESIGN** |
| art. 596 課税標準価格・政令額・該当区分 | 当該価格は納税者ごとの確定値 | `Money` / 選択を caller-established | **BY-DESIGN** |
| art. 596 「合計額」の集約 | 原文は複数土地の (価格×率) の和 | caller が集約した価格 1 件に率を 1 回適用（集約後切り捨て）と明記 | **UNRESOLVED（U-N2）**: 個別土地ごと切り捨てとの差（数円）の法的扱いは機械的照合では確定できない |
| art. 139の10 調整地方税額の算定 | 原文に定義が存在するが第2項細目依存 | caller-established `adjustedLocalTax`、NOT MODELLED | **BY-DESIGN（妥当）** |
| art. 139の10 特定寄附金の損金算入限定・該当性 | 原文に限定が存在 | `Option Money`（Bool を金額式に入れない）＋ caller-established | **BY-DESIGN（妥当）** |
| 3 モジュールの丸め | 原文は「乗じて計算した金額」で本条に丸め規定なし | `TaxRate.applyFloor`（切り捨て）を明示的 modeling choice として採用 | **UNRESOLVED（U-N1）**: 法的に正しい丸め単位かは人間の専門判断待ち |

### N-6. 公理監査

9 モジュールの名前付き `def` / `theorem` / `structure` 計 **78 宣言**（PPW 20 + Spec 7、SLH 11 + Spec 7、RALT 27 + Spec 6、Tests 3 ファイルは名前付き宣言なし）すべてに `#print axioms` を実行（一時 Lean ファイルを temp に作成、`lake env lean` exit code **0**、error **0**）。監査後、一時ファイルは削除済み。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **78** |
| axiom-free（`does not depend on any axioms`） | **66** |
| `Classical.choice`（choice） | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext`（許容） | **12 件**: `PPW.pensionWithholdingTax_mono` / `SLH.landHoldingTax_deduction_le_tax` / `SLH.landHoldingTax_zero_deduction` / `RALT.baseLocalTax_le` / `_mono` / `_mul_thousand` / `_pos` / `RALT.specialDonationAdjustment_le_donation` / `_le_twenty` / `_eq_twenty_when` / `_zero_of_donation_zero` / `RALT.retainedAmountLocalTax_zero_of_over`。いずれも `simp` / Nat 補題由来の**許容範囲**。 |
| コード部の `sorry` / `admit` / `axiom` / `unsafe` / `Classical.choice` 実使用 | **0 件**（9 ファイル、コメント除去後に grep） |

→ **禁止公理（choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### N-7. CONFIRMED / BY-DESIGN / UNRESOLVED の件数

| 分類 | 件数 |
|---|---|
| **CONFIRMED**（原文との食い違い） | **0（ゼロ）** |
| **BY-DESIGN**（明示的スコープで妥当） | **11** |
| **UNRESOLVED**（人間の法的判断待ち） | **2**（U-N1 丸め、U-N2 合計額の集約切り捨て） |

**ゼロを明示する。** 率・閾値・min 構造・saturating 控除・needle・公理・反例のいずれにも pinned 原文との食い違いは検出されなかった。件数を手柄にしない。

BY-DESIGN 11 件: 203の3 各号控除額／203の3 政令月割額／203の3 月数・区分 Bool／203の3 前条手続等／596 art.594 税率／596 価格・政令額・区分／596 政令で定める額の適用判断／139の10 調整地方税額算定／139の10 損金限定・該当性 Option／139の10 saturating（還付なし）／3 モジュールの floor を modeling choice として開示したこと。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・`Fraction` での率照合・Nat 整数式の反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断（特に U-N1 / U-N2）は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

### N-8. 最終報告（まとめ）

- **判定**: CONFIRMED **0（ゼロ）** ／ BY-DESIGN **11** ／ UNRESOLVED **2**。3 点の最重要チェックはいずれも **CONFIRMED（原文どおり）** で、10 倍桁違いバグなし。
- **needle**: **18/18 FOUND**、U+3000 **0**、MISS **0**（1 本はファイル全体で count 3 だが art. 596 内では count 1、欠陥ではない）。
- **公理**: choice / sorryAx / Quot.sound とも **0**、propext 12（許容）、78/78 宣言走査・exit 0。
- **反例**: 境界・min 両側・端数・saturating の全ケースで Lean `by decide` と一致、矛盾 **0**。
- **追記**: `docs/ADVERSARIAL_REVIEW.md` に見出し `## Batch N review (2026-11-19)`（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に一致）を末尾追記。既存セクションはすべて保持。Lean モジュールの変更なし。


---

## Batch O review (2026-11-19)

### O-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent（形式化担当 3 ワーカーから独立）。STAGING／doc-comment は参照したが、**その正否は信じず**、pinned JSON から Python で直接再抽出して照合した。
- **対象モジュール（読み取り専用・本レビューで一切変更していない）**:
  - `JapanTaxLaw/IncomeArt213Withholding.lean`（所得税法 art. 213）
  - `JapanTaxLaw/LocalAddedValueStandard.lean`（地方税法 art. 72の20）
  - `JapanTaxLaw/LocalGrantRevenueBase.lean`（地方交付税法 art. 14）
  - および各 `*Spec.lean` / `*Tests.lean`（計 9 ファイル、すべて読み取り専用）
- **一次資料（pinned・改変禁止）**:
  - `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`（revision `340AC0000000033_20261001_507AC0000000070`、適用日 2026-10-01、sha256 `94C4A7AD…FE606B` を実ファイルで再計算し一致確認）
  - `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`（revision `325AC0000000226_20261101_508AC0000000002`、適用日 2026-11-01）
  - `data/raw/325AC0000000211_20261102_508AC0000000062.law.json`（revision `325AC0000000211_20261102_508AC0000000062`、適用日 2026-11-02）
- **抽出方法**: `law_full_text` を CI `transcription_audit.py` の `text()` と同一ロジックで平坦化し、`re.sub(r"[\s　]+", "", …)` で正規化。`MainProvision` 配下を再帰走査して `Article` を `Num` 属性で特定（art. 213 → `Num=213`、art. 72の20 → `Num=72_20`、art. 14 → `Num=14`）。率は日本語数字（二十／十／七十／七十五 等）を自前の `kansuji()` で Arabic に変換して抽出。
- **ツール**: Python 3.12 直接再抽出＋`lake env lean`（`#print axioms` 79 宣言／独立反例 56 行、いずれも exit code 0）。
- **書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。既存の Batch G〜M／Art.25／国税徴収法／Art.24／Batch N レビューは**すべて保持**。Lean モジュール・Spec・Tests・`data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。監査用一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、repo 外。`git status --short` はクリーン。

### O-1. 独立抽出結果（pinned 原文 → 算術 → Lean 定数）

正規化後本文長: art. 213 = 782 文字、art. 72の20 = 469 文字、art. 14 = 4,982 文字。日本語数字を自前変換した `百分の…` 出現は art. 213 が `{20:2, 10:2, 15:2}`、art. 72の20 が `{70:2}`、art. 14 が `{75:26}`（他は全て 75%）。pinned 原文に 750/100 や 7.5 相当の語は存在しない。

| 条 | 原文キーフレーズ（逐語・要所） | 独立抽出値 | Lean 定数／定義 | 照合 |
|---|---|---|---|---|
| 213 一号 | 「…その金額（…）に**百分の二十**の税率を乗じて計算した金額」 | 20/100 | `art213GeneralRate = ⟨20,100⟩` | ✅ |
| 213 一号イ | 「…**五万円にその支払われる年金の額に係る月数を乗じて**計算した金額を控除した残額」 | 50,000 × 月数 | `pensionDeduction months = 50_000 * months` | ✅ |
| 213 一号ロ | 「…から**五十万円を控除した残額**」 | 500,000 | `prizeDeduction = 500_000` | ✅ |
| 213 一号ハ | 「…**保険料又は掛金の額のうちその支払われる年金の額に対応するものとして政令で定めるところにより計算した金額を控除した残額**」 | 政令委任（算定式なし） | `art213Pension14Base annuity premiumCorrespondingAmount = annuity - …`／額は caller-established | ✅（NOT MODELLED 申告どおり） |
| 213 二号 | 「第百六十一条第一項第五号に掲げる国内源泉所得その金額に**百分の十**の税率を乗じて計算した金額」 | 10/100 | `art213ReducedRate = ⟨10,100⟩` | ✅ |
| 213 三号／二項 | 「…**百分の十五**の税率…」「前条第三項の規定により…」 | 15%／二項あり | 範囲外として NOT MODELLED | ✅（申告どおり） |
| 72の20 1項 | 「…報酬給与額の占める割合が**百分の七十を超える**法人…」 | 厳密 `>` | `salaryRatioExceeds70 = decide (salary*100 > 70*distribution)` | ✅ |
| 72の20 1項 | 「付加価値額（前条の規定により控除すべき金額があるときは、これを控除した後の金額とする。）から**雇用安定控除額を控除**するものとする。」 | 付加価値額 − 控除 | `addedValueStandard = addedValue - deduction` | ✅ |
| 72の20 2項 | 「報酬給与額から当該事業年度の**収益配分額に百分の七十の割合を乗じて得た金額を控除した金額**とする。」 | 報酬 − 収益配分×70% | `employmentStabilityDeduction = salary - distribution*70/100` | ✅ |
| 72の20 3項 | 「…**政令で定めるところにより計算した金額をもつて**…みなす。」 | 政令委任 | NOT MODELLED（needle で原文保持） | ✅ |
| 14(1) 利子割 | 「利子割交付金の交付見込額の**百分の七十五に相当する額を控除した額**」 | 75/100 | `grantDeductionRate = ⟨75,100⟩`／`netRevenue e g = e - g*75/100` | ✅ |
| 14(1) 配当割 | 「…配当割に係る交付金（以下…「配当割交付金」という。）の交付見込額の**百分の七十五に相当する額を控除した額**」 | 75/100 | 同上（共通関数を呼ぶ） | ✅ |
| 14(1) 株式等 | 「…株式等譲渡所得割交付金…の交付見込額の**百分の七十五に相当する額を控除した額**」 | 75/100 | 同上（共通関数を呼ぶ） | ✅ |
| 14 他税目・経過 | 法人事業税交付金／地方消費税／ゴルフ場／軽油／市町村たばこ税／基準税率 75%／第三項算定基礎表／附則 | 範囲外 | NOT MODELLED（doc-comment 明示） | ✅ |

### O-2. 最重要チェック 3 点の独立判定

1. **art. 213 — CONFIRMED（忠実）**: 原文で一号 `百分の二十`・二号 `百分の十` を直接確認。年金控除は `五万円 × 月数`、賞金控除は `五十万円` で、Lean の `pensionDeduction` / `prizeDeduction` と一致。一号ハの「保険料対応額」は原文が「政令で定めるところにより計算した金額」と委任するだけで算定式が無く、**NOT MODELLED ＋ caller-established `Money` パラメータ**という扱いは妥当。第 161 条各号・ロ／ハの該当性判定も原文に算術が無く、Bool を分岐条件に閉じ込める設計と整合。三号（15%）・二項は pinned 原文に**実際に存在**し、範囲外として申告されている（過剰な省略ではない）。
2. **art. 72の20 — CONFIRMED（忠実）**: 原文は「割合が百分の七十を**超える**」で、**「以上」ではなく厳密不等式**。原文に `百分の七十以上` は存在せず、`salaryRatioExceeds70` は交差掛け `salary * 100 > 70 * distribution` の strict `>`（70% ちょうど → false、70% 超 → true）。2 項の雇用安定控除も原文「報酬給与額から収益配分額に百分の七十の割合を乗じて得た金額を控除した金額」＝ `salary - distribution*70/100` と一致。3 項の政令みなし額は算定内容が原文に無く **NOT MODELLED が妥当**。
3. **art. 14 — CONFIRMED（忠実・10 倍過大なし）**: 原文「百分の七十五」を自前 kansuji 変換で 75 と抽出、`grantDeductionRate = ⟨75,100⟩`（= 0.75）と一致。`netRevenue` は「収入見込額 − 交付金見込額×75%（floor）」の saturating 減算で原文構造どおり。750/100（= 7.5）や「七百五十」は原文にも Lean にも無く、**10 倍誤りは検出されず**。他税目・経過措置・附則の NOT MODELLED も申告と整合。

→ **3 点すべて原文に忠実で、食い違いは検出されなかった（発見ゼロ）。**

### O-3. needle 健全性（14 本を CI 実装から直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、3 対象モジュールに対応する **3 check** から needle 文字列を取得（手打ちせず、STAGING の申告も信じない）。pinned `law_full_text` の正規化テキスト（`_norm()`、CI と同一条件）に対して `.find()` / `.count()` を実行した。

| check | needle 数 | 長さ | U+3000 | `.find()` | `.count()` | 主な offset |
|---|---:|---|---|---:|---|---|
| 所得税法 art. 213 ↔ `IncomeArt213Withholding.lean` | **6** | 62/88/79/90/118/70 | 0 | 6/6 FOUND | 全て 1 | 231087 / 231147 / 231235 / 231314 / 231404 / 231497 |
| 地方税法 art. 72の20 ↔ `LocalAddedValueStandard.lean` | **5** | 66/71/66/111/104 | 0 | 5/5 FOUND | 全て 1 | 239445 / 239511 / 239583 / 239650 / 239761 |
| 地方交付税法 art. 14 ↔ `LocalGrantRevenueBase.lean` | **3** | 77/117/130 | 0 | 3/3 FOUND | 全て 1 | 21015 / 21118 / 21266 |
| **合計** | **14** | — | **0 件** | **14/14 FOUND** | **全て 1** | — |

- **needle 健全性: 問題なし（14/14 FOUND、U+3000 0 件、MISS 0、すべて count 1）。**
- 14 本はいずれも各条の率・控除・判定・委任規定を逐語保持しており、O-1 のキーフレーズ抽出と整合（例: 一号ハ needle は doc-comment の省略形ではなく原文の完全形「保険料又は掛金の額のうち…政令で定めるところにより計算した金額を控除した残額」）。

### O-4. 反例探索結果

独立参照モデルを Python で実装し、同じ期待値を一時 Lean ファイルの `example … := by decide` として記載（`lake env lean` exit code **0**、エラーなし、**56 行**すべてパス）。さらに総当たり grid で等価性を走査した。

| 攻撃対象（入力） | 独立期待値 | Lean | 結果 |
|---|---|---|---|
| art. 213 一号 20% / 二号 10%（9 円で端数） | `9*20/100=1` / `9*10/100=0` | ✅ | 一致 |
| 年金控除 **月数 0** (`amount=1000, m=0`, 一号イ) | 控除 0 → `200` | ✅ | 一致 |
| 年金控除 **月数 1** で控除>金額 (`1000, m=1`) | `1000-50000` → saturating **0** | ✅ | 一致（初回の手計算ミス 190 を検出・修正、実装は正しかった） |
| 年金控除 通常 (`1,000,000, m=12`) | `400,000*20%=80,000` | ✅ | 一致 |
| 賞金控除 50 万ちょうど／境界 (`500000`, `500001`) | `0` / `1*20%=0`（1 円は floor で 0） | ✅ | 一致 |
| 控除>課税標準 (一号ハ `250000` vs `250001`) | saturating **0** | ✅ | 一致 |
| **70% ちょうど** (`d=100,s=70` / `1000,700`) | false | ✅ | 一致（「超える」） |
| **70% 超** (`d=100,s=71` / `1000,701`) | true | ✅ | 一致 |
| `d=0,s=0` / `d=0,s=1` | false / true（totalize、下記 U-O2） | ✅ | 停止・一致 |
| 2 項 端数 (`d=101,s=71`) / 控除>報酬 (`d=100,s=10`) | `1` / **0** | ✅ | 一致 |
| 課税標準 控除>付加価値 (`50,100`) | saturating **0** | ✅ | 一致 |
| **75% 端数** (`applyFloor 100/101/1`) | `75 / 75 / 0` | ✅ | 一致（750 ではない） |
| 75% 控除境界 `netRevenue 74/75/76, g=100` | `0 / 0 / 1` | ✅ | 一致 |
| `netRevenue 1000,100` / `101,100` | `925` / `26` | ✅ | 一致 |

Grid 走査（Python）:

- `salaryRatioExceeds70` の交差掛け vs 厳密分数 `salary/distribution > 70/100`（`d>0`, `d,s ∈ 0..400`）: **160,400 件、不一致 0**。
- 70% 丸め同一性 `d*70/100 == d*7/10 == floor(0.7d)`（`d ∈ 0..2000`）: **不一致 0**。
- 75% 乗法順序 `g*75/100 == 75*g/100` と saturating 単調性（`grid 0..300`）: **不一致 0**。
- 10 倍トラップ: `applyFloor(100)=75`（誤りなら 750）→ **10 倍過大なし**。

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

### O-5. 公理監査結果

一時 Lean ファイルに 9 ファイル中の名前付き `def`/`theorem`/`structure`/`lemma` のうちアクセス可能な **79 宣言**の `#print axioms` を記載し、`lake env lean`（exit code **0**、エラー 0）で走査。`/ JapanTaxLaw` 配下の 9 対象ファイルに `sorry` / `admit` / `axiom` / `unsafe` / `Classical.choice` / `propext` / `Quot.sound` の文字列はgrep で **0 件**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **79**（IncomeArt213 34＋Spec 8、LocalAddedValue 9＋Spec 6、LocalGrant 14＋Spec 9、Tests 3 ファイルは名前付き宣言なし。`private natSubEqZeroOfLeFree` は inaccessible のため除外） |
| axiom-free（`does not depend on any axioms`） | **73** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **6 件**: `IncomeArt213Withholding.art213Item1Base_pension12` / `_prize13` / `_pension14` / `_general`、`LocalAddedValueStandard.salaryRatioExceeds70_true_iff`、`LocalGrantRevenueBase.netRevenue_eq_zero_of_deduction_ge`（いずれも `simp`／Nat 不等式由来、許容範囲） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### O-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED**（原文との食い違い） | **0（ゼロ）** |
| **BY-DESIGN**（申告済みの範囲設定・ modeling choice） | **14** |
| **UNRESOLVED**（pinned 算術原文のみでは解けない法的判断） | **3** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 率・算術・厳密不等式・saturating・needle・公理・反例のいずれにも原文との食い違いは検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 一号 20% / 二号 10%、5 万×月数、50 万控除 — すべて原文どおり（O-1／O-2）。
- 「70% 超」の strict `>` と、`以上` でないこと — 原文どおり（O-2）。
- 雇用安定控除 = 報酬 − 収益配分×70%、課税標準 = 付加価値 − 控除 — 原文どおり（O-2）。
- 「百分の七十五」= 75/100、控除後 = 収入見込 − 交付金×75%（saturating）、10 倍過大なし — 原文どおり（O-2／O-4）。
- needle 14/14 FOUND、U+3000 0、禁止公理 0、反例矛盾 0（O-3〜O-5）。

#### BY-DESIGN（14 件）

- **B-O1** art. 213 の号・区分（一号/二号、イ/ロ/ハ）該当性は caller-established Bool、金額式には入れない。
- **B-O2** 一号ハの保険料対応額（政令で定める額）は算定式が原文に無く NOT MODELLED／caller-established `Money`。
- **B-O3** 第 161 条各号・ロ／ハの該当性判定は原文に算術が無く NOT MODELLED。
- **B-O4** 賞金の金銭以外の価額算定（政令）は NOT MODELLED／caller-established。
- **B-O5** art. 213 第一項三号（15%）・第二項は範囲外として NOT MODELLED（原文には存在）。
- **B-O6** 課税標準・月数・租税条約軽減・端数処理（通則法 118/119）・復興特別／防衛特別所得税・確定申告調整は NOT MODELLED。
- **B-O7** art. 72の20 の前条控除額・付加価値額・報酬給与額・収益配分額・70% 超該当性は caller-established。
- **B-O8** art. 72の20 3項の政令みなし額は NOT MODELLED（needle で原文保持）。
- **B-O9** 70% 超判定を交差掛け `salary*100 > 70*distribution` で totalize（`distribution=0` でも停止）。
- **B-O10** art. 72の20 2項の 70% を `distribution*70/100`（自然数除算・切り捨て）で符号化（doc-comment 明示）。
- **B-O11** art. 14 の基準税率・収入見込額・交付金見込額・該当性は caller-established。
- **B-O12** art. 14 の他税目・控除（法人事業税交付金の算定、地方消費税・ゴルフ場・軽油・市町村たばこ税の 75% 控除、市町村たばこ税都道府県交付金／特別法人事業譲与税の「75% の額」、各種譲与税・国有資産等所在交付金、基準税率自体、第三項算定基礎表）は NOT MODELLED。
- **B-O13** art. 14 の経過措置・附則は NOT MODELLED。
- **B-O14** 丸めを `TaxRate.applyFloor`（切り捨て）に委ね、3 モジュール＋Spec で一貫（原文に丸め細目の明記なし、O-5 の U-O1 で法的判断を保留）。

#### UNRESOLVED（3 件）

- **U-O1 端数処理の法的妥当性**: 原文は art. 213「税率を乗じて計算した金額」、art. 72の20「乗じて得た金額」、art. 14「相当する額」とし、丸め単位・方向の明記がない。モデルは `applyFloor`／Nat 除算（切り捨て）を採用し Spec も一致するが、法律上求められる丸め（切捨て／切上げ／四捨五入）は pinned 算術原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。
- **U-O2 `distribution=0` での 70% 超判定**: 交差掛けは `distribution=0, salary>0` を「70% 超＝true」と totalize する（doc-comment 明示、停止性は確認済み）。しかし原式「収益配分額のうちに報酬給与額の占める割合」は分母 0 で定義されず、この特例をどう扱うかは原文のみでは解けない。実務上は caller が `distribution>0` を認定する想定だが、完全性の判断は保留。**人間の法律専門家によるレビューを要する**。
- **U-O3 NOT MODELLED スライスの法的十分性（政令委任事項）**: 一号ハ保険料対応額・賞金現物価額・art. 72の20 3項政令みなし額・art. 14 他税目／経過措置は、いずれも pinned 原文に算定内容が無いため NOT MODELLED は範囲設定として整合する。ただし政令の実際の算定を別途モデル化すべきか、また本スライスで実務を十分に被覆しているかは法解釈の問題であり、pinned 算術原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。

### O-7. 総合判定・最終報告（サマリ）

- 原文（3 pinned revision）の `law_full_text` から直接抽出した率・控除・算術を照合し、3 モジュールのモデルは **いずれも原文に忠実**と独立判定した。一号 20%／二号 10%、5 万×月数・50 万控除、「70% 超」の厳密不等式、報酬−配分×70%、75/100 控除（saturating）のすべてが一致し、**10 倍誤りは無い**。
- 一号ハの保険料対応額・第 161 条該当性、3 項政令みなし額、art. 14 の他税目／経過措置は **NOT MODELLED / caller-established と正しく扱われている**（O-2／O-6）。
- **CONFIRMED: 0 件（ゼロ）**／**BY-DESIGN: 14 件**／**UNRESOLVED: 3 件**。発見ゼロを明示する。
- **needle 健全性**: U+3000 **0 件**、CI 実装の **14/14 FOUND**（MISS 0、すべて count 1）。
- **反例探索**: 月数 0／70% ちょうど・超／控除>課税標準／75% 端数を含む 56 行（`lake env lean` exit 0）＋grid 163,000 件超で矛盾 **0 件**。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 6 件（許容）。79/79 宣言を走査、exit code 0。
- **書き換え**: `docs/ADVERSARIAL_REVIEW.md` に本セクション `## Batch O review (2026-11-19)`（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に一致）を追記。既存セクションはすべて保持。Lean モジュール変更なし。commit / push / merge / ブランチ切替なし。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前 kansuji による率抽出・原文照合・整数式の grid／カーネル反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断（U-O1／U-O2／U-O3）は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

## Batch P review (2026-11-19)

### P-0. 範囲・独立性の申告

- **レビュア役割**: Adversarial Review Agent。形式化担当 3 ワーカーから独立。STAGING／doc-comment は参照したが、**その正否は信じず**、pinned JSON から Python で直接再抽出し、CI `transcription_audit.py` の needle を直接 import して照合した。
- **対象モジュール（読み取り専用・本レビューで一切変更していない）**:
  - `JapanTaxLaw/BusinessOwnerDeduction.lean`（地方税法 art. 72の49の14）
  - `JapanTaxLaw/StandardRateExcessRatio.lean`（地方税法施行令 art. 35の4の6）
  - `JapanTaxLaw/IntermediateSurchargeRefund.lean`（地方税法施行令 art. 26）
  - および各 `*Spec.lean` / `*Tests.lean`（計 9 ファイル、すべて読み取り専用）
- **一次資料（pinned・改変禁止、SHA-256 を実ファイルで再計算）**:
  - `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`（地方税法、revision `325AC0000000226_20261101_508AC0000000002`、sha256 `3DD29E00…68D53`）
  - `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`（地方税法施行令、revision `325CO0000000245_20261101_508CO0000000083`、sha256 `9BC03B23…B17`）
- **抽出方法**: `law_full_text` を CI `text()` と同一ロジック（辞書の `children` 再帰連結）で平坦化し、`re.sub(r"[\s　]+", "", …)` で正規化。`MainProvision` 配下の `Article` を `Num` 属性で特定（art. 72の49の14 → `Num=72_49_14`、art. 35の4の6 → `Num=35_4_6`、art. 26 → `Num=26`）。日本語数字は原文の漢字をそのまま比較し、`二百九十万 = 290 × 10,000` として独立に算定。
- **ツール**: Python 3.12 直接再抽出＋`lake env lean`（`#print axioms` 56 宣言／独立反例 28 行、いずれも exit code 0）。
- **書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。既存の Batch G〜O／Art.25／国税徴収法／Art.24 レビューは**すべて保持**。Lean モジュール・Spec・Tests・`data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。監査用一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、repo 外。

### P-1. 独立抽出結果（pinned 原文 → 算術 → Lean 定数）

正規化後本文長: art. 72の49の14 = 186 文字、art. 35の4の6 = 833 文字、art. 26 = 471 文字（STAGING の申告長と一致）。原文キーフレーズの出現を Python `.find()` / `.count()` で直接確認した。

| 条 | 原文キーフレーズ（逐語・要所） | 独立抽出値 | Lean 定数／定義 | 照合 |
|---|---|---|---|---|
| 72の49の14(1) | 「事業の所得の計算上**二百九十万円を控除する**」（count 1） | 290 万 = 2,900,000 | `businessOwnerDeductionFull = 2_900_000` | ✅ |
| 72の49の14(2) | 「事業を行つた期間が**一年に満たないとき**は…**二百九十万円に…月数を乗じて得た額を十二で除して**算定した金額とする」（各 count 1） | 2,900,000 × 月数 ÷ 12（**乗算先行**） | `monthlyBusinessDeduction = full * months / 12` | ✅ |
| 72の49の14(2)  trap | 「十二で除し、これに月数を乗じ」（法人税法 art. 67(6) 型の**除算先行**）は本文に **count 0（不在）** | 除算先行ではない | 乗算先行を採用 | ✅（ trap 回避） |
| 72の49の14(3) | 「**暦に従い計算し、一月に満たない端数を生じたときは、一月とする**」（各 count 1） | 丸め規定あり | 月数は caller-established、本モデルは丸めを行わない | ✅（BY-DESIGN、下記 P-2） |
| 35の4の6(1) | 「**基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率**」（count 1） | (基準 − 相当) ÷ 基準 | `standardRateExcessRatio = if base=0 then 0 else (base-std)/base` | ✅ |
| 35の4の6(2) | 「**第一号から第三号まで及び第五号に掲げる事業税額の合計額から第四号に掲げる事業税額を控除した額**」（count 1） | sum(一号〜三号・五号) − sum(四号) | `baseBusinessTax = sumMoney amounts − sumMoney deductions` | ✅ |
| 35の4の6(3) | 「**標準税率相当額とは**…」（count 1） | 3項で定義 | 再計算は NOT MODELLED / caller-established | ✅ |
| 26 本則 | 「当該中間納付額について納付された**延滞金額に**…**の占める割合を乗じて得た金額**」（各 count 1） | 延滞金額 × 還付額 ÷ 中間納付額 | `surchargeRefund = surchargePaid * refundAmount / intermediateTotal` | ✅ |
| 26 本則 但書内 | 「**次条第一項第一号又は第二号の規定により充当される金額があるときは、これを控除した金額**」（count 1） | 充当額控除済み | `refundAmount` を控除済み入力として受け取る | ✅（caller-established） |
| 26 ただし書 | 「**第一号に掲げる金額から第二号に掲げる金額を控除した金額とする**」（count 1） | 第一号 − 第二号（saturating） | `splitRefund = amount1 − amount2` | ✅ |
| 26 二号 | 「**法の規定により計算される延滞金額の合計額**」（count 1、本条内に算定式なし） | 算定式は他条委任 | `amount2` は caller-established、算定は NOT MODELLED | ✅（BY-DESIGN） |

> 原文に存在しない算術・額の「でっち上げ」は検出されず。原文にある算術の「落とし」も検出されなかった（本則・ただし書・1項・2項すべてを写している）。

### P-2. 最重要チェック 3 点の独立判定

1. **art. 72の49の14 — CONFIRMED（忠実）**: 原文(1)「二百九十万円」を独立に `290 × 10,000 = 2,900,000` と算出し、`businessOwnerDeductionFull` と一致。(2) は「一年に満たないとき」のみ月割で、「二百九十万円に…月数を乗じて得た額を**十二で除して**」＝**乗算先行** `2,900,000 * months / 12`。法人税法 art. 67(6) の除算先行（「十二で除し、これに月数を乗じて」）に相当する文字列は本文に **0 回**で、trap を回避している。(3)「一月に満たない端数を一月とする」は原文に実在するが、本モデルは `months` を**入力として受け取り**、丸め自体は行わない。doc-comment が「caller-established（呼出側で applyFloor）」と明示しており、**丸め規定を無視したのではなく境界を正直に外に出している**と判定（BY-DESIGN・B-P1）。丸めを本スライスで実装すべきかは法解釈の問題で UNRESOLVED・U-P2 に回す。
2. **art. 35の4の6 — CONFIRMED（忠実）**: 原文(1)は「基準事業税額から標準税率相当額を控除した額を当該基準事業税額で除して算定した率」で、`(base − standard) / base` と一致。分母 0 → 0 の安全化と Nat 除算の切り捨ては原文に規定がなく **BY-DESIGN**（totalize／有限精度）。ただし原文の分数を整数除算で近似したことにより、`0 < 相当額 ≤ 基準` で比が 0 に潰れる点は doc-comment が明示しており隠蔽ではない。原文(2)は「第一号から第三号まで及び第五号…合計額から第四号…控除した額」で、`sumMoney amounts − sumMoney deductions`（一号〜三号・五号を `amounts`、四号を `deductions` に対応）と一致。控除 > 合計で 0 になる saturating も原文に丸め規定が無いため BY-DESIGN、法的妥当性は UNRESOLVED・U-P3。
3. **art. 26 — CONFIRMED（忠実）**: 本則は「延滞金額に…還付すべき金額…の占める割合を乗じて得た金額」＝ `surchargePaid * refundAmount / intermediateTotal`（割合を分子/分母ペアで表現）で一致。ただし書は「第一号に掲げる金額から第二号に掲げる金額を控除した金額とする」＝ `amount1 − amount2` で一致。二号の「法の規定により計算される延滞金額の合計額」は art. 26 自体に算定式が無く（法 72の28 等に委任）、架空の式を仮定せず `amount2` を caller-established 入力として受け取る **NOT MODELLED** は正直で妥当（BY-DESIGN・B-P14）。本則の `refundAmount` が「充当される金額があるときは、これを控除した金額」を適用済みである点も原文どおり caller-established。

→ **3 点すべて原文に忠実で、原文との食い違いは検出されなかった（発見ゼロ）。**

### P-3. needle 健全性（12 本を CI 実装から直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、3 対象モジュールに対応する **3 check** から needle 文字列を取得（手打ちせず、STAGING の申告も信じない）。pinned `law_full_text` の正規化テキスト（CI `contains()` と同一条件）に対して `.find()` / `.count()` を実行した。

| check | needle 数 | 長さ | U+3000 | `.find()` | `.count()` |
|---|---:|---|---|---:|---|
| 地方税法 art. 72の49の14 ↔ `BusinessOwnerDeduction.lean` | **3** | 39/88/38 | 0 | 3/3 FOUND | 全て 1 |
| 地方税法施行令 art. 35の4の6 ↔ `StandardRateExcessRatio.lean` | **5** | 75/62/101/38/100 | 0 | 5/5 FOUND | 4 本 1、**1 本 2** |
| 地方税法施行令 art. 26 ↔ `IntermediateSurchargeRefund.lean` | **4** | 107/145/57/162 | 0 | 4/4 FOUND | 3 本 1、**1 本 2** |
| **合計** | **12** | — | **0 件** | **12/12 FOUND** | MISS 0 |

- **needle 健全性: 問題なし（12/12 FOUND、U+3000 0 件、MISS 0）。**
- 2 本（SRER の「前項の基準事業税額とは…」、ISR の「ただし書…」）は**全文 haystack 上で count=2**。これは同施行令の市町村対応条（art. 57の2の7 等）に同一文言が並存するためで、`contains()` 監査は「≥1 回」を要求するので健全性上問題ない。STAGING が「条 leaf-text 上で count 1」と申告したことと矛盾しない（走査単位が全文か条か異なる）。needle の勝手な変更・正規化・文字変換は一切していない。

### P-4. 反例探索結果

独立 Python 参照モデルを実装し、同じ期待値を一時 Lean ファイルの `example … := by decide` として記載（`lake env lean` exit code **0**、エラーなし、**28 行**すべてパス）。さらに総当たり grid で等価性を走査した。

| 攻撃対象（入力） | 独立期待値 | Lean | 結果 |
|---|---|---|---|
| BOD **月数 0** | `2_900_000*0/12 = 0` | ✅ | 一致 |
| BOD **月数 1**（端数） | `2_900_000*1/12 = 241_666`（端数 8 を切捨て） | ✅ | 一致 |
| BOD **月数 11** | `2_658_333` | ✅ | 一致 |
| BOD **月数 12**（境界） | 月割 = 年額 = `2_900_000` | ✅ | 一致 |
| BOD **月数 13** | 分岐により年額 `2_900_000`（月割なら `3_141_666` とならない） | ✅ | 一致 |
| BOD 乗算先行 trap | `full*m/12` と `(full/12)*m` は 1〜12 月のうち **11 月で差異**（例 m=2: 483333 vs 483332）。原文は乗算先行 → impl は `full*m/12` | ✅ | 一致（除算先行でないことを確認） |
| SRER **分母 0** `(0,0)` / `(0,100)` | `0` / `0`（停止） | ✅ | 一致 |
| SRER 分子 0 `(100,100)` | `0` | ✅ | 一致 |
| SRER 控除 0 `(100,0)` | `1` | ✅ | 一致 |
| SRER **端数** `(100,1)` / `(7,3)` | `0` / `0`（切捨て） | ✅ | 一致 |
| SRER **控除>基準** `(100,200)` | saturating `0` | ✅ | 一致 |
| SRER **控除>課税標準** `baseBusinessTax [10][50]` / `[] [5]` | `0` / `0` | ✅ | 一致 |
| SRER 合計−控除 `[1,2,3,5][4]` / `[10,20,30][]` | `7` / `60` | ✅ | 一致 |
| ISR **分母 0** `(1000,300,0)` | `0`（停止） | ✅ | 一致 |
| ISR 還付額 0 / 延滞額 0 | `0` / `0` | ✅ | 一致 |
| ISR **端数** `(1000,1,3)` / `(12345,3000,10000)` | `333` / `3_703` | ✅ | 一致 |
| ISR 全額還付 `(1000,1000,1000)` | `1_000` | ✅ | 一致 |
| ISR **amount2 > amount1** `splitRefund 2000 5000` / `0 1` | saturating `0` | ✅ | 一致 |
| ISR 通常 `splitRefund 5000 2000` | `3_000` | ✅ | 一致 |

Grid 走査（Python）:

- BOD: 月数 0〜24 で単調非減 `True`、月数 ≤ 12 で月割 ≤ 年額 `True`。
- SRER: `base ∈ 0..300, std ∈ 0..300` の **90,601 点**で `0 ≤ ratio ≤ 1` 成立、`base ≤ std ⇒ ratio = 0` 成立、saturating 減算の合計順不同 `True`。
- ISR: `refundAmount` に対する単調非減、`refund ≤ total ⇒ refund ≤ surchargePaid`、`∀ a1,a2 ∈ 0..29: splitRefund ≤ a1` すべて成立。

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

### P-5. 公理監査結果

一時 Lean ファイルに 9 ファイル中の名前付き `def` / `theorem` の **56 宣言**（BOD 12+4、SRER 16+5、ISR 15+4）の `#print axioms` を記載し、`lake env lean`（exit code **0**、エラー 0）で走査。`/ JapanTaxLaw` 配下の 9 対象ファイルに `sorry` / `admit` / `axiom` / `unsafe` の文字列は grep で **0 件**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | **56** |
| axiom-free（`does not depend on any axioms`） | **36** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **20 件**（許容）: BOD 3（`monthlyBusinessDeduction_mono` / `_le_full` / `businessOwnerDeduction_le_full`）、SRER 7（`standardRateExcessRatio_zero_base` / `_eq_div` / `_self` / `_zero_of_ge` / `_le_one` / `baseBusinessTax_eq_zero_of_ge` / `_eq_amounts_of_no_deduction`）、ISR 10（`surchargeRefund_zero_denominator` / `_zero_refund` / `_zero_surchargePaid` / `_full` / `_pos` / `_mono` / `_le_surchargePaid` / `splitRefund_zero_of_le` / `_pos_of_lt` / `_zero_applied`）。いずれも `simp`／Nat 不等式由来。 |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### P-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED**（原文との食い違い） | **0（ゼロ）** |
| **BY-DESIGN**（申告済みの範囲設定・ modeling choice） | **16** |
| **UNRESOLVED**（pinned 算術原文のみでは解けない法的判断） | **5** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 額・算術・乗算先行・厳密な合計−控除構造・按分・saturating・needle・公理・反例のいずれにも原文との食い違いは検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- 290 万円、1 年未満の月割 `290万 × 月数 ÷ 12`（乗算先行）、年額/月割の分岐 — すべて原文どおり（P-1／P-2）。
- 標準税率超過率 `(基準−相当)/基準`、基準事業税額 = 一号〜三号・五号の合計 − 四号 — 原文どおり（P-1／P-2）。
- art. 26 本則の按分、ただし書の第一号−第二号、充当額控除済みの取扱い — 原文どおり（P-1／P-2）。
- needle 12/12 FOUND、U+3000 0、禁止公理 0、反例矛盾 0（P-3〜P-5）。

#### BY-DESIGN（16 件）

- **B-P1** 3項の月数丸め（「一月に満たない端数を一月とする」）は caller-established。本モデルは丸め済み月数を入力として受け取る（丸め自体は applyFloor を呼出側が実施）。
- **B-P2** 「事業を行う個人であるか」の該当性・事業所得額自体の算定は caller-established、Bool は金額式に入れない。
- **B-P3** BOD の端数は Nat 除算の切り捨て（原文に丸め単位・方向の明記なし）。
- **B-P4** BOD の確定申告・他の所得控除との調整・通則法 art. 118/119 の端数処理は NOT MODELLED。
- **B-P5** 基準事業税額・標準税率相当額・各号の事業税額・該当性はすべて caller-established。
- **B-P6** SRER の算定期間（前年度三月〜当該年度二月）および各申告書（72の25/28/29、修正申告、更正、決定）の具体的認定は NOT MODELLED。
- **B-P7** SRER 3項の標準税率相当額の再計算、4項の総務省令、「毎年度」「第四項及び次条」の定義は NOT MODELLED / caller-established。
- **B-P8** SRER 1項の分母 0 → 0（安全版 totalize）。
- **B-P9** SRER の Nat 除算（切り捨て）・有理数割合や丸め規則は NOT MODELLED（doc-comment が限于界を明示）。
- **B-P10** SRER 2項の控除超過は saturating Nat 減算で 0。
- **B-P11** 延滞金額・還付すべき金額・中間納付額・充当額・分割納付かどうかの区分は caller-established。
- **B-P12** `surchargeRefund.refundAmount` は「充当される金額があるときは、これを控除した金額」を適用済みの値として受け取る。
- **B-P13** ISR 本則の分母 0 → 0（安全版 totalize）、Nat 除算の切り捨て。
- **B-P14** art. 26 二号の「法の規定により計算される延滞金額の合計額」の算定は NOT MODELLED、`amount2` は caller-established 入力。
- **B-P15** 前条（art. 25）中間納付額還付の成立・次条（art. 27）充当の成立・法 72の44/45 の延滞金の発生と額そのものは NOT MODELLED。
- **B-P16** ただし書の saturating Nat 減算（`amount2 > amount1` → 0）、端数・分母零の退化ケースに法的意味があるとは主張しない。

#### UNRESOLVED（5 件）

- **U-P1 端数処理の法的妥当性（3 モジュール共通）**: 原文は「算定した金額」「控除した額」「乗じて得た金額」等とし、丸め単位・方向を明記しない。モデルは Nat 除算（切り捨て）を採用し Spec も一致するが、法律上求められる丸め（切捨て／切上げ／四捨五入）は pinned 算術原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。
- **U-P2 BOD 3項の丸めを caller-established としたことの十分性**: 原文は一月未満の端数を一月とする丸めを明文で要求する。本モデルは丸めを呼出側に委ねており、丸めの算定自体を実装していない。境界設定としては整合するが、本スライスで実務を十分に被覆しているか（丸めをモデル化すべきか）は法解釈の問題で pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。
- **U-P3 SRER の saturating 減算と有限精度比の法的妥当性**: 控除額が合計を超える場合の 0 丸め、および `0 < 相当額 ≤ 基準` で整数除算が比を 0 に潰す点は、原文に例外・丸め規定が無いため model 規約である。実務上許容されるかは原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。
- **U-P4 ISR 二号 NOT MODELLED の実務被覆**: 二号の延滞金額合計の算定は他条（法 72の28 等）に委任され art. 26 に算式が無いため NOT MODELLED は範囲設定として整合する。ただし実際の延滞金計算を別途モデル化すべきか、本スライスで実務を十分に被覆しているかは法解釈の問題で決定不能。**人間の法律専門家によるレビューを要する**。
- **U-P5 分母 0 の退化ケース**: SRER の基準事業税額 0、ISR の中間納付額 0 でモデルは 0 を返す（停止性は確認済み）。しかし原式は分母 0 で定義されず、この特例をどう扱うかは pinned 原文のみでは解けない。実務上は caller が分母 > 0 を認定する想定だが、完全性の判断は保留。**人間の法律専門家によるレビューを要する**。

### P-7. 総合判定・最終報告（サマリ）

- 3 つの pinned revision の `law_full_text` から直接抽出した額・算術を照合し、3 モデルはいずれも**原文に忠実**と独立判定した。290 万円・月割 `290万 × 月数 ÷ 12`（乗算先行）、`(基準−相当)/基準` と一号〜三号・五号合計 − 四号、art. 26 本則按分とただし書第一号−第二号のすべてが一致し、**原文に無い算術の捏造も原文にある算術の省略も無い**。
- 月数丸め（3項）の caller-established 化、各額・該当性の caller-established 化、二号延滞金算定の NOT MODELLED は**正しく扱われている**（BY-DESIGN・B-P1／B-P14）。
- **CONFIRMED: 0 件（ゼロ）**／**BY-DESIGN: 16 件**／**UNRESOLVED: 5 件**。発見ゼロを明示する。
- **needle 健全性**: U+3000 **0 件**、CI 実装の **12/12 FOUND**（MISS 0。全文 haystack で 2 本が count=2 だが `contains()` 条件は満たす）。
- **反例探索**: 月数 0/11/12/13、分母 0、控除>基準／課税標準、端数、`amount2 > amount1` を含む **28 行**（`lake env lean` exit 0）＋grid **90,601 点超**で矛盾 **0 件**。乗算先行と除算先行の 11 か月での差異も確認し、原文どおり乗算先行を採用している。
- **公理結果**: Classical.choice / sorryAx / Quot.sound とも **0 件**。propext のみ 20 件（許容）。56/56 宣言を走査、exit code 0。
- **書き換え**: `docs/ADVERSARIAL_REVIEW.md` に本セクション `## Batch P review (2026-11-19)`（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に一致）を追記。既存セクションはすべて保持。Lean モジュール変更なし。commit / push / merge / ブランチ切替なし。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・原文キーフレーズの `.find()` 抽出・整数式の grid／カーネル反例走査・CI needle の `.find()` 検証・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断（U-P1〜U-P5）は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

## Batch Q review (2026-11-19)

### Q-0.範囲・独立性の声明

- **レビュア**: Adversarial Review Agent。形式化担当 3 ワーカーと独立に cycle-5 を監査。STAGING / doc-comment / 担当範囲テキストは**参照のみで信用せず**、pinned JSON から Python で直接抽出して照合した。
- **対象モジュール（読み取り専用・一切変更せず）**:
  - `JapanTaxLaw/IncomeAdjustmentDeduction.lean`（租税特別措置法 art. 41の3の11）
  - `JapanTaxLaw/SpecialBaselineIncomeTax.lean`（租税特別措置法 art. 41の19）
  - `JapanTaxLaw/DiscountBondRefund.lean`（租税特別措置法施行令 art. 26の12）
  - 各 `*Spec.lean` / `*Tests.lean` も参照（読み取りのみ）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`（租特法、revision `332AC0000000026_20261101_507AC0000000013`、sha256 `E6E6013BBB…5EE`、amendment_enforcement_date 2026-11-01）
  - `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`（租特法施行令、revision `332CO0000000043_20261101_507CO0000000127`、sha256 `D0AD21A838…4D`、2026-11-01）
- **抽出法**: `law_full_text` の `children` を再帰的に辿り `tag="Article"` の `attr.Num` で選択（art. 41の3の11 → `41_3_11`、art. 41の19 → `41_19`、art. 26の12 → `26_12`、各 1 件のみ一致）。配下の文字列を文書順に連結し `re.sub(r"[\s\u3000]+", "", …)` で正規化。日本語数字は自前パーサで Arabic 化し、算術は別実装 Python で再計算して Lean の kernel-decided smoke 期待値と比較。
- **ツール**: Python 3.x 独立抽出、`lake env lean`（`#print axioms` 40 定理、exit code 0）。
- **書き込みは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。既存セクション（Batch G〜P / Art.25 / 国税徴収法 / Art.24 等）はすべて保持。Lean モジュール・Spec・Tests・`data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、repo 外で処理（repo 内に作った一時ファイルは削除済み）。

### Q-1.独立抽出結果（pinned 原文 → 日本語数字 → Arabic → Lean 定数）

pinned 正規化テキスト長: art. 41の3の11 = 1361 文字、art. 41の19 = 3353 文字、art. 26の12 = 747 文字（いずれも RAW 長 = NORM 長、U+3000 なし）。日本語数字パーサの抽出は全項目で期待値と一致。

| 条項 | 原文トークン | 独立抽出（Arabic） | Lean 定数 / 式 | 照合 |
|---|---|---|---|---|
| 41の3の11(1) 閾値 | 八百五十万円 | 8,500,000 | `salaryIncomeThreshold = 8_500_000` | 一致 |
| 41の3の11(1) 上限 | 千万円 | 10,000,000 | `salaryIncomeCap = 10_000_000` | 一致 |
| 41の3の11(1) 率 | 百分の十 | 10/100 | `adjustmentRateNumerator=10`, `...Denominator=100` | 一致 |
| 41の3の11(2) 上限・控除 | 十万円 | 100,000 | `smallIncomeCap = 100_000` | 一致 |
| 41の19(1) 閾値 | 三億三千万円 | 330,000,000 | `thresholdAmount = 330_000_000` | 一致 |
| 41の19(1) 率 | 百分の二十二・五 | 22.5/100 = **225/1000** | `specialRate = ⟨225,1000⟩`、`applyFloor = amount*225/1000` | 一致（2250/1000 ではない） |
| 26の12 本則 | 券面金額−償還金額 × 徴収税率 | (face−red)×rate | `discountBondRefund = rate.applyFloor (face−red)` | 一致 |
| 26の12 外国分 | (券面−償還) × (ロ/イ)、イ=社債発行差金、ロ=国内帰属部分 | (face−red)×dom/iss | `foreignBondBase = (face−red)*domesticPart/issuanceDiscount` | 一致 |

率の 10 倍トラップ確認: `225/1000 = 22.5/100` は True、`2250/1000 = 22.5/100` は False。`applySpecialRate 1000 = 225`（2250/1000 なら 2250 となる 10 倍誤り）を kernel smoke が確認。

### Q-2.最重要チェック 3 点の独立判定

1. **art. 41の3の11 → CONFIRMED（不整合なし）**: 原文(1)「…千万円を超える場合には、千万円）から八百五十万円を控除した金額の百分の十に相当する金額…」は `(min 給与 10_000_000 − 8_500_000) × 10 / 100` と一字対応。原文(2)「…十万円）及び…十万円）の合計額から十万円を控除した残額」は `min salaryAfter 100_000 + min pensionOther 100_000 − 100_000` と一字対応。第3項の判定基準日（その年 12 月 31 日／死亡・出国の時／死亡者は死亡の時の現況）は原文に実在し、日付・現況判定を含む法的判断であるため **NOT MODELLED は妥当（BY-DESIGN）**。
2. **art. 41の19 → CONFIRMED（不整合なし）**: 原文「基準所得金額が三億三千万円を超える…当該超える部分の金額の百分の二十二・五に相当する金額からその年分の基準所得税額を控除した金額」は `excess = max(inc−330_000_000,0)`、`applyFloor(excess)`、`− baselineTaxAmount`（saturating）と一字対応。**225/1000 を採用し 2250/1000 の 10 倍誤りは不在**。第2項の基準所得金額算定（一号〜九号の合計・特別控除・政令規定）は他条文参照が多数にわたり **NOT MODELLED は妥当（BY-DESIGN）**。第3項の基準所得税額・第4項・第5項も NOT MODELLED（BY-DESIGN）。
3. **art. 26の12 → CONFIRMED（不整合なし）**: 原文本則「割引債の券面金額から償還金額（買入消却が行われる場合には、その買入金額）を控除した金額…に…徴収された所得税の税率を乗じて計算した金額」は `rate.applyFloor (face−red)` と一字対応。外国法人分「券面金額から償還金額を控除した金額にイに掲げる金額のうちにロに掲げる金額の占める割合を乗じて計算した金額」（イ＝社債発行差金、ロ＝国内帰属部分）は `(face−red)*domesticPart/issuanceDiscount` と対応（乗じてから除する形式、割合 = ロ/イ）。平成二十六年旧法人税法第百四十一条第一号・第二号・第三号の具体的認定は法認定であり **NOT MODELLED は妥当（BY-DESIGN）**。

**3 点とも原文どおりであり、正式な不整合・転記誤りはゼロ件。**

### Q-3.needle 健全性（15 本）

doc-comment の「Pinned bytes 逐語（needle evidence）」箇条書きから 15 本を抽出（IncomeAdjustmentDeduction 5 / SpecialBaselineIncomeTax 5 / DiscountBondRefund 5）。各 needle を pinned 正規化テキストに `.find()` で照合。

| モジュール | needle 本数 | U+3000 | `.find()` | 出現位置（pinned 正規化テキスト） |
|---|---:|---:|---|---|
| IncomeAdjustmentDeduction.lean（41の3の11） | 5 | 0 | 5/5 FOUND | 20 / 133 / 223 / 332 / 505 |
| SpecialBaselineIncomeTax.lean（41の19） | 5 | 0 | 5/5 FOUND | 0 / 76 / 141 / 443 / 861 |
| DiscountBondRefund.lean（26の12） | 5 | 0 | 5/5 FOUND | 0 / 149 / 288 / 372 / 640 |
| **合計** | **15** | **0 本** | **15/15 FOUND（MISS 0）** | — |

- **needle 健全性: 健全（15/15 FOUND、U+3000 0 本、MISS 0）**。DiscountBondRefund の doc-comment が主張する出現位置 0/149/288/372/640 は独立抽出と完全一致。
- 備考: doc-comment 内の「第1項の規定の適用がある場合には、同項の規定による控除をした残額」「…を控除した金額…に…税率を乗じて…」等の**説明用引用（「…」を含む paraphrase）は needle ではない**ため 15 本には数えない。これらは needle 箇条書き外の方法中の表現であり、`.find()` 非該当でも健全性判定に影響しない。

### Q-4.反例探索（境界・端数・ゼロ分母）

独立 Python 再実装で全テストを再計算し、Lean の kernel-decided smoke 期待値と比較。**不一致 0 件**。

- 850万境界: `s=8_499_999→0`, `8_500_000→0`（ちょうどを含む）, `8_500_001→0`, `8_500_010→1`, `9_000_000→50_000`。1000万上限: `10_000_000→150_000`, `10_000_001→150_000`（頭打ち）。
- 10万境界（第2項）: `(0,0)→0`, `(100_000,0)→0`, `(200_000,0)→0`, `(200_000,50_000)→50_000`, `(200_000,200_000)→100_000`, `(99_999,2)→1`。
- 3.3億境界: `330_000_000→0`（「超える」なので等号は 0）, `330_000_001→0`（1×225/1000 の floor）, `330_001_000→225`, `基準所得税額 300 → 0`（saturating）。
- 225/1000: `rate(1000)=225`。`2250/1000` なら 2250 となる 10 倍誤りを明示的に排除。
- 発行差金 0: `foreignBondBase(…, iss=0, …)=0`（Nat の `n/0=0` 安全版）。券面=償還 → 0、券面<償還 → 0（saturating）、`iss=100,dom=100` → 割合 1、`(1000,999,3,1)` → 0（端数）、`(1000,991,7,3)` → 3。`foreignBondRefund(1_000_000,900_000,100_000,25_000,10/100)=2_500`。
- 端数切り捨ては全モジュールで一貫（`TaxRate.applyFloor` / Nat 除算）。**8_500_001→0 や 330_000_001→0 は切り捨ての帰結であり、通則法 art. 118/119 の端数処理は NOT MODELLED と明記されているため BY-DESIGN（不具合ではない）**。有理数割合の厳密性・丸め規則も art. 26の12 で NOT MODELLED（BY-DESIGN）。

### Q-5.公理監査（`lake env lean` / `#print axioms`、40 定理、exit code 0）

- **Classical.choice: 0 件、sorryAx: 0 件、Quot.sound: 0 件**。grep でも `sorry` / `admit` / `Classical` / `choice` / `Quot.sound` / `axiom` の実コードは 0（コメント中の言及のみ）。
- **propext: 一部定理にのみ出現（仕様で許容）**。具体的には IncomeAdjustmentDeduction の `incomeAdjustmentDeduction1_of_le_threshold` / `..._of_ge_cap` / `..._of_both_ge_cap`、SpecialBaselineIncomeTax の `..._eq_zero_of_applied_le`、DiscountBondRefund の `simp` 利用定理の一部。必要条件（choice/sorryAx/Quot.sound = 0）はすべて満たす。
- 補足（BY-DESIGN・軽微な記述差）: IncomeAdjustmentDeduction.lean の doc-comment は「no … propext」と述べるが、上記 3 定理は propext に依存する。**propext は本レビュー仕様で許容されるため不具合ではない**が、コメントの記述はやや不正確（機械監査で検出）。
- `specialRate` をはじめとする**金額算定の定数・等式定理はすべて axiom-free**（`thresholdAmount_eq` / `specialRate_numDen` / `applySpecialRate_eq` / `specialBaselineIncomeTax_eq` / `discountBondRefund_eq` / `foreignBondBase_eq` / `foreignBondRefund_eq` 等）。

### Q-6.分類・最終報告（サマリ）

| 分類 | 件数 | 内容 |
|---|---:|---|
| **CONFIRMED** | 3 | 3 モジュールとも原文どおり（41の3の11 / 41の19 / 26の12）。独立抽出・算術・needle・反例の全照合で不整合なし。 |
| **BY-DESIGN** | 11 | 下記 B1〜B11（NOT MODELLED 項目、caller-established、端数・丸め、propext 記述差）。 |
| **UNRESOLVED** | 0 | 未解決事項なし。 |
| **発見（正式な不整合・転記誤り）** | **ゼロ** | — |

BY-DESIGN 内訳: B1 art.41の3の11 第3項 判定基準日（死亡・出国・死亡者現況）NOT MODELLED / B2 同 該当性・適用可否（居住者・特別障害者・23歳未満扶養親族等）は caller-established / B3 同 第2項の「第1項の控除をした残額」は caller-established 入力 / B4 同 端数処理（通則法 art. 118/119）NOT MODELLED（floor 採用）/ B5 art.41の19 第2項 基準所得金額算定（一号〜九号・特別控除・政令）NOT MODELLED / B6 同 第3項 基準所得税額算定 NOT MODELLED / B7 同 第4項・第5項 NOT MODELLED / B8 art.26の12 旧法人税法第141条 各号の外国法人認定・一号/二号区分 NOT MODELLED（caller-established）/ B9 同 割合の有理数性・厳密丸め NOT MODELLED（整数乘除で近似、分母 0 安全版）/ B10 同 税率算定・還付成立/手続・還付額の控除 NOT MODELLED（caller-established）/ B11 IncomeAdjustmentDeduction の doc-comment「no propext」記述が実際の公理フットプリントとやや不一致（propext は仕様許容のため不具合ではない）。

- **公理結果**: choice / sorryAx / Quot.sound = **0 件**、propext は許容範囲で一部定理のみ。条件を満たす。
- **needle 健全性**: 15/15 FOUND、U+3000 **0 本**、MISS 0。
- **反例探索**: 境界・端数・ゼロ分母を含む全ポイントで不一致 **0 件**。
- **追記完了**: 本セクション `## Batch Q review (2026-11-19)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に一致）。既存セクションはすべて保持。Lean モジュールは一切変更していない。commit / push / merge / ブランチ切替は行っていない。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・needle `.find()` 照合・独立算術再計算・境界ポイント列挙による反例探索・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な最終判断・解釈・有効性の評価は人間専門家に委ねる。本レビューが人間の法的レビューを称するものではない。

---

## Batch R review (2026-11-19)

### R-0. 範囲・独立性の申告

- **レビュア**: Adversarial Review Agent。形式化担当 3 ワーカーと独立に **cycle-6** を監査。担当者の STAGING / doc-comment / 担当範囲テキストは**参照のみで信用せず**、pinned JSON から Python で直接再抽出して照合した。
- **対象モジュール（読み取り専用・一切変更せず）**:
  - `JapanTaxLaw/IncomeArt205Withholding.lean`（所得税法 art. 205）
  - `JapanTaxLaw/InheritedPropertyTransferGain.lean`（租税特別措置法施行令 art. 25の16）
  - `JapanTaxLaw/LightOilBaseTax.lean`（軽油引取税法施行令 art. 23の2）
  - 各 `*Spec.lean` / `*Tests.lean` の存在は確認したが、数値照合の根拠には用いていない（pinned 原文を唯一の根拠とした）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`（所得税法、revision `340AC0000000033_20261001_507AC0000000070`、amendment 2026-10-01）
  - `data/raw/332CO0000000043_20261101_507CO0000000127.law.json`（租特法施行令、revision `332CO0000000043_20261101_507CO0000000127`、2026-11-01）
  - `data/raw/337M50000008017_20260724_508M60000008092.law.json`（軽油引取税法施行令、revision `337M50000008017_20260724_508M60000008092`、2026-07-24）
- **抽出法**: `law_full_text` を再帰走査し `tag="Article"` かつ `attr.Num` が `205` / `25_16` / `23_2` のノードを各 1 件のみ同定。配下の文字列を文書順に連結し `re.sub(r"[\s\u3000]+","",…)` で正規化。日本語数字は自前パーサ（十/百/千/万＋数字連続）で Arabic 化し、算術は独立 Python 再実装で再計算して Lean の定数・kernel-decided smoke 期待値と比較した。
- **正規化テキスト長**: art. 205 = 439 文字、art. 25の16 = 1095 文字、art. 23の2 = 238 文字（いずれも RAW 長 = NORM 長、U+3000 は 0 個）。
- **ツール**: Python 3.x 独立抽出、`lake env lean`（`#print axioms` 54 宣言、exit code 0）。一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）のみに置き、repo 内には作成していない。
- **書き込みは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ**。既存セクション（Batch G〜Q / Art.25 / 国税徴収法 / Art.24 等）はすべて保持。Lean モジュール・Spec・Tests・`data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。

### R-1. 独立抽出結果（pinned 原文 → 日本語数字 → Arabic → Lean 定数）

| 条項 | 原文トークン（独立抽出） | Arabic / 算術 | Lean 定数・式 | 照合 |
|---|---|---|---|---|
| 205 一号 基本率 | `百分の十` | 10/100 | `art205BasicRate = ⟨10,100⟩` | 一致 |
| 205 一号 超過率 | `百分の二十`（「その超える部分の金額については」） | 20/100 | `art205ExcessRate = ⟨20,100⟩` | 一致 |
| 205 一号 閾値 | `百万円`（「超える場合」＝強い >） | 1,000,000 | `art205Threshold = 1_000_000` | 一致 |
| 205 二号 率 | `百分の十`（控除後残額に適用） | 10/100 | `art205TaxAfterDeduction = basic.applyFloor (amount−deduction)` | 一致 |
| 25の16 上限 | `収入金額 −（取得費＋譲渡費用）` の残額 | max(proceeds−cost,0) | `inheritedResidualGain = max (proceeds−cost) 0` | 一致 |
| 25の16 特例額 | 一号×二号 を残額で上限、収入<合計額は「ないもの」 | min(base, residual) | `inheritedTransferGain = min base residual` | 一致 |
| 23の2 法定額 | `一一、二五〇円` | 11,250 | `lightOilBaseAmount = 11_250` | 一致 |
| 23の2 端数 | `一キロリットル未満の端数を四捨五入`（本文に 2 回） | round half up | `roundDiv a b = (2*a+b)/(2*b)` | 一致（下記 R-2 第3点） |

`百分の` トークンの出現は一号 [十, 二十, 十]（＝[10,20,10]）、`百万円` は 1 回、`四捨五入` と `一キロリットル未満` は各 2 回を独立確認。いずれも Lean 定数と一致し、**数値・率の食い違いは 0 件**。

### R-2. 最重要チェック 3 点の独立判定

1. **art. 205 → CONFIRMED（不整合なし）**: 原文「その金額に百分の十（同一人に対し一回に支払われる金額が百万円を超える場合には、その超える部分の金額については、百分の二十）の税率を乗じて計算した金額」は、`min(amount,1_000_000)×10/100 + max(amount−1_000_000,0)×20/100` と一字対応。**10% は 100 万円まで、20% は超過部分のみ**（全体に 20% を掛けるのでも、10% と 20% を足すのでもない）という読み替え構造を `art205Tax` が正しく実装。二号「…から政令で定める金額を控除した残額に百分の十の税率を乗じて計算した金額」は `art205TaxAfterDeduction = basic.applyFloor (amount−deduction)` と対応。**報酬×10% / 同一人一回 100 万円超部分×20% / 政令控除後×10% の 3 点すべて原文どおり**。政令控除額・賞金の金銭外価額・各号該当性は caller-established / NOT MODELLED（下記 B-1〜B-3）。
2. **art. 25の16 → CONFIRMED（不整合なし）**: 原文「第一号に掲げる相続税額に第二号に掲げる割合を乗じて計算した金額とする。ただし、…収入金額から…取得費及び…費用の額の合計額を控除した残額に相当する金額を超える場合には、その残額に相当する金額とし、当該収入金額が当該合計額に満たない場合には、当該計算した金額は、ないものとする。」は、`base = ratio.applyFloor 相続税額`、`residual = max(収入−合計額, 0)`、`gain = min base residual` と一字対応。**収入 < 合計額 → residual=0 → gain=0（「ないもの」）**、**計算額 > 残額 → 残額を採用**の 2 分岐を `min` が正しく表現。二号割合の具体的算定（相続税法 11の2 / 19 / 21の14〜18 / 13 の読替え等、他条文参照多数）は **NOT MODELLED が妥当（BY-DESIGN、下記 B-5）**。原文に端数規定はなく、Nat 除算の切り捨てを明示する慣例も透明（下記 B-7）。
3. **art. 23の2 → CONFIRMED（不整合なし）**: 原文「一一、二五〇円に、…数量（…四捨五入する。）に別表第十一に定める率を乗じて得た数量（…四捨五入する。）を乗じて得た額とする。ただし、指定都市を包括する都道府県の基準税額は、当該額から…指定都市ごとに第三十八条の規定によつて算定した額を控除した額とする。」は、`11_250 × roundKiloliter 数量 率`、ただし書 `base − Σ指定都市額`（saturating）と対応。**`roundDiv(a,b) = floor((2a+b)/(2b))` は正の a,b に対する round-half-up であり、原文の「四捨五入」（0.5 を切り上げ）に相当する**（R-4 の境界表で数値確認）。別表第十一条の率・第三十八条の算定は **NOT MODELLED が妥当（BY-DESIGN、下記 B-8/B-9）**。率適用「前」の四捨五入は caller-established（R-4、下記 B-10）。

**3 点とも原文どおりであり、正式な不整合・転記誤りはゼロ件。**

### R-3. needle 健全性（14 本）

3 モジュールの doc-comment に記載された pinned bytes 逐語（needle evidence）を原文从属の点検対象とし、14 本を選定。各 needle を pinned 正規化テキストに `.find()` で照合した（art.205: 5 / art.25の16: 5 / art.23の2: 4）。なお art.205 二号税額 needle は doc-comment が「…」で省略しているが、点検には**省略を展開した完全逐語文字列**を用いた（pinned 原文に実在）。

| モジュール | 本数 | U+3000 | `.find()` | offset（pinned 正規化テキスト） |
|---|---:|---:|---|---|
| IncomeArt205Withholding（art.205） | 5 | 0 | 5/5 FOUND | 0 / 58 / 122 / 196 / 342 |
| InheritedPropertyTransferGain（25の16） | 5 | 0 | 5/5 FOUND | 78 / 117 / 230 / 428 / 733 |
| LightOilBaseTax（23の2） | 4 | 0 | 4/4 FOUND | 36 / 69 / 102 / 168 |
| **合計** | **14** | **0 本** | **14/14 FOUND（MISS 0）** | — |

- **needle 健全性: 健全（14/14 FOUND、U+3000 0 本、MISS 0）**。
- 備考: 各 doc-comment の見出しや方法中の説明用引用（「…」を含む paraphrase）は needle に数えない。art.23の2 の doc-comment が全文 1 ブロックで引用する本文から、数値・端数・控除の各条項を逐語分割して 4 本とした（いずれも pinned 原文の部分文字列）。

### R-4. 反例探索（境界・端数・控除過大）

独立 Python 再実装で全ポイントを再計算し、Lean の定数・kernel-decided smoke 期待値と比較。**不一致 0 件**。

| 攻撃対象 | 独立再計算 | Lean 期待値 | 結果 |
|---|---|---|---|
| 100 万円ちょうど | `a205(1_000_000)=100_000`（「超える」で等号は 20% なし） | `art205Tax_at_threshold = 100_000` | 矛盾なし |
| 100 万円+1 円 | `a205(1_000_001)=100_000`（1×20/100 の floor） | `art205Tax_one_above_threshold = 100_000` | 矛盾なし |
| 100 万円超（例 110 万 / 200 万） | `a205(1_100_000)=120_000`, `a205(2_000_000)=300_000` | smoke と一致 | 矛盾なし |
| 控除 > 金額（二号） | `a205ded(100,200)=0`（saturating） | `art205TaxAfterDeduction 100 200 = 0` | 矛盾なし |
| 端数切り捨て（二号） | `a205ded(9,0)=0`, `a205ded(100,50)=5` | smoke と一致 | 矛盾なし |
| 収入 < 取得費（「ないもの」） | `i2516(…,100000,300000)=0`、`(…,300000,300000)=0` | smoke（两者 0）と一致 | 矛盾なし |
| 残額上限が効く | `i2516(5_000_000,1/10,400000,100000)=300_000` | smoke と一致 | 矛盾なし |
| 計算額 < 残額 | `i2516(1_000_000,1/10,500000,300000)=100_000` | smoke と一致 | 矛盾なし |
| round half up 境界 | `roundDiv(1,2)=1`, `(3,2)=2`, `(5,2)=3`, `(7,2)=4`, `(1,3)=0`, `(2,3)=1` | 定義式 `(2a+b)/(2b)` と一致 | 矛盾なし |
| 基準税額（11,250×四捨五入数量） | `lot(1,⟨1,1⟩)=11250`, `lot(3,⟨1,2⟩)=22500`, `lot(0,⋯)=0` | `lightOilBaseTax_eq_literal` と整合 | 矛盾なし |
| 控除 > 基準税額（ただし書） | Nat saturating → 0 | `afterDeduction_eq_zero_of_ge` | 矛盾なし |

- **四捨五入の等同性**: 0.5 を切り上げる round-half-up は原文「四捨五入」の整数モデルに一致。別の丸め（五捨五入・切り捨て等）を断定するものではない（下記 B-11）。
- **丸め規則の法的正当性**（art.205/25の16 の floor、art.23の2 の round-half-up、通則法 art.118/119 の端数処理）は pinned 原文からは決定不能で、人間の法律専門家の確認を要するが、pinned 原文と矛盾するものではない（下記 B-11 / 免責）。

### R-5. 公理監査（`lake env lean` / `#print axioms`、54 宣言、exit code 0）

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchR_axiom_probe.lean` を作成し、3 モジュールの名前付き `def` / `theorem` 計 **54 宣言**（IncomeArt205 18 / InheritedProperty 17 / LightOil 19）すべてに `#print axioms` を実行。監査後、一時ファイル群は repo 外の approved temp dir に置かれ、repo 内には残していない。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 54 |
| axiom-free（`does not depend on any axioms`） | **40** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **14 件**（IncomeArt205 3 / InheritedProperty 10 / LightOil 1。いずれも `simp` 由来、許容範囲） |

- propext の内訳: `art205Tax_of_le` / `art205Tax_of_gt` / `art205TaxAfterDeduction_of_lt` / `inheritedTransferBase_zero_tax` / `..._zero_num` / `..._le_tax` / `inheritedResidualGain_eq_sub` / `..._zero_when_le` / `..._zero_when_lt` / `inheritedTransferGain_le_base` / `..._le_residual` / `..._eq_residual` / `..._zero_when_proceeds_le_cost` / `afterDeduction_eq_zero_of_ge`。
- **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**
- 軽微な記述差（BY-DESIGN・下記 B-12）: `IncomeArt205Withholding` と `LightOilBaseTax` の doc-comment は「no … propext」と述べるが、上記のとおり一部定理が propext に依存する。propext は仕様で許容されるため不具合ではないが、コメントの記述は機械監査でやや不正確と検出された。金額算定の定数・等式定理（各 `*_eq` / `art205Tax` / `inheritedTransferGain` / `roundDiv` / `lightOilBaseTax` 等）はすべて axiom-free。

### R-6. 分類・最終報告（サマリ）

| 分類 | 件数 | 内容 |
|---|---:|---|
| **CONFIRMED** | 3 | 3 モジュールとも原文どおり（205 / 25の16 / 23の2）。独立抽出・率/算術・needle・反例の全照合で不整合なし。 |
| **BY-DESIGN** | 12 | 下記 B1〜B12（NOT MODELLED 項目、caller-established、丸め規則、propext 記述差）。 |
| **UNRESOLVED** | 0 | 未解決事项なし（丸めの法的正当性は B11 のとおり pin 原文を超える判断として BY-DESIGN 側に集約）。 |
| **発見（正式な不整合・転記誤り）** | **ゼロ** | — |

BY-DESIGN 内訳: B1 art.205 二号の政令で定める控除額は caller-established / NOT MODELLED / B2 同 賞金の金銭外価額算定（政令で定めるところにより計算した金額）NOT MODELLED / B3 同 前条第一項各号の該当性・一号/二号の区分・「同一人に対し一回」の集計は caller-established / B4 同 通則法 art.118/119 の端数処理・租税条約軽減・復興/防衛特別所得税・確定申告調整 NOT MODELLED（floor 採用）/ B5 art.25の16 二号割合の具体的算定（相続税法 11の2 / 19 / 21の14〜18 / 13 読替え等）NOT MODELLED / B6 同 相続税額の確定時点・第2項修正申告/更正・第3項贈与税控除読替え・附帯税相当額控除の具体的算定 NOT MODELLED / B7 同 収入金額・取得費・譲渡費用・特例該当性は caller-established、原文に端数規定なしで Nat 除算の切り捨てを明示 / B8 art.23の2 別表第十一条の率の値・適用 NOT MODELLED（caller-established な `TaxRate` として受け取る）/ B9 同 第三十八条の指定都市ごとの算定額 NOT MODELLED（各額 caller-established、合計を saturating 減算）/ B10 同 前年度課税標準数量の確定・率適用「前」の四捨五入は caller-established（丸め済み数量を渡す）/ B11 丸め規則（floor / round-half-up / 通則法端数処理）の法的正当性は pin 原文から決定不能で人間の法律専門家の確認を要するが、原文と矛盾しない透明なモデル選択 / B12 二モジュールの doc-comment「no propext」記述が実際の公理フットプリントとやや不一致（propext は仕様許容のため不具合ではない）。

- **公理結果**: Classical.choice / sorryAx / Quot.sound = **0 件**、propext は 14 件のみ（許容範囲）。条件を満たす。
- **needle 健全性**: 14/14 FOUND、U+3000 **0 本**、MISS 0。
- **反例探索**: 100 万円境界・収入<取得費・round half up 境界・控除>税額を含む全ポイントで不一致 **0 件**。
- **追記完了**: 本セクション `## Batch R review (2026-11-19)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に一致）。既存セクションはすべて保持。Lean モジュールは一切変更していない。commit / push / merge / ブランチ切替は行っていない。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・needle `.find()` 照合・自前日本語数字パーサによる抽出・独立算術再計算・境界ポイント列挙による反例探索・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈・有効性の最終判断は専門家に委ねる。本レビューが人間の法的レビューを称するものではない。

---

## Batch S review (2026-11-20)

### S-0. 範囲・手法・独立性

- **レビュア**: Adversarial Review Agent。形式化担当 3 ワーカーと独立に **cycle-7** を原文照合・反例探索した。STAGING / doc-comment / 担当範囲テキストは**参照のみ**に用い、pinned JSON から Python で直接抽出して照合した（STAGING の「FOUND」主張は信じず再計算）。
- **対象モジュール（読み取り専用・一切変更せず）**:
  - `JapanTaxLaw/ConsolidationCreditLimit.lean`（法人税法施行令 art.148）
  - `JapanTaxLaw/TrustPensionReserve.lean`（法人税法施行令 art.157）
  - `JapanTaxLaw/ResidentTaxTransitionalRates.lean`（地方税法施行令 art.12）
  - 各 `*Spec.lean` / `*Tests.lean` は誤りの伝播確認のため参照のみ（判定の根拠には使用せず）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/340CO0000000097_20261001_507CO0000000121.law.json`（法人税法施行令、revision 一致）
  - `data/raw/347CO0000000161_20010106_412CO0000000304.law.json`（地方税法施行令、revision 一致）
- **抽出法**: `law_full_text` を再帰的に flatten し、`tag='Article'` かつ `attr.Num` が `148` / `157` / `12` の **MainProvision 配下**ノードの leaf-text を連結、`re.sub(r"[\s\u3000]+","",…)` で正規化。漢数字は独立に readings を割り当て（二百九十=290 他）、算術は Python で再計算して Lean の定数・kernel-decide smoke と比較。needle は STAGING の JSON 断片を**候補リストとしてのみ**使い、pinned 正規化テキストへ `.find()` を実行。
- **実行環境**: Python 3.12.10、`lake env lean`（Lean 4.35.0）。一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）のみに配置、repo 内には作成せず。
- **書き込みは `docs/ADVERSARIAL_REVIEW.md` の本セクション追記のみ**。Lean モジュール / Spec / Tests / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。

### S-1. 独立抽出結果（pinned 原文 → 漢数字 → Lean 定数）

| 条文 | pinned leaf-text 正規化後 | U+3000 | doc-comment 主張文字数 | 照合 |
|---|---:|---:|---:|---|
| art.148（340） | 3094 文字 | 0 | 3094 | 一致 |
| art.157（340） | 2375 文字 | 0 | 2375 | 一致 |
| art.12 MainProvision（347） | 5921 文字 | 0 | 5921 | 一致 |

- 347 の `Num='12'` は 3 ノード（MainProvision 1 + 附則 `AmendLawNum` 付き 2）。レビュー対象は MainProvision の art.12（市町村民税に関する経過措置）のみ）。
- 原文リテラルの直接ヒット（いずれも FOUND、needle U+3000 = 0）:
  - art.148 §1 saturating 句 … offset 113 / 61 文字。
  - art.148 §2「調整前控除限度額とは、第一号に掲げる金額に第二号に掲げる金額のうちに第三号に掲げる金額の占める割合を乗じて計算した金額」… offset 182（前方 7 文字を含む完全 needle は offset 175 / 66 文字）。
  - art.157 §1 算式 … offset 161 / 65 文字。
  - art.12「年額二百九十円（人口五万未満の市及び町村にあつては、百五十円）」… offset 84 /「四百三十円…二百三十円」… offset 120 /「百分の八十」… offset 197 /「一・五」… offset 221。

### S-2. 3 点の独立判定

**1. art.148 — §1 は一致、§2 は原文不一致（CONFIRMED MISMATCH・要修正）**

- §1 原文:「調整前控除限度額から当該通算事業年度の控除限度調整額を控除した金額（当該調整前控除限度額が零を下回る場合には、零）とする。」
  → Lean `consolidationCreditLimit p a = if p ≤ a then 0 else p - a` = `max(p−a, 0)`。**saturating 減算として一致（CONFIRMED）**。括弧の主語が逐語上「調整前控除限度額」である点は下記 B1（BY-DESIGN・人間の法的確認待ち）。
- §2 原文（needle #2 で逐語確認済み）:「調整前控除限度額とは、**第一号に掲げる金額に**第二号に掲げる金額のうちに第三号に掲げる金額の占める割合**を乗じて**計算した金額」。
  → 正しい算術は **第一号 ×（第三号 ÷ 第二号）**。ところが Lean は
  `preAdjustmentLimit f s t = if s = 0 then 0 else f + s * t / s`（= `f + t`, s≠0）を実装している。**加算（`+`）であり原文の乗算（`×`）ではない。不一致を確定（CONFIRMED 不一致）**。
  - 具体例: `f=100, s=200, t=50` は原文なら `100*50/200 = 25`、モデルは `150`。`f=0,s=200,t=50` は原文 `0` / モデル `50`。`f=100,s=200,t=0` は原文 `0` / モデル `100`。
  - 次元にも矛盾: 税額 × 割合 = 税額（妥当）に対し、モデルは税額 + 所得金額（次元不同）。
  - §7「控除限度調整額」も同型の乗算文（needle #3「第一号に掲げる金額に…同号イに掲げる金額の占める割合を乗じて計算した金額」）だが、本モジュールは §7 を caller-established としており直接の誤記はない。
  - **誤りの伝播**: `ConsolidationCreditLimitSpec.lean` の `specPreAdjustmentLimit = if s=0 then 0 else f + t` および `agreeConsolidationCreditLimit` も同じ加算式を共有しており、"独立 spec" が誤りを検出できていない（共通の誤記）。`example : preAdjustmentLimit 100 200 50 = 150 := by decide` も誤った期待値を固定している。
  - 修正方針例（本レビューは Lean を変更しない）: `if secondAmount = 0 then 0 else firstAmount * thirdAmount / secondAmount`。厳密な有理数割合・丸め規則は人間の法的レビュー事项（B4）。

**2. art.157 — 一致（CONFIRMED）**

- 原文 §1:「第一号及び第二号に掲げる金額の合計額から第三号及び第四号に掲げる金額の合計額を控除した金額に、調整割合を乗じて計算した金額とする。」
  → Lean `trustPensionBase = (first+second) - (third+fourth)`、`trustPensionReserve = adjustmentRate.applyFloor base` = `floor(base × 調整割合)`。**原文の算術 (一号+二号−三号−四号)×調整割合 と一致（CONFIRMED）**。§2（ロ 確定給付年金基金資産運用契約）も同式で同じ def で表現可能。
- BY-DESIGN: 各号の具体的算定・第 5 項の調整割合算定（百分の七に月数を乗じ十二で除し百分の百を加える）NOT MODELLED（B6/B8）、Nat saturating 減算（B5）、§3/§4 の異なり式（三号のみ）NOT MODELLED（B7）。

**3. art.12 — 一致（CONFIRMED）**

- 原文: 均等割 標準「年額二百九十円（人口五万未満…百五十円）」/ 制限「年額四百三十円（…二百三十円）」、所得割 標準「…百分の八十を乗じて得た率」、制限「イの率に**一・五**を乗じて得た率」、退職所得割「…百分の八十を乗じて得た率」。
  → Lean `290 / 150 / 430 / 230`、`percent80Rate = ⟨80,100⟩`、`oneAndHalfRate = ⟨15,10⟩`、`incomeTaxLimitRate = oneAndHalfRate.applyFloor (incomeTaxStandardRate …)`。**全定数・算術が一致（CONFIRMED）**。
- **1.5 倍トラップ回避を確認**: `一・五 = 15/10` であり `150/10` ではない。独立計算で `incomeTaxLimitRate 2 = 1`（15/10 経路）に対し 150/10 なら `15` となる。モデルは正しい側。境界 `populationUnder50k 49_999 = true / 50_000 = false` も原文「五万未満」どおり。
- BY-DESIGN: 表の率 caller-established、floor 丸め、人口区分 caller-established、第 2 項以降 NOT MODELLED（B9/B10/B11）。

### S-3. needle 健全性（14 本）

STAGING の JSON 断片から候補を取得したが、判定は pinned 正規化テキストへの直接 `.find()` による（STAGING の FOUND 主張は未信頼）。

| モジュール | 本数 | U+3000 | `.find()` | offset（pinned 正規化 leaf-text） |
|---|---:|---:|---|---|
| ConsolidationCreditLimit（art.148） | 3 | 0 本 | 3/3 FOUND | 113 / 175 / 2569 |
| TrustPensionReserve（art.157） | 6 | 0 本 | 6/6 FOUND | 149 / 0 / 226 / 382 / 1967 / 1379 |
| ResidentTaxTransitionalRates（art.12） | 5 | 0 本 | 5/5 FOUND | 1 / 75 / 152 / 221 / 473 |
| **合計** | **14** | **0 本** | **14/14 FOUND（MISS 0）** | — |

- **needle 健全性: 健全（14/14 FOUND、U+3000 0 本、MISS 0）**。needle 文字列の改変・正規化・異体字変換はしていない。

### S-4. 反例探索（独立再計算 vs Lean）

| 標的 | ケース | 独立計算 | Lean / モデル | 結果 |
|---|---|---|---|---|
| art.148 §2 | `f=100,s=200,t=50` | `100*50/200=25` | `150` | **不一致（誤記）** |
| art.148 §2 | `f=0,s=200,t=50` | `0` | `50` | **不一致（誤記）** |
| art.148 §2 | `f=100,s=200,t=0` | `0` | `100` | **不一致（誤記）** |
| art.148 §2 | `f=100,s=3,t=1`（割り切れない割合） | `33` | `101` | **不一致（誤記）** |
| art.148 §2 | 分母 0（`s=0`） | `0` | `0` | 一致 |
| art.148 §1 | `p=500,a=120` / `500,500` / `500,501` / `0,100` | `380` / `0` / `0` / `0` | 同値 | 一致 |
| art.157 | 控除>加算 `10,5,8,9` | base `0` → 積立 `0` | 同値 | 一致 |
| art.157 | 率分子 0 / base 0 | `0` | 同値 | 一致 |
| art.157 | `100,0,0,0, rate=7/12` | `floor(100*7/12)=58` | 同値（applyFloor） | 一致 |
| art.12 | 人口 `49,999` / `50,000` | `true` / `false` | 同値 | 一致 |
| art.12 | 1.5 倍トラップ `incomeTaxLimitRate 2` | 15/10 → `1`（150/10 なら 15） | `1` | 一致（正しい側） |
| art.12 | 均等割 4 定数 | 290/150/430/230 | 同値 | 一致 |

- **不一致 4 件、すべて art.148 §2 の加算/乗算誤記に起因**。art.157 / art.12 の境界（分母 0、控除>調整前、控除>加算、5 万未満/以上、1.5 倍の 10 倍誤り）では不一致 **0 件**。

### S-5. 公理監査（`lake env lean` / `#print axioms`）

対象 3 モジュールの名前付き宣言 **44 本**（CCL 10 / TPR 9 / RTTR 25）に `#print axioms` を実行、**exit code 0**。一時ファイルは approved temp dir にのみ配置し削除済み、repo 内に残していない。

| 項目 | 結果 |
|---|---:|
| 監査宣言数 | 44 |
| axiom-free（`does not depend on any axioms`） | **32**（CCL 6 / TPR 4 / RTTR 22） |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` のみ（許容） | **12**（CCL 4 / TPR 5 / RTTR 3） |

- propext 依存: CCL `preAdjustmentLimit_zero_denominator` / `preAdjustmentLimit_eq_add` / `preAdjustmentLimit_pos` / `consolidationCreditLimit_pos`、TPR `trustPensionBase_pos_of_lt` / `trustPensionBase_eq_zero_of_le` / `trustPensionReserve_zero_rate` / `trustPensionReserve_zero_of_base_zero` / `trustPensionReserve_eq_zero_of_deduction_ge`、RTTR `incomeTaxStandardRate_mono` / `incomeTaxLimitRate_mono` / `retirementIncomeTaxStandardRate_mono`（いずれも `if` / Nat 除算 / 単調性の定理経由）。
- **禁止公理（choice / sorryAx / Quot.sound）はすべて 0 件**。propext は仕様許容。**公理監査は条件を満たす**。※ 監査対象はレビュー対象の 3 モジュール（impl）のみで、Spec / Tests は本監査に含めていない。

### S-6. 分類・最終報告（要約）

| 分類 | 件数 | 内容 |
|---|---:|---|
| **CONFIRMED（独立照合を確定）** | **3** | 3 点すべてで独立判定を完了。内訳: 原文一致 **2**（art.157 / art.12）、**原文不一致 1**（art.148 §2 の乗算→加算の誤記）。 |
| **BY-DESIGN** | **11** | 下記 B1〜B11（NOT MODELLED、caller-established、丸め、解釈上の nuance、分母 0 の安全版）。 |
| **UNRESOLVED** | **0** | 未解決事项なし。art.148 §1 括弧の解釈 nuance は B1 に集約。 |
| **発見（原文不一致・要修正）** | **1** | **art.148 §2: `f + s*t/s`（= f+t）は原文の `f * t/s` ではない。発見は「ゼロ」ではない（1 件）。** |

BY-DESIGN 内訳: B1 art.148 §1 括弧「当該調整前控除限度額が零を下回る場合には、零」は逐語上 調整前控除限度額（§2 の和なので非負・空凍結的）を指すが、モデルは減算結果を saturating に floor——慣用解釈に沿うが人間の法的確認待ち / B2 art.148 §2 の分母（第二号）0→0 の安全版は原文の割合が未定義な点の modeling choice（ただし分子側の加算自体は CONFIRMED 不一致）/ B3 art.148 第 2 項各号の具体的算定（法 67–70・租税特別措置法 42 の 4 等）・第 3 項以降 NOT MODELLED、各額 caller-established / B4 art.148 の割合を Nat 乗除（乗算先行・切り捨て）で近似、厳密有理数・丸めは主張しない / B5 art.157 の `(一号+二号)−(三号+四号)` を Nat saturating 減算（原文に下限規定の明示なし、Money=Nat）/ B6 art.157 調整割合は caller-established な `TaxRate`、第 5 項の割合算定 NOT MODELLED / B7 art.157 第 3 項・第 4 項は（一号+二号）−三号（四号なし）の異なり式で本スライスの射程外 / B8 art.157 各号の具体的算定（原価法・時価・収益分配・掛金）・第 6〜8 項 NOT MODELLED / B9 art.12 表の率（314 条の 3 / 328 条の 3）caller-established、端数は floor（原文に端数規定なし）/ B10 art.12 人口区分「人口五万未満」は caller-established、`populationUnder50k` は境界述語のみで金額式に不在 / B11 art.12 第 2 項以降（他条項適用・沖縄経過措置・読替え表・控除・四分の三特例等）NOT MODELLED。

- **CONFIRMED / BY-DESIGN / UNRESOLVED 件数: 3 / 11 / 0**（CONFIRMED 3 の内訳は原文一致 2・原文不一致 1）。
- **公理結果**: Classical.choice / sorryAx / Quot.sound = **0 件**、propext は 12 件のみ（許容範囲）。条件を満たす。
- **needle 健全性**: 14/14 FOUND、U+3000 **0 本**、MISS 0。
- **反例探索**: 不一致 **4 件**（すべて art.148 §2 の加算/乗算誤記）。art.157 / art.12 の全境界で不一致 0 件。
- **追記完了**: 本セクション `## Batch S review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に一致）。既存セクションはすべて保持。Lean モジュールは一切変更していない。commit / push / merge / ブランチ切替は行っていない。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・needle `.find()` 照合・漢数字→Arabic 抽出・独立算術再計算・境界ポイント列挙による反例探索・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈・有効性の最終判断は専門家に委ねる。本レビューが人間の法的レビューを称するものではない。

## Batch T review (2026-11-20)

Adversarial Review Agent（形式化担当 W-NTSC / W-LVTD から独立）。レビュー対象は cycle-8 の
`JapanTaxLaw/NonTaxSavingsCeiling.lean`（所得税法施行令 art.40 / law `340CO0000000096`）と
`JapanTaxLaw/LandValueTaxBasicDeduction.lean`（地価税法 art.18 / law `403AC0000000069`）。
一次資料は pinned の
`data/raw/340CO0000000096_20260522_508CO0000000093.law.json` と
`data/raw/403AC0000000069_20250601_504AC0000000068.law.json` のみ。
coordinator の要約・`STAGING_NTSC.md` / `STAGING_LVTD.md` の数値・needle 申告は**信じず**、
pinned JSON の `law_full_text` を Python で直接走査して金額・算術・原文文字列を再抽出した。
commit / push / merge / ブランチ切替は行っていない。Lean モジュールは読み取り専用で一切変更していない。

### T-1. 独立抽出結果（pinned 原文からの直接 parse）

- **art.40**: `Article[attr.Num=40]` の平坦本文を直接取得。長さ **186 文字**、U+3000 = **0**。
  逐語（186 文字、一字一句改変なし）:
  `（非課税貯蓄申告書）第四十条国内に住所を有する個人が非課税貯蓄申告書を提出する場合には、当該申告書に記載する法第十条第三項第三号（非課税貯蓄申告書の記載事項）に掲げる最高限度額は、一万円に整数を乗じた金額で、かつ、三百万円（当該申告書に記載すべき同項第四号に掲げる最高限度額がある場合には、三百万円から当該最高限度額の合計額を控除した残額）以下の金額としなければならない。`
  - 「一万円」= **10,000** → `unitYen = 10_000` と一致（10 倍誤りなし）。
  - 「三百万円」= **3,000,000**（本文に 2 回出現）→ `baseCeilingYen = 3_000_000` と一致。
    「三千万円」「三億円」は本文に **0 回**（上限の 10 倍／100 倍誤りなし）。
  - 「三百万円から当該最高限度額の合計額を控除した残額」
    → `residualCeiling item4 = 3_000_000 − item4`（saturating）、**控除方向は原文どおり**
    （合計額を 300 万から引く。逆方向・加算ではない）。
  - 制約「かつ、…以下の金額」→ `declaredCeiling units ≤ residualCeiling item4`。
- **art.18**: 同一 law id の `Article[attr.Num=18]` は 2 件。本文に「基礎控除」を含む
  **平坦長 565 文字・U+3000 = 2** のものが対象（他方は経過措置・平坦長 254 文字で対象外）。
  - 冒頭「次の各号に掲げる金額の**いずれか多い金額**は、課税価格から控除する」
    → `basicDeduction = max(item1Amount, item2Amount)` の max 構造と一致。
  - 一号イ「**十億円**」= **1,000,000,000** → `item1LargeCorpAmount` と一致。
  - 一号ロ「**十五億円**」= **1,500,000,000** → `item1OtherAmount` と一致。
  - 区分閾値「資本金の額又は出資金の額が**一億円**を超える法人」= **100,000,000**
    → `capitalThreshold` と一致。**十億（1e9）・十五億（1.5e9）との混同なし**。
  - 二号の単価「**三万円**」= **30,000**（本文に 3 回出現）→ `unitPriceBase = 30_000` と一致
    （30 万への 10 倍誤りなし）。
  - 「一平方メートル当たりの金額（…当該金額に**二分の一**を乗じて計算した金額）に、
    当該土地等の面積を乗じて計算した金額の合計額」
    → 1/2 は**面積を掛ける前の単価**にかかる。Lean は
    `unitPricePerSqm = prev.applyFloor(単価)` → `parcelAmount = 単価 × 面積` の順で、
    原文の係り受けと一致（面積に 1/2 を掛ける誤りなし）。
  - `TaxRate.applyFloor r m = m * r.num / r.den` を直接確認。`⟨1,2⟩` は `m/2`、
    偶数 `m` でちょうど半分（30,000→15,000、21,000→10,500）。

### T-2. 独立判定（2 点）

| # | 対象 | 判定 | 根拠（pinned 原文との照合） |
|---|---|---|---|
| 1 | art.40 | **CONFIRMED（一致・不一致なし）** | 一万円=10,000／三百万円=3,000,000／「300 万から合計額を控除した残額」の減算方向、いずれも逐語一致。10 倍・100 倍誤り、控除方向誤りなし。 |
| 2 | art.18 | **CONFIRMED（一致・不一致なし）** | 「いずれか多い金額」= max(一号,二号)、一号=10 億/15 億、閾値=1 億、単価=3 万円、1/2 は単価に適用、いずれも逐語一致。混同・桁違いなし。 |

### T-3. needle 健全性（CI 実装の 8 本を直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、
`NTSC NonTaxSavingsCeiling`（3 本）と `LVTD LandValueTaxBasicDeduction`（5 本）に
実際に組み込まれた needle 文字列を取得（STAGING の申告は信じていない）。
正規化は CI と同一の `_norm(s) = re.sub(r"[\s　]+", "", s)` を使用。

| check | needle 本数 | U+3000 を含む本数 | FOUND（正規化テキスト） | count |
|---|---:|---:|---:|---:|
| NTSC NonTaxSavingsCeiling | 3 | 0 | 3/3 | すべて 1 |
| LVTD LandValueTaxBasicDeduction | 5 | 0 | 5/5 | すべて 1 |
| **合計** | **8** | **0** | **8/8（MISS 0）** | **すべて 1** |

- needle 別 offset（正規化テキスト）: NTSC = 42214 / 42283 / 42312、
  LVTD = 7401 / 7488 / 7672 / 7754 / 7847（すべて count = 1、一意）。
- **注記（BY-DESIGN の表記 nuance）**: LVTD の 4・5 本目は、pinned art.18 本文中の
  2 個の U+3000（「…であるとき。**　**三万円に…」）を needle 側が含まないため、
  正規化**前**の生テキストへの完全一致 `.find()` は `-1` となる。しかし CI の
  `contains()` は haystack も needle も正規化して比較するため、正規化テキストでは
  FOUND（count 1）。doc-comment の「flatten テキストに `.find()` / `.count()` で各 1 回」
  は**正規化済み比較**と読むべきであり、モデル・数値・needle 自体の欠陥ではない。
- CI ゲート: `python scripts/ci/transcription_audit.py` は **exit 0（139 PASS / 0 FAIL）**、
  NTSC / LVTD の両 check とも PASS。

### T-4. 反例探索（独立再計算 vs Lean モデル）

Lean の `by decide` smoke check を信じず、Python で定数・式を独立再実装して
指定境界を走査（`applyFloor` の floor セマンティクス含む）。

| 対象 | 境界ケース | 独立計算 | Lean / モデル式 | 結果 |
|---|---|---|---|---|
| art.40 | 合計額 3,000,000 / 3,000,001 / 3,500,000 / 9,999,999 / 1e9 | すべて残額 0 | `residualCeiling` saturating | 一致 |
| art.40 | 整数 0 → 金額 0 | 0 | `declaredCeiling 0 = 0` | 一致 |
| art.40 | 300 × 一万円 = 3,000,000 / 301 unit は超過 | 3,000,000 / 超過 | `ceilingWithinLimit 300 0` / `¬ … 301 0` | 一致 |
| art.40 | 控除後 1,000,000 → 残額 2,000,000 | 2,000,000 | `residualCeiling 1_000_000` | 一致 |
| art.40 | 端数 残額 2,999,999 で 299 unit OK / 300 unit NG | OK / NG | `ceilingWithinLimit 299 1` / `¬ … 300 1` | 一致 |
| art.40 | `maxAllowedUnits 0/1/3_000_000` | 300 / 299 / 0 | 同値（端数切り捨て） | 一致 |
| art.18 | 一号 > 二号（土地等なし） | 1e9 / 1.5e9 | `basicDeduction … []` | 一致 |
| art.18 | 二号 > 一号（30,000×40,000=1.2e9 / ×60,000=1.8e9） | 1.2e9 / 1.8e9 | `basicDeduction … [area]` | 一致 |
| art.18 | 1/2 適用（単価 30,000→15,000、面積 100→1,500,000） | 15,000 / 1,500,000 | `unitPricePerSqm … half` / `parcelAmount … half` | 一致 |
| art.18 | 割合 0（7/10 等ではなく 0/1） | 単価 0 → 金額 0 | `unitPricePerSqm_ratio_zero` / `parcelAmount_ratio_zero` | 一致 |
| art.18 | 面積 0 | 0 | `parcelAmount_area_zero` | 一致 |
| art.18 | 借地権割合 7/10 → 21,000、底地割合 3/10 → 9,000、各 1/2 → 10,500 / 4,500 | 同左 | Lean の各 theorem | 一致 |

- 追加の網羅的不変式走査（`units` 0〜399 × 複数 `item4Total`、残額の単調非増加、
  `declaredCeiling % 10_000 = 0`、上限内 unit の単調性）も **PASS**。
- **反例（不一致）検出数: 0 件**。桁違い・係り受け逆転・saturating 境界の誤りはなし。

### T-5. 公理監査（`lake env lean` / `#print axioms`）

対象 2 モジュールの名前付き宣言を全件走査し、`#print axioms` を実行（**exit code 0**、
両モジュールの import・全 `by decide` smoke check もコンパイル成功）。
監査用 one-off ファイルは approved temp dir に置き、run 後に削除、repo には残していない。

| 項目 | 結果 |
|---|---:|
| 監査対象宣言数 | **65**（NTSC 20 / LVTD 45） |
| axiom-free（`does not depend on any axioms`） | **55** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` のみ（許容） | **10 件**（NTSC 4 / LVTD 6） |
| `sorry` / `admit` の実使用 | **0 件**（ソース中の言及は「使用なし」の doc-comment のみ） |

- propext 依存は `declaredCeiling_mod_unitYen` / `residualCeiling_pos` /
  `ceilingWithinLimit_zero_units` / `maxAllowedUnits_saturate`（NTSC）、
  `parcelAmount_area_zero` / `item2Amount_cons` / `basicDeduction_ge_item1` /
  `basicDeduction_ge_item2` / `basicDeduction_pos` /
  `basicDeduction_eq_item1_of_item2_le`（LVTD）で、いずれも `if`・Nat 減算・
  単純定理に由来する core `propext` のみ。**禁止公理の混入はゼロ**。

### T-6. 分類・最終報告

| 分類 | 件数 | 内容 |
|---|---:|---|
| **CONFIRMED（原文不一致／欠陥）** | **0（ゼロ）** | 金額不一致・10 倍/100 倍誤り・控除方向誤り・算術不一致・needle MISS・公理混入・反例矛盾はいずれも検出されず。 |
| **BY-DESIGN** | **9** | B1 一万円の「整数」を Nat（非負）で表現、caller-established／B2 第四号合計額・該当性は caller-established（該当なしは `item4Total=0`）／B3 `residualCeiling` の saturating 減算（原文に「零を下回る場合零」の明示句なし。法的詳細は主張しない）／B4 `maxAllowedUnits` は便宜的派生量で端数切り捨て／B5 art.18 一号の該当性（資本金・相互会社等）NOT MODELLED／B6 前条適用判定 NOT MODELLED、二分の一を caller-established `TaxRate` で受領／B7 割合は caller-established `TaxRate`、丸めは `applyFloor`（原文に丸め規則の明示なし）／B8 区画認定・面積・課税価格からの控除適用（art.22）・端数処理等 NOT MODELLED／B9 needle の U+3000 正規化 nuance（T-3 注記。正規化テキストでは 8/8 FOUND）。 |
| **UNRESOLVED** | **0** | 機械的照合で解けない法的判断の保留は、いずれも B3 / B5〜B8 の BY-DESIGN 境界に包含したため独立件はゼロ。 |

- **CONFIRMED / BY-DESIGN / UNRESOLVED 件数: 0 / 9 / 0**。
- **発見ゼロ（CONFIRMED ＝ ゼロ）を明示する。** 件数を手柄にしない。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` のみ 10 件（許容範囲）、監査は正常（exit 0）。
- **needle 健全性**: U+3000 **0 本**、CI 実装の **8/8 FOUND**（MISS 0、すべて count 1）、CI ゲート 139 PASS / 0 FAIL。
- **反例**: 不一致 **0 件**（指定境界 6 種をすべて走査、追加不変式走査も PASS）。
- **追記**: 本セクション `## Batch T review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。Lean モジュールは一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・金額/算術の Arabic 数値照合・最大値/減算/1/2 係り受けの独立再計算・CI needle の `.find()` 検証・反例走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch U review (2026-11-20)

対象: `JapanTaxLaw/SpecialDeliveryTaxMarch.lean`（特別交付税に関する省令 art.10 / law `351M50000008035`,
revision `351M50000008035_20260316_508M60000008025`）および `JapanTaxLaw/ExplorationReserve.lean`
（租税特別措置法施行規則 art.9 / law `332M50000040015`,
revision `332M50000040015_20261101_507M60000040026`）。一次資料は pinned raw の 2 ファイルのみ。
coordinator の要約・`docs/STAGING_SDTM.md` / `STAGING_EXPL.md` の申告は一切信じず、
pinned JSON の `law_full_text` ツリーを Python で直接再帰走査して leaf 文字列を連結し、
率・金額・算術を独立抽出して Lean 定数と照合した。Lean モジュールは読み取り専用で一切変更していない。

### U-1. 独立抽出結果（pinned 原文からの直接 parse）

| 項目 | 独立抽出（pinned leaf テキストを直接走査） | Lean 側の定数/式 |
|---|---|---|
| art.10 本文 | 1052 chars、U+3000 **0**（SupplProvision 配下の `Article Num=10` を選択）。冒頭「（東日本大震災に係る道府県の三月分の算定方法の特例）第十条令和七年度に限り、第四条第一項第一号の額は…」 | doc-comment の 1052 chars / U+3000 0 と一致 |
| art.10 率 | 「〇・八」を **4 回**、「〇・七」を **1 回**検出。十進表記「〇・八 = 0.8」「〇・七 = 0.7」を直接確認（「八割」等の等価表記ではない） | `rate08=⟨8,10⟩`, `rate07=⟨7,10⟩`（`TaxRate.applyFloor r m = m*r.num/r.den` を `TaxFinance.lean` で直接確認 → 1000→800 / 1000→700） |
| art.10 丸め | 「表示単位は千円とし、表示単位未満の端数があるときは、その端数を四捨五入する。」を検出 | `roundToThousand x=(x+500)/1000*1000`（四捨五入、500 で切り上げ） |
| art.10 加算 | 「…の合算額を加えた額とする。」を検出。対象は「次の各号によって算定した額」＝一号〜八号（附則第八条第一項第一号〜第八号の参照を 8 本すべて検出） | `marchAmount = base + totalAddition i1..i8` |
| art.9 本文 | 484 chars、U+3000 **0**（MainProvision 配下の `Article Num=9`、探鉱準備金の条） | doc-comment の 484 chars / U+3000 0 と一致 |
| art.9 割合 | 「第一号に掲げる金額が第二号に掲げる金額のうちに占める割合を**乗じて**計算した金額」を逐語検出。「加えた」「加算」「+」「足す」は本文に **1 回も出現しない** | `explorationReserve = base * first / second`（乗算形。art.148 の誤った `+` の再発なし） |
| art.9 控除 | 「…鉱物等がある場合には、当該鉱物等の取得に要した金額を**控除した金額**」を 2 箇所（本文括弧内・第二号）で検出 | `netSalesAmount = if acquisition ≤ sales then sales - acquisition else 0`（saturating） |
| art.9 その他 | 「著しく異なるときは、その通常受けるべき金額」を検出（金額式外の caller-established 選択） | Bool は金額式に入れず scope 境界として明示 |

### U-2. 独立判定（2 点）

| # | 対象 | 判定 | 根拠（pinned 原文との独立照合） |
|---|---|---|---|
| 1 | art.10 | **CONFIRMED（一致・不一致なし）** | 「〇・八=8/10・〇・七=7/10」（80/10・70/10 の 10 倍誤りでない）を原文の十進表記から直接確認し、`rate08/rate07` と一致。「表示単位は千円…四捨五入」は `roundToThousand` の half-up（499→0 / 500→1000）と一致。「合算額を加えた額」は `base + Σ(8 号)` の加算形と一致。8 号すべての附則参照を検出。 |
| 2 | art.9 | **CONFIRMED（一致・不一致なし）** | 「占める割合を**乗じて**計算した金額」を原文逐語で確認し、`base * first / second` の乗算形と一致（原文に加算語は皆無、art.148 の `+` 失敗は再発していない）。「取得に要した金額を控除した金額」は saturating 減算と一致。分母 0・一号>二号・端数は原文が沈黙する境界で、モデルは安全な全関数として処理。 |

### U-3. needle 健全性（8 本を直接検証）

`STAGING_SDTM.md` / `STAGING_EXPL.md` の申告を信じず、`scripts/ci/transcription_audit.py` に実際に
組み込まれた needle 文字列（`SpecialDeliveryTaxMarch.lean` 4 本 / `ExplorationReserve.lean` 4 本）を取得し、
pinned 本文から独立抽出した正規化 leaf テキスト（art.10 = 1052 chars、art.9 = 484 chars）に対して照合した。

| check | needle 本数 | U+3000 を含む本数 | FOUND | count |
|---|---:|---:|---:|---:|
| SpecialDeliveryTaxMarch.lean（351M50000008035） | 4 | 0 | 4/4 | すべて 1 |
| ExplorationReserve.lean（332M50000040015） | 4 | 0 | 4/4 | すべて 1 |
| **合計** | **8** | **0** | **8/8（MISS 0）** | **すべて 1** |

- 各 needle の offset（正規化テキスト）: art.10 = 0 / 81 / 183 / 923、art.9 = 0 / 207 / 347 / 405。
  いずれも count = 1 で一意。U+3000 を含む needle は **0 本**。
- CI ゲート `python scripts/ci/transcription_audit.py` は **exit 0（141 PASS / 0 FAIL）**。
  両 cycle-9 check（SpecialDeliveryTaxMarch / ExplorationReserve）とも PASS。

### U-4. 反例探索（独立再計算 vs Lean モデル）

`by decide` スモークを信じず、Python で Nat セマンティクス（`applyFloor` の floor、整数除算、saturating 減算）を
独立再実装し、指定境界を走査した。

| 対象 | 境界ケース | 独立計算 | Lean / モデル式 | 結果 |
|---|---|---|---|---|
| art.10 | 〇・八 10 倍誤り検出: survey 1000 | 8/10 → 800（10 倍誤りの 80/10 なら 8000） | `rate08=⟨8,10⟩`, `scaledSurvey 1000 rate08=800` | 一致（10 倍誤りなし） |
| art.10 | 〇・七 10 倍誤り検出: survey 1000 | 7/10 → 700（70/10 なら 7000） | `rate07=⟨7,10⟩`, `scaledSurvey 1000 rate07=700` | 一致（10 倍誤りなし） |
| art.10 | 四捨五入 499 / 500 / 1500 | 0 / 1000（500 で切り上げ）/ 2000 | `roundToThousand 499=0`, `500=1000`, `1500=2000` | 一致 |
| art.10 | 控除 > 対象（100 から 150 を控除） | 0（saturating） | `itemAfterDeduction 100 150=0` | 一致 |
| art.10 | 合算額を加えた額: base 100 + 10..80 | 460 | `marchAmount 100 10 20 30 40 50 60 70 80=460` | 一致 |
| art.9 | 乗算形（base 1000, 一号 1, 二号 2） | 1000×1/2 = 500（加算なら 1000+1+2 等となり不一致） | `explorationReserve 1000 0 1 2=500` | 一致（`+` なし） |
| art.9 | 取得控除後の乗算（1000−200=800, 1/2） | 400 | `explorationReserve 1000 200 1 2=400` | 一致 |
| art.9 | 分母 0（二号 = 0） | 0（安全版） | `explorationReserve 1000 0 5 0=0` | 一致 |
| art.9 | 一号 > 二号（3/2） | 1000×3/2 = 1500（クランプなし） | モデル式 `base*first/second` = 1500 | 一致（原文に上限の明示なし） |
| art.9 | 控除 > 対象（売上 1000, 取得 1500） | 0（saturating） | `netSalesAmount 100 150=0` / `expl(1000,1500,1,2)=0` | 一致 |
| art.9 | 端数切り捨て（100, 一号 1, 二号 3） | 33（floor、原文に丸め規則なし） | `explorationReserve 100 0 1 3=33` | 一致 |

- **反例（不一致）検出数: 0 件**。桁違い（10 倍）・加算混入（art.148 型）・控除方向逆転・
  saturating 境界・丸め境界の誤りはいずれも検出されず。

### U-5. 公理監査（`lake env lean` / `#print axioms`）

対象 2 モジュールに加え cycle-9 の Spec/Tests モジュールを import し、
名前付き宣言 **30 件**を全件走査（`Lean.collectAxioms`）/ `#print axioms` を実行（**exit code 0**、
全 import と全 `by decide` smoke もコンパイル成功）。監査用 one-off ファイルは approved temp dir に置き、
run 後に削除、repo には残していない。

| 項目 | 結果 |
|---|---:|
| 走査宣言数 | **30**（SDTM 系 + EXPL 系、Spec/Tests を含む） |
| axiom-free（`does not depend on any axioms`） | **28** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` のみ（許容） | **2 件**（`roundToThousand_mono`, `explorationReserve_zero_denominator`） |
| `sorry` / `admit` / `axiom` / `unsafe` / `noncomputable` の実使用 | **0 件**（6 モジュールを走査） |

- propext 依存は上記 2 定理のみで、いずれも `if`・Nat 減算・単純定理に由来する core `propext`。
  **禁止公理の混入はゼロ**。

### U-6. 分類・最終報告

| 分類 | 件数 | 内容 |
|---|---:|---|
| **CONFIRMED（原文不一致／欠陥）** | **0（ゼロ）** | 率の 10 倍誤り・加算混入（art.148 型）・控除方向誤り・丸め境界誤り・算術不一致・needle MISS・公理混入・反例矛盾はいずれも検出されず。 |
| **BY-DESIGN** | **10** | B1 〇・八/〇・七を `⟨8,10⟩/⟨7,10⟩` の分数で表現（乗算の中間端数は `applyFloor` の切り捨てを modeling choice として明示）／B2 特定県該当性・号ごとの率適用は caller-established `TaxRate`（Bool を金額式に入れない）／B3 `itemAfterDeduction` の saturating 減算（原文に零下限の明示句なし）／B4 四捨五入を各号ごとに適用してから合算（原文「各号によって算定した額…の合算額」）、ちょうど 500 の half-up は日本語「四捨五入」の慣習解釈／B5 令和七年度・附則第八条各号の具体的算定・第四条表の各号 NOT MODELLED／B6 art.9 の割合は整数除算 `base*first/second` で floor（原文に丸め規則の明示なし、1/3→33 を境界として明示）／B7 `firstOverSecond` は未使用の補助定義であり、実計算は乗算先行の `base*first/second`（将来の誤用注意）／B8 分母 0 → 0 の安全版（原文沈黙）／B9 一号>二号（割合>1）をクランプせず原文の算術に忠実（「占める割合」≤1 が暗黙前提かは人間の法的レビューに委ねる）／B10 著しく異なるときの「通常受けるべき金額」選択・鉱物定義・選鉱後価格の具体算定 NOT MODELLED。 |
| **UNRESOLVED** | **0** | 機械的照合で解けない法的判断の保留は、いずれも BY-DESIGN 境界（特に B9）に包含したため独立件はゼロ。 |

- **CONFIRMED / BY-DESIGN / UNRESOLVED 件数: 0 / 10 / 0**。
- **発見ゼロ（CONFIRMED ＝ ゼロ）を明示する。** 件数を手柄にしない。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` のみ 2 件（許容範囲）、監査は正常（exit 0）。
- **needle 健全性**: 8 本、U+3000 **0 本**、正規化テキスト **8/8 FOUND**（MISS 0、すべて count 1）、CI ゲート 141 PASS / 0 FAIL。
- **反例**: 不一致 **0 件**（指定境界 6 種をすべて走査、10 倍誤り・加算混入・saturating・分母 0・一号>二号・端数切り捨てを含む）。
- **追記**: 本セクション `## Batch U review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記
  （coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。
  Lean モジュールは一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・率/金額/算術の独立抽出と再計算・needle の直接検証・反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Batch V review (2026-11-20)

### V-0. 範囲・独立性・手法

- **レビュア**: Adversarial Review Agent。形式化担当と独立に **cycle-10** の 2 モジュールを原文照合・反例探索した。coordinator の要約・`docs/STAGING_QR.md` / `docs/STAGING_SCT.md`・doc-comment の数値／算術主張は**一切信じず**、pinned 原文 JSON から Python 3.12.10 で直接再抽出・再計算して照合した（art.148 型の「要約依存」失敗の再発回避）。
- **対象モジュール（読み取り専用・一切変更せず）**:
  - `JapanTaxLaw/QualifiedInvoiceTaxAmount.lean`（消費税法施行令 art.70の10）
  - `JapanTaxLaw/CorporateSpecialTaxBase.lean`（法人特別税法 art.9）
  - 各 `*Spec.lean` / `*Tests.lean` は誤り伝播の確認のため参照のみ（判定根拠には使用せず）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/363CO0000000360_20261101_507CO0000000125.law.json`（law_id `363CO0000000360`、revision 一致、適用日 2026-11-01、`MainProvision/Article` の `第七十条の十`）
  - `data/raw/404AC0000000015_20010401_413AC0000000006.law.json`（law_id `404AC0000000015`、revision 一致、法題 `法人特別税法`、`MainProvision/Article` の `第九条`）
- **抽出法**: `law_full_text` を再帰平坦化し `tag="Article"` を直接走査。`ArticleTitle` で対象条を同定し、配下の文字列を文書順に連結（`re.sub(r"[\s\u3000]+","",…)` で正規化）。率・金額・算術は原文文字列を独立にパースし、Python の整数演算で再計算して Lean 定数／kernel-decide smoke と比較した。
- **書き込みは `docs/ADVERSARIAL_REVIEW.md` の本セクション追記のみ**。Lean モジュール / Spec / Tests / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、すべて削除済み（repo 内には作成せず）。

### V-1. 独立抽出結果（pinned 原文 → 数値 → Lean 定数）

平坦化した対象条の本文長・U+3000 は doc-comment 主張と一致（QII 356 文字 / U+3000 0、CST 568 文字 / U+3000 0）。

**art.70の10（QII）— 原文Literal と Lean 定数**

| 箇所 | pinned 原文リテラル（出現回数） | 独立抽出 | Lean 定数 | 照合 |
|---|---|---|---|---|
| 方法1 通常 | `百分の十`（1） | 10/100 | `standardRateExclusive = ⟨10,100⟩` | 一致 |
| 方法1 軽減 | `百分の八`（1） | 8/100 | `reducedRateExclusive = ⟨8,100⟩` | 一致 |
| 方法2 通常 | `百十分の十`（1） | 10/110 | `standardRateInclusive = ⟨10,110⟩` | 一致 |
| 方法2 軽減 | `百八分の八`（1） | 8/108 | `reducedRateInclusive = ⟨8,108⟩` | 一致 |

原文（逐語・正規化後、全文 356 文字）:
> （適格請求書に記載すべき消費税額等の計算）第七十条の十法第五十七条の四第一項第五号に規定する政令で定める方法は、次の各号に掲げる方法のいずれかとする。この場合において、当該各号に掲げる方法により算出した金額に一円未満の端数が生じたときは、当該端数を処理するものとする。一…税抜価額を税率の異なるごとに区分して合計した金額に**百分の十**（…**百分の八**）を乗じて算出する方法 二…税込価額を…合計した金額に**百十分の十**（…**百八分の八**）を乗じて算出する方法

**art.9（CST）— 原文Literal と Lean 定数**

| 箇所 | pinned 原文リテラル（出現回数） | 独立抽出 | Lean 定数 / 式 | 照合 |
|---|---|---|---|---|
| 年控除額 | `年四百万円`（1） | 4,000,000 | `annualDeduction = 4_000_000` | 一致 |
| 1年課税事業年度 | `基準法人税額から年四百万円を控除した残額`（1） | base − 4,000,000（saturating） | `standardTaxBase base = if 4_000_000 ≤ base then base − 4_000_000 else 0` | 一致 |
| 1年未満の読替え | `四百万円を十二で除し、これに当該課税事業年度の月数を乗じて計算した金額`（1） | (4,000,000 ÷ 12) × 月数（除算先行・切捨て） | `partialDeduction months = (4_000_000 / 12) * months` | 一致 |

原文（逐語・正規化後、該当部分）:
> （各課税事業年度の法人特別税の課税標準）第九条…２各課税事業年度の課税標準法人税額は、各課税事業年度の基準法人税額から**年四百万円**を控除した残額とする。３課税事業年度が一年に満たない法人…同項中「年四百万円」とあるのは、「**四百万円を十二で除し、これに当該課税事業年度の月数を乗じて計算した金額**」とする。

### V-2. 最重要チェック 2 点の独立判定（art.148 型失敗の回避）

**判定 1 — art.70の10 の率・分母: 原文どおり（CONFIRMED 忠実、食い違い 0）**

- 独立抽出の結果、方法1 は `百分の十 = 10/100`・軽減 `百分の八 = 8/100`、方法2 は `百十分の十 = 10/110`・軽減 `百八分の八 = 8/108` であり、Lean の 4 定数（`⟨10,100⟩` / `⟨8,100⟩` / `⟨10,110⟩` / `⟨8,108⟩`）と**完全一致**。
- **10倍／100倍誤りなし**: もし 100/100 なら `fromExclusive 1000 = 1000`（正しくは 100）、もし軽減を 10/100 なら 100（正しくは 80）。いずれも smoke と矛盾する。
- **分母混同なし**: 税込を 10/100 とすれば `fromInclusive 1100 = 110`（正しくは 100）、軽減を 8/100 とすれば `fromInclusive 1080 = 86`（正しくは 80）。Lean は 100 / 80 を返し、分母 110 / 108 を採用していることが独立に確認できた（10/100 や 8/100 の誤用ではない）。
- 4 つの `*_num_den` 定理（`num=10,den=100` 等）も原文リテラルと一致。

**判定 2 — art.9 の控除額・算術順序: 原文どおり（CONFIRMED 忠実、食い違い 0）**

- **`annualDeduction = 4_000_000`**: 原文 `四百万円`。桁違いなし（10 倍 40,000,000 でも 1/10 の 400,000 でもない）。
- **saturating 減算**: `基準 10,000,000 → 6,000,000`、`3,000,000 → 0`、`4,000,000 → 0`（境界）、`4,000,001 → 1` を独立再計算し Lean と一致。「控除した残額」を `Money = Nat` で表現する際の下限 0 は原文に明示句がない modeling choice（B-V7）。
- **除算先行・切り捨て**: `partialDeduction 6 = (4,000,000 / 12) * 6 = 333,333 * 6 = 1,999,998`。もし乗算先行なら `(4,000,000*6)/12 = 2,000,000` となり **2 円差**が出る。Lean は 1,999,998 を返し、原文の「十二で除し、これに…月数を乗じて」という語順（除算先行）を正しく実装している。
- **月数 12 の不一致点**: `partialDeduction 12 = 3,999,996` で、厳密な年額 4,000,000 と **4 円異なる**。これは原文の読替えが整数除算（4,000,000/12 = 333,333 切捨て）を伴うことの必然的帰結であり、doc-comment／smoke が「月数 12 でも月割りを使うと 3,999,996（厳密な 400万と異なる）」と**明示している**。隠蔽ではなく、原文の算術順序に忠実な結果（BY-DESIGN・B-V8 参照）。

→ **2 点とも原文に忠実であり、数値・率・算術の原文との食い違いは 0 件（ゼロ）。**

### V-3. needle 健全性（7 本を CI 実装から直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、2 対象モジュールに対応する **2 check** から needle 文字列を取得（手打ちせず、STAGING の申告も信じない）。pinned `law_full_text` の正規化テキスト（CI `contains()` / `_norm()` と同一条件）に対して `.find()` / `.count()` を実行した。

| check | needle 数 | 長さ | U+3000 | `.find()` | `.count()` |
|---|---:|---|---|---:|---|
| QII `QualifiedInvoiceTaxAmount.lean`（law 363CO…） | 4 | 74/49/79/81 | 0 | 4/4 FOUND | 全て 1 |
| CST `CorporateSpecialTaxBase.lean`（law 404AC…） | 3 | 54/49/35 | 0 | 3/3 FOUND | 全て 1 |
| **合計** | **7** | — | **0 件** | **7/7 FOUND** | MISS 0 |

- 正規化テキスト長: QII = 246,024 文字、CST = 8,720 文字。needle offsets（正規化）: QII = 117421 / 117505 / 117586 / 117696、CST = 1773 / 1829 / 1931。
- CI の needle は `STAGING_QR.md` / `STAGING_SCT.md` の JSON ブロックと**文字列一致**であり、STAGING 側での改変・全角混入は検出されなかった。
- **needle 健全性: 問題なし（7/7 FOUND、U+3000 0 件、MISS 0、すべて count 1）。**

### V-4. 反例探索結果

| 攻撃対象 | 独立期待値 | Lean | 結果 |
|---|---|---|---|
| QII 方法1 通常 `1000 × 10/100` | 100 | 100 | 一致（10 倍誤りなし） |
| QII 方法1 軽減 `1000 × 8/100` | 80 | 80 | 一致 |
| QII 方法2 通常 `1100 × 10/110` | 100 | 100 | 一致（分母 110 を確認） |
| QII 方法2 軽減 `1080 × 8/108` | 80 | 80 | 一致（分母 108 を確認） |
| QII 端数 `999 × 10/100` / `12345 × 10/100` | 99 / 1234 | 99 / 1234 | 一致（Spec grid も含有） |
| QII 税込分母を 100 と誤用した場合 | 110（≠100） | — | モデルは 110 を返さず誤用を回避 |
| CST 基準 `3,999,999` / `4,000,000` / `4,000,001` | 0 / 0 / 1 | 0 / 0 / 1 | 一致（saturating 境界） |
| CST 月数 1 の端数 | 333,333 | 333,333 | 一致（4,000,000/12 切捨て） |
| CST 月数 6（除算先行 vs 乗算先行） | 1,999,998 vs 2,000,000 | 1,999,998 | 一致（除算先行を確認） |
| CST 月数 12 | 3,999,996（≠4,000,000） | 3,999,996 | 一致（4 円差を doc が明示） |
| CST `partialTaxBase 10,000,000 6` | 8,000,002 | 8,000,002 | 一致 |
| CST `partialTaxBase 3,000,000 12`（控除>基準） | 0（saturating） | 0 | 一致 |
| 単調性 `standardTaxBase_le` / `partialTaxBase_le` | base 以下の上限を保持 | 定理で証明 | 反例なし |

- Spec の `agreeQualifiedInvoiceTaxAmount` / `agreeCorporateSpecialTaxBase` は独立定式との一致を `by decide` で確認（grid 入力 0/1/100/999/1000/1001/12345/999999 等、月数 1/6/12/13 を含む）。
- **反例探索で検出された原文・Lean 間の数値矛盾: 0 件（ゼロ）。**

### V-5. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchV_axiom_probe.lean` を作成し、2 モジュールの名前付き `def` / `theorem` 計 **17 宣言**（QII 11 / CST 6）すべてに `#print axioms` を実行（`lake env lean`、Lean 4.35.0、exit code **0**、エラー 0）。監査後、一時ファイル群は削除済み。
- ソース走査でも 2 モジュールに `sorry` / `axiom` / `Classical` / `Quot.sound` / `propext` の文字列は **0 件**（`by decide` のみ）。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 17（QII 11 / CST 6） |
| axiom-free（`does not depend on any axioms`） | **17（全件）** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず、propext も 0 件。公理監査は合格。**

### V-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED**（原文との数値・率・算術の食い違い） | **0（ゼロ）** |
| **BY-DESIGN**（申告済みの境界・modeling choice） | **8** |
| **UNRESOLVED**（pinned 原文のみでは解けない法的判断） | **2** |

> **発見ゼロ（CONFIRMED ＝ ゼロ）を明示する。** 率の 10 倍／100 倍誤り・分母混同（110 vs 100、108 vs 100）・400 万円の桁違い・月割り順序の誤り・saturating 境界・needle MISS・公理混入・反例矛盾はいずれも検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- V-1／V-2 のとおり、art.70の10 の 4 率と art.9 の控除額・算術は原文どおり（完全一致）。
- needle 7/7 FOUND、U+3000 0、禁止公理 0、反例矛盾 0（V-3〜V-5）。

#### BY-DESIGN（8 件）

- **B-V1** QII の税抜／税込合計額・軽減対象該当性は caller-established。Bool を金額式に入れない設計を doc-comment が明記。
- **B-V2** 税率は `TaxRate` として caller-established で受け取る（定数値自体は原文どおり）。
- **B-V3** 端数処理は `applyFloor`（切り捨て）を採用。法的正当性は U-V1 で保留。
- **B-V4** QII doc-comment の「round half up を既定提示」「丸め関数は caller-established で受け取る」という記述は、実装（丸め関数パラメータなし・`applyFloor` 固定・`roundYen` は `x + 0` の no-op）とやや不正確。ただし切捨ては許容された modeling choice であり、**数値・率への影響はなし**（Batch R B-12 と同種の記述の緩み）。
- **B-V5** 法57条の4第1項第4号の「税率の異なるごとに区分」の具体的方法・第七十条の十の他号・端数処理の省令上の詳細は NOT MODELLED（申告済み）。
- **B-V6** CST の基準法人税額・月数は caller-established。
- **B-V7** CST の saturating 減算（基準 < 400万 → 0）。原文は「控除した残額」を負数として定義しない。
- **B-V8** CST 第4項（最後の課税事業年度の按分）・第5項（月数の暦計算・1月未満切上）は NOT MODELLED（doc-comment 申告済み）。月数 12 で 3,999,996 となる点も doc-comment／smoke が明示。

#### UNRESOLVED（2 件）

- **U-V1 端数処理（floor）の法的正当性（QII 共通）**: 原文は「当該端数を処理するものとする」とし、丸め方向（切捨て／切上げ／四捨五入）を指定しない。モデルは `applyFloor` を採用するが、法律上求められる丸めは pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**（従来バッチ U-1 と同趣旨）。
- **U-V2 附則第十四条の経過措置のスコープ判断（QII）**: pinned 原文（law 363CO…）の附則第十四条は、26年／元年経過措置資産について第七十条の十の軽減率を `百分の五`・`百五分の五` に読み替える（原文に `百五分の五` は 3 回出現、機械確認済み）。対象モジュールの doc-comment は主文（10/100・8/100・10/110・8/108）のみを対象とし、当該読替えへの言及がない。本スライスで対象外とするのは妥当な範囲設定か、被覆すべきかは法解釈の問題で pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。通常税率の主文は正しく、数値影響はない。

### V-7. 総合判定・最終報告（サマリ）

- pinned revision `363CO0000000360_20261101_507CO0000000125`（art.70の10）および `404AC0000000015_20010401_413AC0000000006`（art.9）の `law_full_text` から直接抽出した率・金額・算術を、coordinator 要約／STAGING に依存せず独立に再計算して照合した。4 率（`⟨10,100⟩` / `⟨8,100⟩` / `⟨10,110⟩` / `⟨8,108⟩`）・年控除 4,000,000・saturating 減算・除算先行の月割り（月数12で 3,999,996）のすべてが原文どおりであり、**10 倍誤り・分母混同・桁違い・月割り順序誤りは検出されなかった**。
- **CONFIRMED: 0 件（ゼロ）**／**BY-DESIGN: 8 件**／**UNRESOLVED: 2 件**。発見ゼロを明示する。
- **needle 健全性**: 7 本、U+3000 **0 本**、pinned 正規化テキスト **7/7 FOUND**（MISS 0、すべて count 1）。CI 実装の文字列を直接検証。
- **反例探索**: 端数・saturating・月割り 12 ヶ月の 4 円差・軽減率・分母混同を含む全ポイントで不一致 **0 件**。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` も **0 件**。17/17 宣言を走査、exit code 0。監査用一時 Lean ファイルは削除済み。
- **追記完了**: 本セクション `## Batch V review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。Lean モジュール / Spec / Tests / `data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・率／金額／算術の独立抽出と再計算・CI needle の直接検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断（U-V1／U-V2）は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。


---

## Batch W review (2026-11-20)

### W-0. 範囲・独立性・手法

- **レビュア**: Adversarial Review Agent。形式化担当と独立に **cycle-11** の 3 モジュールを原文照合・反例探索した。coordinator の要約・STAGING・doc-comment の数値／算術主張は**一切信じず**、pinned 原文 JSON の `law_full_text` から Python で直接再抽出・再計算して照合した（Batch S の art.148「要約依存」失敗の再発回避）。
- **対象モジュール（読み取り専用・一切変更せず）**:
  - `JapanTaxLaw/AmamiCurrencyConversion.lean`（奄美群島税法施行令 art.6 / law `328CO0000000407`）
  - `JapanTaxLaw/TonnageTax.lean`（とん税法 art.3 / law `332AC0000000037`）
  - `JapanTaxLaw/GasolineDeduction.lean`（揮発油税法施行令 art.2 / law `332CO0000000057`）
  - 各 `*Spec.lean` / `*Tests.lean`（計 9 ファイル、公理監査のため参照のみ）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/328CO0000000407_19660331_341CO0000000078.law.json`（revision `328CO0000000407_19660331_341CO0000000078`）
  - `data/raw/332AC0000000037_20250601_504AC0000000068.law.json`（revision `332AC0000000037_20250601_504AC0000000068`）
  - `data/raw/332CO0000000057_20250401_507CO0000000006.law.json`（revision `332CO0000000057_20250401_507CO0000000006`）
- **抽出法**: `law_full_text` を再帰平坦化し `tag="Article"` のうち `MainProvision` 配下の `第六条` / `第三条` / `第二条` を `ArticleTitle` で同定。配下の文字列を文書順に連結し `re.sub(r"[\s\u3000]+","",…)` で正規化（CI と同一条件）。needle は CI 実装 `scripts/ci/transcription_audit.py` の `checks()` を Python で import して文字列を取得（手打ちせず、STAGING の申告も信じない）。算術は Python の整数演算で独立再計算し Lean 定数／kernel-decide smoke と比較した。
- **書き込みは `docs/ADVERSARIAL_REVIEW.md` の本セクション追記のみ**。Lean モジュール / Spec / Tests / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない（`main` のまま）。解析用一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、**すべて削除済み**（repo 内には作成せず）。

### W-1. 独立原文抽出結果（pinned 原文 → 数値 → Lean 定数）

対象 3 条の正規化本文を逐語取得（見出し括弧を含む）。原文側の全角空白（U+3000）は正規化で除去される。needle の U+3000 含有は 0 本（W-3）。

| 条（law_id） | 抽出した正規化本文（逐語・一字一句改変なし） | 長さ | Lean 側の定数／式 |
|---|---|---:|---|
| art.6（328CO…0407） | `（通貨の換算）第六条奄美群島税法及びこれに基く規則の適用については、当該法令の規定に定められている金額は、当該金額一円につき三円の割合で換算した金額とする。` | 78 | `conversionFactor=3`、`convert a = a * 3` |
| art.3（332AC…0037） | `（課税標準及び税率）第三条とん税は、外国貿易船の純トン数を課税標準とし、次の各号に掲げる場合について当該各号に掲げる税率により課する。一開港への入港ごとに納付する場合純トン数一トンまでごとに十六円二開港ごとに一年分を一時に納付する場合純トン数一トンまでごとに四十八円` | 133 | `entryRate=16`、`annualRate=48`、`tonCeil`、`entryTax`/`annualTax` |
| art.2（332CO…0057） | `（欠減控除）第二条法第八条第一項の規定により揮発油の製造場から移出し、又は保税地域から引き取る揮発油の数量から控除する数量は、当該移出又は引取に係る揮発油の数量の百分の一・三五に相当する数量とする。` | 99 | `deductionNum=135`、`deductionDen=10000`、`deduction q = q*135/10000` |

キーフレーズの出現回数（対象条の正規化本文／pinned ファイル全体）を Python `.find()` / `.count()` で直接確認:

| キーフレーズ | 条内 count | ファイル全体 count | 意味 |
|---|---:|---:|---|
| `一円につき三円` | 1 | 1 | 一円→三円 = **3 倍** |
| `一円につき一円` / `一円につき三十円` | 0 / 0 | 0 / 0 | 1/3 倍・30 倍誤りの文字列は**不在** |
| `純トン数一トンまでごとに十六円` | 1 | 1 | 入港ごと = **16 円／トン** |
| `純トン数一トンまでごとに四十八円` | 1 | 1 | 一年分一時 = **48 円／トン** |
| `一トンまでごとに` | 2 | 3 | 一号・二号とも「一トンまでごとに」（切り上げ） |
| `十六円` / `四十八円` | 1 / 1 | 1 / 1 | 160/480 円（10 倍）の文字列は**不在** |
| `百分の一・三五` | 1 | 4 | **1.35/100 = 135/10000** |
| `百分の十三・五` | 0 | 0 | 13.5/100（10 倍誤り）の文字列は**不在** |

### W-2. 3 点の最重要チェック — 独立判定

**判定 1 — art.6「一円につき三円」= amount × 3（CONFIRMED 忠実）**

- 原文は `当該金額一円につき三円の割合で換算した金額` であり、換算割合は **3**（`一円につき三円` count 1）。`convert a = a * 3` と一致。
- `一円につき一円`（= 1/3 を意図する誤り）と `一円につき三十円`（= 30 倍誤り）は対象条・pinned ファイル全体とも **count 0**。3 倍誤り（1/3 や 30 倍）は**検出されなかった**。
- 境界: `convert 0 = 0` / `convert 1 = 3` / `convert 1000 = 3000`（Lean の `example` と独立再計算が一致）。単調性 `convert_mono` も `Nat.mul_le_mul_right 3` で順序保存。

**判定 2 — art.3「一トンまでごとに十六円」／「…四十八円」＋切り上げ（CONFIRMED 忠実）**

- 原文の一号は `純トン数一トンまでごとに十六円`、二号は `純トン数一トンまでごとに四十八円`（各 count 1）。`entryRate=16` / `annualRate=48` と一致。**16/48 円の桁違い（160/480）は原文に存在せず、モデルも 16/48**。
- 「**一トンまでごとに**」は一トン未満の端数も一トンとして数える趣旨であり、`tonCeil whole fraction = if fraction = 0 then whole else whole + 1` がこれを実装（fraction 0 → whole、非 0 → whole+1）。境界: `(10,0)→10` / `(10,1)→11`、したがって `entryTax 10 0 = 160` / `entryTax 10 1 = 176`、`annualTax 10 0 = 480` / `annualTax 10 1 = 528`（すべて Lean `example` と一致）。**一トン未満（例 `entryTax 0 1 = 16`）も 1 トン分として課税**される点を確認。
- 48 = 16 × 3 の関係も原文どおり。入港ごと／一年分一時の分岐は caller-established（W-6 B-W3）。

**判定 3 — art.2「百分の一・三五」= 数量 × 135/10000（CONFIRMED 忠実）**

- 原文 `当該移出又は引取に係る揮発油の数量の百分の一・三五に相当する数量`（`百分の一・三五` count 1）。十進「一・三五 = 1.35」を百分で割るので **1.35/100 = 135/10000 = 0.0135（1.35%）**。`deductionNum=135` / `deductionDen=10000` と一致。
- `deduction q = q * 135 / 10000`（Nat 除算で切り捨て）。境界: `deduction 10000 = 135`（1.35%）／`deduction 1000 = 13`（**13.5/100 や 1.35/10 なら 135 となる 10 倍誤りを回避**）／`deduction 0 = 0`／`deduction 1 = 0`（切捨て）／`deduction 100000 = 1350`。`百分の十三・五` は原文・モデルとも **count 0**。
- `deduction_le` の証明は `135 ≤ 10000` と `Nat.mul_div_right` によるもので、算術は妥当（公理は W-5 で監査）。

→ **3 点すべて原文に忠実であり、数値・率・算術の原文との食い違いは 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。

### W-3. needle 健全性（4 本を CI 実装から直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を import し、3 対象モジュールに対応する **3 check・計 4 本**（Amami 1 / Tonnage 2 / Gasoline 1）の needle 文字列を取得（手打ちせず、STAGING／doc-comment の申告は信じない）。pinned `law_full_text` の正規化テキスト（CI `contains()` / `_norm()` と同一条件）に対して `.find()` / `.count()` を実行した。

| check | needle 本数 | 長さ | U+3000 | FOUND | count |
|---|---:|---|---|---:|---|
| `AmamiCurrencyConversion.lean`（328CO…0407） | 1 | 77 | 0 | 1/1 | 1 |
| `TonnageTax.lean`（332AC…0037） | 2 | 66 / 66 | 0 | 2/2 | 1 / 1 |
| `GasolineDeduction.lean`（332CO…0057） | 1 | 98 | 0 | 1/1 | 1 |
| **合計** | **4** | — | **0 本** | **4/4（MISS 0）** | **すべて 1** |

- 正規化テキスト長: Amami = 24,449 / Tonnage = 9,982 / Gasoline = 15,837 文字。needle offsets（正規化）: Amami = 2834、Tonnage = 289 / 356、Gasoline = 617（すべて count = 1、一意）。
- **needle 健全性: 問題なし（4/4 FOUND、U+3000 0 本、MISS 0、すべて count 1）。** needle 文字列の改変・正規化・異体字変換はしていない。

### W-4. 反例探索（独立再計算 vs Lean モデル）

`by decide` スモークを信じず、Python で 3 モジュールの算術を独立再実装し、境界・3 倍／16・48 円／一トン未満切り上げ／1.35%／0／端数切り捨てを走査した。**不一致 0 件（MISMATCH_COUNT = 0）**。

| 標的 | 境界ケース | 独立計算 | Lean / モデル式 | 結果 |
|---|---|---|---|---|
| art.6 | `convert 0` / `1` / `1000` | 0 / 3 / 3000 | 同値 | 一致 |
| art.6 | 3 倍誤りガード: 1/3 なら `convert 3 = 1`、30 倍なら `convert 1 = 30` | モデルは 9 / 3 | `a*3` | 一致（誤り回避） |
| art.3 | `entryTax 10 0` / `10 1` | 160 / 176 | 同値 | 一致 |
| art.3 | `annualTax 10 0` / `10 1` | 480 / 528 | 同値 | 一致 |
| art.3 | `entryTax 0 0` / `0 1`（一トン未満も一トン） | 0 / 16 | 同値 | 一致（切り上げ確認） |
| art.3 | 10 倍ガード: 160/480 なら `entryTax 10 0 = 1600` | モデルは 160 | `ceil*16/48` | 一致（誤り回避） |
| art.2 | `deduction 0` / `1`（切捨て） | 0 / 0 | 同値 | 一致 |
| art.2 | `deduction 1000`（10 倍誤りなら 135 または 130） | 13 | `q*135/10000` | 一致（誤り回避） |
| art.2 | `deduction 10000` / `100000` | 135 / 1350 | 同値 | 一致 |
| art.2 | 1.35% ガード: 13.5/100 または 1.35/10 なら `deduction 1000 = 135` | モデルは 13 | `q*135/10000` | 一致（誤り回避） |
| art.2 | `deduction_le` 単調性 grid（q = 0..100000 step 7） | 全て `q*135/10000 ≤ q` | 定理で証明 | 反例なし |

- **反例（不一致）検出数: 0 件。** 3 倍誤り・16/48 円の桁違い・一トン未満切り上げの誤り・1.35% の 10 倍誤り・0／端数切り捨ての誤りはいずれも検出されず。

### W-5. 公理監査（`lake env lean` / `#print axioms`）

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchW_axiom_probe.lean` を作成し、3 モジュール＋Spec（Tests は名前付き宣言なし）の名前付き `def` / `theorem` 計 **20 宣言**（Amami 5 / Tonnage 9 / Gasoline 6）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**、エラー 0）。監査後、一時ファイル群は削除済み。

| 監査項目 | 結果 |
|---|---:|
| 走査宣言数 | 20（Amami 5 / Tonnage 9 / Gasoline 6） |
| axiom-free（`does not depend on any axioms`） | **19** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext`（許容） | **1 件**: `JapanTaxLaw.GasolineDeduction.deduction_le`（`simp`／Nat 除算由来の core `propext`） |

- **重点確認 — `GasolineDeduction.deduction_le` に `Quot.sound` は残っていないか**: 監査出力は `'JapanTaxLaw.GasolineDeduction.deduction_le' depends on axioms: [propext]` であり、**`Quot.sound` は含まれていない**。禁止公理（choice / sorryAx / Quot.sound）は全 20 宣言で 0 件（出力中に `Quot.sound` / `sorryAx` / `choice` の文字列は 0 行）。`deduction_le` は `135 ≤ 10000` と `Nat.mul_div_right` による比較証明で、`omega` 由来の `Quot.sound` 混入（Batch A の A-1 型）は再発していない。
- → **禁止公理は一切検出されず。許容された `propext` のみ。公理監査は合格。**

### W-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED**（原文との食い違い／欠陥） | **0（ゼロ）** |
| **BY-DESIGN**（申告済みの境界・modeling choice） | **8** |
| **UNRESOLVED**（pinned 原文のみでは解けない法的判断） | **2** |

> **発見ゼロ（CONFIRMED ＝ ゼロ）を明示する。** 3 倍誤り（1/3・30 倍）・16/48 円の桁違い・一トン未満切り上げの誤り・1.35% の 10 倍誤り・0／端数切り捨ての誤り・needle MISS・禁止公理混入・反例矛盾はいずれも検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- W-1／W-2 のとおり、art.6 の 3 倍、art.3 の 16/48 円と切り上げ、art.2 の 135/10000（1.35%）は原文どおり（完全一致）。
- needle 4/4 FOUND、U+3000 0、禁止公理 0（`deduction_le` に `Quot.sound` なし）、反例矛盾 0（W-3〜W-5）。

#### BY-DESIGN（8 件）

- **B-W1** 換算対象となる「当該法令の規定に定められている金額」は caller-established（Amami doc-comment 明示）。Bool や金額の抽出を金額式に入れない。
- **B-W2** `Money = Nat`（非負整数）による金額表現。原文に負数・還付の規定はなく、下限は呼出側の責任。
- **B-W3** 入港ごと／一年分一時納付の区分、純トン数そのものの算定は caller-established（Tonnage doc-comment 明示）。分岐 Bool を税額式に入れない。
- **B-W4** 「一トンまでごとに」の実装 `tonCeil` は、1 トン未満の端数を抽象的な非 0 残余として受け取り `whole+1` とする表現。原文の趣旨（一トン未満も一トン）に忠実だが、純トン数の具体的測定は呼出側の責任。
- **B-W5** Gasoline の数量は caller-established。控除数量は `q*135/10000`（Nat 除算・切捨て）で算出（原文に丸め方法の明示なし、法的妥当性は U-W1）。
- **B-W6** Tonnage の附則の経過措置・罰則、および各法の他の条項は NOT MODELLED（Tonnage doc-comment 明示）。反映漏れではない。
- **B-W7** 各 Spec の独立定式（`specConvert` / `specEntry` / `specAnnual` / `specDeduction`）は impl と同一の整数算術で、有限グリッドのみを検証（普遍的正確性を主張しない）。
- **B-W8** `deduction_le` が core `propext` に依存する点は本レビュー仕様で許容される（禁止公理ではない）。実装値・証明の正中には影響なし。

#### UNRESOLVED（2 件）

- **U-W1 Gasoline の端数処理（floor）の法的妥当性**: 原文は「数量の百分の一・三五に**相当する数量**」とし、1 円／1 リットル未満の端数の丸め方向（切捨て／切上げ／四捨五入）を指定しない。モデルは `q*135/10000` の Nat 除算（切捨て）を採用し Spec も一致するが、法律上求められる丸めは pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**（従来バッチの端数 U-1 と同趣旨）。
- **U-W2 Tonnage の純トン数算定と「一トンまでごとに」の法的詳細**: 原文は「外国貿易船の**純トン数**を課税標準とし…純トン数**一トンまでごとに**十六円／四十八円」と規定する。モデルは「一トン未満も一トン」として `tonCeil` を適用し、これは原文の文言どおりであるが、純トン数の定義・算定方法（トン数測度や端数の取扱い）は pinned 原文に無く他法令／政令に委任されている。当該抽象化で実務を十分に被覆しているかは法解釈の問題で、pinned 原文のみでは決定不能。**人間の法律専門家によるレビューを要する**。税額の数値（16/48 円と切り上げ）自体は原文と一致し、影響はない。

### W-7. 総合判定・最終報告（サマリ）

- 3 つの pinned revision の `law_full_text` から直接抽出した率・金額・算術を、coordinator 要約／STAGING／doc-comment に依存せず独立に再計算して照合した。「一円につき三円 = 3 倍」「一トンまでごとに 16/48 円＋一トン未満切り上げ」「百分の一・三五 = 135/10000（1.35%）」のすべてが原文どおりであり、**3 倍誤り・桁違い・10 倍誤り・切り上げ誤りは検出されなかった**。
- **CONFIRMED: 0 件（ゼロ）**／**BY-DESIGN: 8 件**／**UNRESOLVED: 2 件**。発見ゼロを明示する。
- **needle 健全性**: 4 本、U+3000 **0 本**、pinned 正規化テキスト **4/4 FOUND**（MISS 0、すべて count 1）。CI 実装の文字列を直接検証。
- **反例探索**: 3 倍／16・48 円／一トン未満切り上げ／1.35%／0／端数切り捨てを含む全ポイントで不一致 **0 件**。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` のみ 1 件（`GasolineDeduction.deduction_le`、`Quot.sound` なし）。20/20 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **追記完了**: 本セクション `## Batch W review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。Lean モジュール / Spec / Tests / `data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・率／金額／算術の独立抽出と再計算・CI needle の直接検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断（U-W1／U-W2）は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

---

## Batch X review (2026-11-20)

### X-0. 範囲・独立性・手法

- **レビュア**: Adversarial Review Agent。形式化担当と独立に **cycle-12** の 3 モジュールを原文照合・反例探索した。coordinator の要約・`docs/STAGING_*`・doc-comment の数値／算術主張は**一切信じず**、pinned 原文 JSON の `law_full_text` から Python 3.12.10 で直接再抽出・再計算して照合した（Batch S の art.148「要約依存」失敗の再発回避）。
- **対象モジュール（読み取り専用・一切変更せず）**:
  - `JapanTaxLaw/AuctionDepositValuation.lean`（国税徴収法施行令 art.42の5 / law `334CO0000000329`）
  - `JapanTaxLaw/GasolineTransferRounding.lean`（地方揮発油譲与税法 art.5 / law `330AC0000000113`）
  - `JapanTaxLaw/LegalRatePresentValue.lean`（相続税法施行令 art.12の4 / law `325M50000040017`）
  - 各 `*Spec.lean` / `*Tests.lean`（計 9 ファイル、公理監査のため参照のみ）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/334CO0000000329_20260525_507CO0000000244.law.json`
  - `data/raw/330AC0000000113_20190401_431AC0000000002.law.json`
  - `data/raw/325M50000040017_20260901_506M60000040016.law.json`
- **独立抽出法**: `law_full_text` を再帰平坦化し、`tag="Article"` のうち `MainProvision` 配下の `第四十二条の五` / `第五条` / `第十二条の四` を `ArticleTitle` で同定。配下文字列を文書順に連結し `re.sub(r"[\s\u3000]+","",…)` で正規化（CI と同一条件）。needle は CI 実装 `scripts/ci/transcription_audit.py` の `checks()` を **import して文字列を取得**（手打ちせず、STAGING の申告も信じない）。算術は Python 整数演算＋`fractions.Fraction` による厳密有理数で独立再計算し、Lean 定数／kernel-decide smoke と比較した。日本語数字は自前パーサ（五十万=500000、千=1000 等）で Arabic 変換した。
- **書き込みは `docs/ADVERSARIAL_REVIEW.md` の本セクション追記のみ**。Lean モジュール / Spec / Tests / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。作業ツリーには他エージェントによる untracked ファイルが存在するが、本レビューでは一切触れていない。解析用一時ファイルは approved temp dir（`C:\Users\junny\AppData\Local\Temp\opencode`）に置き、**すべて削除済み**。

### X-1. 独立原文抽出結果（pinned 原文 → 定数／算術）

対象 3 条の正規化本文を逐語取得（見出し括弧を含む）。原文側の全角空白（U+3000）は正規化で除去される。needle の U+3000 含有は 0 本（X-3）。文字数は各モジュールの doc-comment 申告（74 / 149 / 159）と一致。

| 条（law_id） | 抽出した正規化本文（逐語・一字一句改変なし） | 長さ | Lean 側の定数／式 |
|---|---|---:|---|
| art.42の5（334CO…0329） | `（公売保証金を徴しないで公売することができる財産の見積価額）第四十二条の五法第百条第一項（公売保証金）に規定する政令で定める金額は、五十万円とする。` | 74 | `threshold : Money := 500_000` |
| art.5（330AC…0113） | `（譲与時期ごとの譲与額の計算）第五条各都道府県及び市町村に対する前条第一項に規定する各譲与時期ごとに譲与すべき地方揮発油譲与税の額として前三条の規定を適用して計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該各譲与時期ごとに譲与すべき地方揮発油譲与税の額とする。` | 149 | `transferAmount a = a - a % 1000`（= `(a/1000)*1000`） |
| art.12の4（325M…0017） | `（法定利率による複利の計算で現価を算出するための割合）第十二条の四法第二十三条の二第一項第三号に規定する財務省令で定める割合は、法定利率に一を加えた数を同項第二号イに規定する配偶者居住権の存続年数で累乗して得た数をもつて一を除して得た割合（当該割合に小数点以下三位未満の端数があるときは、これを四捨五入する。）とする。` | 159 | `presentValuePerMille num den n`（r=`num/den`, n=存続年数） |

正規化テキスト長（pinned ファイル全体）: art.42の5 = 28,608 / art.5 = 10,481 / art.12の4 = 71,195 文字。

### X-2. 3 点の最重要チェック — 独立判定（art.148 型失敗の回避）

**判定 1 — art.42の5「五十万円」= 500,000（定数、桁違いなし）**

- 原文は `…に規定する政令で定める金額は、五十万円とする。` であり、`五十万円とする` の出現は **1 回**。自前パーサで `五十万 = 50 × 10^4 = 500,000` と独立変換。`threshold = 500_000` と一致。
- 桁違いガード: `五万円`（50,000）は対象条 **count 0**、`五百万円`（5,000,000）も **count 0**。誤記文字列は原文に存在せず、モデルも 500,000。**5 万／500 万の桁違いは検出されず**。
- 境界: 定数 500,000 そのもののみを提供し、見積価額の比較・公売保証金の算定は行わない（doc-comment が scope を明記 → BY-DESIGN B-X1）。

**判定 2 — art.5「千円未満の端数金額を控除した金額」= amount − (amount mod 1000)（千円単位切り捨て）**

- 原文は `計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて…` であり、`千円未満` count 1 / `端数金額を控除` count 1。自前パーサで `千 = 1,000`。千円未満の「千」の桁は正しい。
- 桁違いガード: `百円未満` / `万円未満` は対象条 **count 0**（百円・万円の誤りなし）。原文に「切り捨て」「切捨て」の語はないが、「端数金額を**控除した**金額」は残余（千円単位の floor）を一意に意味し、`amount - amount % 1000` と一致。切り上げ誤りの文字列・実装はなし。
- 境界: `transfer 0=0` / `999=0` / `1000=1000` / `1001=1000` / `12_345=12_000` / `12_999=12_000` / `999_999=999_000`（すべて独立再計算と Lean smoke が一致）。`transfer = (a/1000)*1000` との全等価性も 0..200,000 のグリッドで確認（不一致 0）。

**判定 3 — art.12の4「1/(1+r)^n を小数点以下三位に四捨五入」（逆数・累乗の向き正しい）**

- 原文逐語を要素分解: `法定利率に一を加えた数` = (1+r) → `配偶者居住権の存続年数で累乗して得た数` = (1+r)^n → `もつて一を除して得た割合` = 1 ÷ (1+r)^n → `小数点以下三位未満の端数…四捨五入` = 三位への四捨五入。各フレーズは対象条に count 1（`四捨五入` も対象条 count 1 = 原文に明示）。
- r = num/den とおくと 1/(1+r)^n = den^n/(den+num)^n。モデルは `growth=(den+num)^n` として `(1000*den^n + growth/2)/growth`（整数除算）を返す。これは `round_half_up(1000 × 1/(1+r)^n)`、すなわち割合を小数点以下三位に四捨五入した値の per-mille 整数表現であり、原文と等価。厳密有理数（`Fraction`）による独立参照との一致を 14 ケース＋グリッド 14,760 通数で確認（不一致 0）。
- 境界: n=0 → 1000（割合 1.000）/ r=0（num=0）→ 1000 / `pv(10,100,1)=909` / `pv(10,100,2)=826` / `pv(5,100,3)=864`、すべて一致。四捨五入の半端境界 `pv(15,1,1)` は 1000/16 = 62.5 → **63**（四捨五入の繰り上げを確認、切り捨てなら 62）。
- **向きガード**: もし累乗／逆数を誤れば `pv(10,100,1)=1100`、`pv(10,100,2)=1210`、`pv(5,100,3)=1158` となるところ、正しいモデルは 909 / 826 / 864。**逆数・累乗の向き誤りは検出されず**。growth=0（den=0）は原文が沈黙する境界で `0` を返す安全な全関数（モデル選択 → B-X7）。

→ **3 点すべて原文に忠実であり、数値・算術の原文との食い違いは 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。

### X-3. needle 健全性（5 本を CI 実装から直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を import し、3 対象モジュールに対応する **3 check・計 5 本**（Auction 1 / Gasoline 2 / LegalRate 2）の needle 文字列を取得（手打ちせず、STAGING／doc-comment の申告は信じない）。pinned `law_full_text` の正規化テキスト（CI `contains()` / `_norm()` と同一条件）に対して `.count()` / `.find()` を実行した。

| check | law_id | needle 本数 | 長さ | U+3000 | FOUND | count | offset（正規化） | 全文長 |
|---|---|---:|---|---|---:|---|---|---:|
| `AuctionDepositValuation.lean` | 334CO…0329 | 1 | 73 | 0 | 1/1 | 1 | 20645 | 28608 |
| `GasolineTransferRounding.lean` | 330AC…0113 | 2 | 65 / 69 | 0 | 2/2 | 1 / 1 | 1752 / 1831 | 10481 |
| `LegalRatePresentValue.lean` | 325M…0017 | 2 | 62 / 55 | 0 | 2/2 | 1 / 1 | 9712 / 9776 | 71195 |
| **合計** | — | **5** | — | **0 本** | **5/5（MISS 0）** | **すべて 1** | — | — |

- **needle 健全性: 問題なし（5/5 FOUND、U+3000 0 本、MISS 0、すべて count 1＝一意）。** needle 文字列の改変・正規化・異体字変換はしていない。

### X-4. 反例探索（独立再計算 vs Lean モデル）

`by decide` スモークを信じず、Python で 3 モジュールの算術を独立再実装し、境界・桁違い・向き誤り・丸めを走査した。**不一致 0 件（MISMATCH_COUNT = 0）**。

| 標的 | 境界ケース | 独立計算 | Lean / モデル式 | 結果 |
|---|---|---|---|---|
| art.42の5 | 五十万 / 五万（誤り） / 五百万（誤り） | 500000 / 50000 / 5000000 | `threshold = 500000` | 一致（桁違い回避）。誤記文字列は原文 count 0 |
| art.5 | `transfer 0` / `999`（千円未満） | 0 / 0 | 同値 | 一致 |
| art.5 | `transfer 1000` / `1001`（境界） | 1000 / 1000 | 同値 | 一致 |
| art.5 | `transfer 12_345` / `12_999` / `999_999` | 12000 / 12000 / 999000 | 同値 | 一致 |
| art.5 | 百円／万円ガード（誤りなら 100 / 10000） | 原文 count 0、`千` count 1 | `… % 1000` | 一致（誤り回避） |
| art.5 | 全等価性 grid 0..200,000 | `a - a%1000 == (a/1000)*1000` | 定理＋ grid | 不一致 0 |
| art.12の4 | n=0（割合 1.000） | 1000 | `if n=0 then 1000` | 一致 |
| art.12の4 | r=0（num=0, n=1/5） | 1000 / 1000 | 同値 | 一致 |
| art.12の4 | `pv(10,100,1)` / `(10,100,2)` / `(5,100,3)` | 909 / 826 / 864 | 同値 | 一致 |
| art.12の4 | 四捨五入半端 `pv(15,1,1)`（62.5） | 63（繰り上げ） | 同値 | 一致（四捨五入確認） |
| art.12の4 | 向きガード（誤りなら 1100/1210/1158） | 正 909/826/864 | `den^n/(den+num)^n` | 一致（逆数・累乗誤り回避） |
| art.12の4 | den=0（原文沈黙の境界） | N/A | `growth=0 → 0` | モデル選択（B-X7） |
| art.12の4 | 厳密有理数 grid（num 0..40 × den 1..40 × n 0..8） | 14,760 通数 | 整数式 | 不一致 0 |

- **反例（不一致）検出数: 0 件。** 五十万円の桁違い（5 万／500 万）、千円の桁違い（百円／万円）・切り上げ誤り、現価の逆数／累乗の向き誤り、n=0・r=0・四捨五入の誤りはいずれも検出されず。

### X-5. 公理監査（`lake env lean` / `#print axioms`）

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchX_axiom_probe.lean` を作成し、9 ファイルの名前付き `def` / `theorem` 計 **11 宣言**（Auction 3 / Gasoline 4 / LegalRate 4）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**、エラー 0）。監査後、一時ファイル群（`batchX_axiom_probe.lean` / `batchX_review_probe.py` / `batchX_axiom_gen.py` / `batchX_grid.py`）は**すべて削除済み**。

| 監査項目 | 結果 |
|---|---:|
| 走査宣言数 | 11（Auction 3 / Gasoline 4 / LegalRate 4） |
| axiom-free（`does not depend on any axioms`） | **10** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext`（許容） | **1 件**: `JapanTaxLaw.LegalRatePresentValue.presentValuePerMille_zero_years`（`simp` 由来の core `propext`） |

- → **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された `propext` のみ。公理監査は合格。**

### X-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED**（原文との食い違い／欠陥） | **0（ゼロ）** |
| **BY-DESIGN**（申告済みの境界・modeling choice） | **9** |
| **UNRESOLVED**（pinned 原文のみでは解けない法的判断） | **2** |

> **発見ゼロ（CONFIRMED ＝ ゼロ）を明示する。** 五十万円の桁違い・千円の桁違い／切り上げ誤り・現価の逆数／累乗向き誤り・n=0/r=0/四捨五入の誤り・needle MISS・禁止公理混入・反例矛盾はいずれも検出されなかった。件数を手柄にしない。

#### CONFIRMED（0 件）

- X-1／X-2 のとおり、art.42の5 の 500,000 円、art.5 の千円単位切り捨て、art.12の4 の `1/(1+r)^n` の三位四捨五入は原文どおり（完全一致）。
- needle 5/5 FOUND、U+3000 0、禁止公理 0、反例矛盾 0（X-3〜X-5）。

#### BY-DESIGN（9 件）

- **B-X1** art.42の5 は閾値 500,000 の定数のみを提供し、見積価額の入力・比較・公売保証金の具体的算定・公売手続は NOT MODELLED（doc-comment 明示）。
- **B-X2** `Money = Nat`（非負整数）による金額表現。原文に負数・還付の規定はなく、下限は呼出側の責任。
- **B-X3** art.5 の「前三条の規定を適用して計算した金額」は caller-established。前三条の具体的算定・配分は NOT MODELLED（doc-comment 明示）。
- **B-X4** art.5 の「端数金額を控除」を `amount - amount % 1000`（= `(amount/1000)*1000`）で実装。原文に「切り捨て」の明示はないが、控除は残余を一意に意味し、千円未満 0/999/1000 の境界と整合。
- **B-X5** art.12の4 の法定利率 r = num/den（den>0）と存続年数 n は caller-established。財務省令で定められる法定利率の実数値・法 23 条の 2 第 1 項第 2 号イの存続年数の具体的算定は NOT MODELLED（doc-comment 明示）。
- **B-X6** 現価割合を per-mille 整数（小数点以下三位の整数表現）で返す表現選択。原文の「小数点以下三位未満の端数を四捨五入」を round-half-up の整数算術で実装（半端 62.5→63 を確認）。
- **B-X7** growth=0（den=0 等、原文が沈黙する境界）を `0` とする安全な全関数化。原文は割合が未定義な境界を規定せず、モデル選択として透明。
- **B-X8** 各 Spec の独立定式（`specThreshold` / `specTransfer` / `specPresent`）および `agree*` フラグは impl と同一の整数算術で、有限グリッドのみを検証（普遍的正確性を主張しない）。
- **B-X9** `presentValuePerMille_zero_years` が core `propext` に依存する点は本レビュー仕様で許容される（禁止公理ではない）。実装値・証明の正中には影響なし。

#### UNRESOLVED（2 件）

- **U-X1 法定利率の具体的数値の法的不确定性**: pinned 原文は割合を「法第二十三条の二第一項第三号に規定する財務省令で定める割合」とし、利率の実数値を本文に持たない。モデルは `num/den` を caller-established として受け取るため、**caller が実際に適用すべき利率を正しく供給しているかは pinned 原文のみでは決定不能**。数式 `1/(1+r)^n` 自体の一致には影響しないが、実務上の利率の値・適用日は**人間の法律専門家による確認を要する**。
- **U-X2 存続年数の具体的算定の法的不确定性**: pinned 原文は「同項第二号イに規定する配偶者居住権の存続年数」を参照するだけで、その算定方法（平均余命等）を本文に持たない。モデルは整数 n を caller-established として受け取る。当該抽象化が実務の算定を十分に被覆するかは法解釈の問題で、**pinned 原文のみでは決定不能**。人間の法律専門家によるレビューを要する。年の数値の一致（n=0・r=0・四捨五入を含む）には影響しない。

### X-7. 総合判定・最終報告（サマリ）

- 3 つの pinned revision の `law_full_text` から直接抽出した数値・算術を、coordinator 要約／STAGING／doc-comment に依存せず独立に再計算して照合した。「五十万円 = 500,000」「千円未満の端数を控除 = 千円単位切り捨て」「1/(1+r)^n の小数点以下三位四捨五入」のすべてが原文どおりであり、**桁違い・切り上げ誤り・逆数／累乗の向き誤りは検出されなかった**。
- **CONFIRMED: 0 件（ゼロ）**／**BY-DESIGN: 9 件**／**UNRESOLVED: 2 件**。発見ゼロを明示する。
- **needle 健全性**: 5 本、U+3000 **0 本**、pinned 正規化テキスト **5/5 FOUND**（MISS 0、すべて count 1）。CI 実装の文字列を import して直接検証。
- **反例探索**: 五十万円の桁違い・千円の桁違い／切り上げ・現価の向き誤り・n=0/r=0/四捨五入を含む全ポイントで不一致 **0 件**（グリッド 14,760 通数＋0..200,000）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` のみ 1 件（`LegalRatePresentValue.presentValuePerMille_zero_years`）。11/11 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **追記完了**: 本セクション `## Batch X review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。Lean モジュール / Spec / Tests / `data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-X1 法定利率の実数値／U-X2 存続年数の算定）は、いずれも pinned 原文のみでは解けない法的判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・数値／算術の独立抽出と再計算・CI needle の直接検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断（U-X1／U-X2）は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

## Batch Y review (2026-11-20)

対象: `JapanTaxLaw/RefundRounding.lean`（国税庁関係政令 art.120／還付金等の端数計算等）。law id `337AC0000000066`、revision `337AC0000000066_20261101_507AC0000000013`、pinned `data/raw/337AC0000000066_20261101_507AC0000000013.law.json`。**coordinator 要約・STAGING_REFUND・doc-comment の数式は一切信じず、pinned 原文から直接・独立に抽出して照合した。** Lean モジュール／Spec／Tests／`data/*` は読み取りのみで一切変更していない。

### Y-1. 独立抽出（pinned 原文 → 数値・算術）

`law_full_text` を再帰走査し `attr.Num == "120"` の `Article` を **1 ノード**特定。flat leaf 連結は **242 文字、U+3000 0 個**（モジュール先頭コメントの申告と一致することを独立確認）。原文逐語：

- §1「還付金等の額に一円未満の端数があるときは、その端数金額を切り捨てる。」
- §2「還付金等の額が一円未満であるときは、その額を一円として計算する。」
- §3「還付加算金の確定金額に百円未満の端数があるとき、又はその全額が千円未満であるときは、その端数金額又はその全額を切り捨てる。」
- §4「**還付加算金の額**を計算する場合において、その計算の基礎となる還付金等の額に一万円未満の端数があるとき、又はその還付金等の額の全額が一万円未満であるときは、その端数金額又はその全額を切り捨てる。」

漢数字を原文フレーズから直接整数化した結果と、Lean 定数を原文に依存せずに照合した結果：

| 原文フレーズ（出現確認） | 独立抽出値 | Lean 側（実ファイルを parse） | 判定 |
|---|---:|---|---|
| `一円未満`（§1, §2） | 1 | `truncateYen = scaled / scal`（円未満切捨て）／`refundAmount` の `yen = 0 ∧ scaled ≠ 0 → 1` | 一致 |
| `百円未満`（§3） | 100 | `additionAmount` の `% 100` | 一致 |
| `千円未満`（§3 全額） | 1000 | `additionAmount` の `if yen < 1000 then 0` | 一致 |
| `一万円未満`（§4 端数・全額、2 回） | 10000 | `baseForAddition` の `if yen < 10000 then 0 else yen - yen % 10000` | 一致 |

- 抽出された `(if 閾値, 剰余)` ペアは **`(1000, 100)`**（additionAmount）と **`(10000, 10000)`**（baseForAddition）のみ。1000/10000/100 の入れ替え・桁違いは見られない。§3 文には `百円`/`千円` のみで `万円` は 0 回、§4 文には `一万円` のみで `千円`/`百円` は 0 回（逐語から自明）。
- 「切り捨て」はすべて整除（`scaled / scal`）と剰余減算（`yen - yen % m`）で実装されており、**切り上げ（round-half-up／ceil）は存在しない**。
- → 4 項目すべて原文に忠実。**数値・算術の原文との食い違い（モデル値の誤り）は 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。

### Y-2. needle 健全性（4 本を STAGING JSON から直接取得して検証）

`docs/STAGING_REFUND.md` の JSON ブロックを parse し、4 本の needle 文字列を手打ちせず取得。pinned 正規化テキスト（`re.sub(r"[\s\u3000]+","", flat(...)`，CI の `norm()` と同一条件）に対して `count()` / `find()` を実行。

| needle | 長さ | U+3000 | art.120 正規化テキスト count / offset | 全文正規化 count / offset |
|---|---:|---:|---|---|
| N1（caption＋第百二十条＋§1） | 50 | 0 | 1 / 0 | 1 / 102493 |
| N2（§2） | 31 | 0 | 1 / 52 | 1 / 102545 |
| N3（§3） | 60 | 0 | 1 / 85 | 1 / 102578 |
| N4（§4 後段「その計算の基礎となる…」） | 75 | 0 | 1 / 166 | 1 / 102659 |

- **needle 健全性: 4/4 FOUND、U+3000 0 本、MISS 0、すべて count 1（一意）。** needle の改変・正規化・異体字変換はしていない。N4 は §4 文の後半のみを anchor としており、Y-5 の C-Y1（doc-comment の前半誤記）は needle には影響しない。

### Y-3. 反例探索（原文から独立再実装した参照式 vs Lean モデル鏡像）

`by decide` スモークを信じず、原文から導いた意味論（§1 floor、§2 非ゼロ端数→1円、§3 千円未満→0・百円単位切捨て、§4 一万円未満→0・一万円単位切捨て）を Python で独立再実装し、Lean 定義の鏡像と比較。

| 標的 | 探索範囲 | 不一致 |
|---|---|---:|
| `truncateYen` / `refundAmount` | scal=1..12 × scaled=0..2000（計 24,012 ケース） | **0** |
| `additionAmount` / `baseForAddition` | yen=0..50000（計 100,002 ケース） | **0** |
| 指向境界（別途） | 0 / 1 / 9 / 99 / 100 / 101 / 999 / 1000 / 1001 / 1099 / 1100 / 9999 / 10000 / 10001 / 10999 / 11000 / 12345 / 123456 | **0** |

- 合計 **124,014 ケース＋境界 220 ケース、不一致 0 件（MISMATCH_COUNT = 0）**。
- 境界の独立期待値（円 → addition / base）: 999→0/0、1000→1000/0、1099→1000/0、1100→1100/0、9999→9900/0、10000→10000/10000、10999→10900/10000、11000→11000/10000、12345→12300/10000、123456→123400/120000。**切り上げなら 1099→1100、10999→11000 となるところ、すべて切り捨て結果**。
- refund 境界: (0,10)→0、(1,10)→1、(5,10)→1、(9,10)→1、(10,10)→1、(12345,10)→1234。scal=0 は Lean `Nat.div` の全関数化で 0（または非ゼロ scaled なら §2 により 1）を返す安全版（BY-DESIGN B-Y1）。
- **反例（不一致）検出数: 0 件。** 一円未満・百円未満・千円未満・一万円未満・0 の各境界、1000/10000/100 の桁違い、切り上げ誤りはいずれも検出されず。

### Y-4. 公理監査（`lake env lean` / `#print axioms`）

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\rr_axioms.lean` を作成し、4 つの `def`（`truncateYen` / `refundAmount` / `additionAmount` / `baseForAddition`）と、同じ命題を再記述した 10 個の名前付き `theorem`（全境界＋`agreeRefundRounding`）計 **14 宣言**に `#print axioms` を実行（`lake env lean`、exit code **0**、エラー 0）。リポジトリ内の Lean ファイルは一切変更していない。

| 監査項目 | 結果 |
|---|---:|
| 走査宣言数 | 14 |
| `does not depend on any axioms` | **14** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext`（許容） | **0 件** |

- → **禁止公理（choice / sorryAx / Quot.sound）は一切検出されず。公理監査は合格。**

### Y-5. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED**（原文との食い違い／欠陥） | **1**（モデル値の誤りは **0（ゼロ）**、doc-comment 誤記 1 件のみ） |
| **BY-DESIGN**（申告済みの境界・modeling choice） | **8** |
| **UNRESOLVED**（pinned 原文のみでは解けない法的判断） | **2** |

> **モデル定数・算術の原文との食い違いは 0 件（ゼロ）。** 発見ゼロの場合も明示する。下記 CONFIRMED は実行コードではなく**コメントの転記誤り**に関するものであり、両者を混同しないこと。

#### CONFIRMED（1 件）

- **C-Y1: §4 の doc-comment 前半の転記誤り。** `RefundRounding.lean` のブロックコメント 17 行目は `§4「還付金等の額を計算する場合において、…` と記載するが、pinned 原文は **`還付加算金の額を計算する場合において、…`** である（原文 text との先頭文字から不一致、LEAN 98 文字／SRC 95 文字＝ラベル `§4「` 3 文字分の差のみ）。原文は「還付加算金の額を計算する場合」であり、誰の額を計算するかが異なる。ただし (a) 実行コード `baseForAddition`、（b）その直前の行コメント「§4: 還付加算金計算の基礎額」、（c）needle N4、（d）Y-1 の数値照合はいずれも原文どおりであり、**モデル値・証明・needle への影響はゼロ**。非実行コメントの校正漏れとして 1 件計上する（過去バッチの doc-comment 陳腐化と同分類）。

#### BY-DESIGN（8 件）

- **B-Y1** `Money = Nat`（非負整数）による金額表現。`scal > 0` は caller-established と明示され、`scal = 0` は `Nat.div` の定義で 0 を返す安全な全関数化（原文は分母 0 を規定しない）。
- **B-Y2** §1 の `scaled` は「scal 分の 1 単位のスケール整数」として caller-established。円未満切捨てを `scaled / scal`（floor）で実装。
- **B-Y3** §2 の「一円未満」を `yen = 0 ∧ scaled ≠ 0`（円額 0 だが端数あり）と解釈して 1 円を返す。`scaled = 0`（端数なし）は 0 のまま。
- **B-Y4** §3 の「全額が千円未満」は全額を 0 とし、「百円未満の端数」は `yen - yen % 100` で除去（切り捨て、繰り上げなし）。
- **B-Y5** §4 の「全額が一万円未満」は全額を 0 とし、「一万円未満の端数」は `yen - yen % 10000` で除去。
- **B-Y6** 還付加算金の利率・期間の算定は NOT MODELLED（doc-comment 明示）。`additionAmount` / `baseForAddition` は確定済み円額を caller-established 入力として受け取る。
- **B-Y7** Spec モジュールの独立定式（`specRefund` / `specAddition` / `specBase`）は impl と同一の整数算術で、`agreeRefundRounding` は有限境界リストのみを検証（普遍的正確性を主張しない）。
- **B-Y8** 全 14 宣言が `by decide` / 計算定義で公理フリー（Y-4）。`propext` すら 0 件。

#### UNRESOLVED（2 件）

- **U-Y1 入力側の法的不确定性**: pinned art.120 は「還付金等の額」「還付加算金の確定金額」「計算の基礎となる還付金等の額」を参照するだけで、その算定方法（他の条項・利率・期間）を本文に持たない。したがって caller が `scaled` / `scal` / `yen` に正しい値を供給しているかは **pinned 原文のみでは決定不能**。数式自体の一致には影響しないが、実務上の入力の正当性は**人間の法律専門家による確認を要する**。
- **U-Y2 §1/§2 と §4 の適用順序**: §4 の「計算の基礎となる還付金等の額」が §1 の端数切捨て・§2 の一円未満の 1 円処理を経た後の額か、切り捨て前の額かは、本条の文言のみでは一意に確定しない。モデルは `baseForAddition` の入力 `yen` を caller-established として受け取り、§2 を §4 に合成していない。境界算術（Y-3）の一致には影響しないが、構成順序の法的妥当性は**人間の法律専門家によるレビューを要する**。

### Y-6. 総合判定・最終報告（サマリ）

- pinned revision の `law_full_text` から直接抽出した 242 文字・4 条項の数値／算術を、coordinator 要約／STAGING／doc-comment に依存せず独立に再計算して照合した。「一円未満切捨て」「一円未満は一円」「百円未満切捨てかつ千円未満は 0」「一万円未満切捨てかつ一万円未満は 0」のすべてが原文どおりであり、**桁違い・切り上げ誤りは検出されなかった**。
- **モデル値の誤り: 0 件（ゼロ）**／CONFIRMED: **1 件**（C-Y1 は非実行コメントの転記誤り）／BY-DESIGN: **8 件**／UNRESOLVED: **2 件**。件数を手柄にしない。
- **needle 健全性**: 4 本、U+3000 **0 本**、pinned 正規化テキスト **4/4 FOUND**（MISS 0、すべて count 1）。STAGING JSON を直接 parse して検証。
- **反例探索**: 一円未満・百円未満・千円未満・一万円未満・0 の境界、1000/10000/100 の桁違い、切り上げ誤りを含む **124,014＋220 ケースで不一致 0 件**。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` も **0 件**。14/14 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **追記完了**: 本セクション `## Batch Y review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。Lean モジュール／Spec／Tests／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-Y1 入力側の算定／U-Y2 §1/§2 と §4 の適用順序）は、いずれも pinned 原文のみでは解けない法的判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・数値／算術の独立抽出と再計算・needle の直接検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。


## Batch Z review (2026-11-20)

対象: `JapanTaxLaw/CustomsStorageFee.lean`（関税法施行令 art.70の3／法 329CO0000000150）と対応 `CustomsStorageFeeSpec.lean` / `CustomsStorageFeeTests.lean`。一次資料: `data/raw/329CO0000000150_20260701_508CO0000000217.law.json` の `Article[Num=70_3]`（pinned、改変せず）。coordinator 要約・STAGING の数値は信じず、pinned JSON を Python で直接 parse して独立抽出した。

### Z-1. pinned 原文の独立抽出と数値照合

- `law_full_text` を CI `transcription_audit.py` の `text()` と同一ロジックで平坦化し、`Article[Num=70_3]` のリーフを連結。独立抽出結果: **240 文字、U+3000 = 0**（doc-comment の「240 chars / U+3000 count 0」と一致）。
- §2 原文（逐語、強調のみ付与）: 「前項に規定する保管に要した費用の額は、収容貨物の保管の場所が法第八十条の二第三項本文（収容の方法）に規定する場所である場合には、その保管期間**一日**につき、収容貨物の重量**一トン**又は容積**一立方メートルまでごとに百八十円**とする。」
- 原文から直接抽出した数値・算術要素:
  - 保管期間「一日につき」→ 日数倍（per-day）。
  - 重量「一トン」／容積「一立方メートル」→ 1 単位あたり。
  - 「までごとに」→ 1 トン（1 m³）未満も 1 単位として数える切り上げ。
  - 金額「百八十円」→ 漢数字を独立変換（`百=100` + `八十=80`）して **180**。
- Lean 定数との照合:

| 原文 | 独立換算 | Lean 定数／定義 | 判定 |
|---|---|---|---|
| 百八十円 | 180 | `unitRate : Money := 180` | 一致（桁違いなし） |
| 一日につき | 日数倍 | `storageFee = days * …` | 一致 |
| 一トン／一立方メートルまでごとに | 端数>0 なら +1（ceil） | `chargeableUnits = if frac = 0 then whole else whole + 1` | 一致 |
| 上記の合成 | 日数 × ceil(トン数) × 180 | `storageFee = days * chargeableUnits … * unitRate` | 一致 |

- `Money = Nat`（`TaxFinance.lean`）で任意精度のため、Nat 乗算の桁あふれリスクなし。

### Z-2. 独立判定（算術の中核）

- `chargeableUnits(whole, frac)` は `frac = 0` なら `whole`、そうでなければ `whole + 1` を返す。`whole` をトン（m³）の整数部、`frac` を 0 超 1 未満の端数と解釈すると、これは `ceil(whole + frac)` に等しく、「一トンまでごとに」の切り上げを正しく実装している（1 トン未満 `whole=0, frac>0` は 1 単位、0 トン `whole=frac=0` は 0 単位）。`frac` を一般の Nat としても `frac ≠ 0 → +1` は「端数あり」判定として機能する。
- `storageFee = days × chargeableUnits × 180` は原文「一日につき…までごとに百八十円」の乗算構造と一致。乗算順序の違いは可換で金額に影響しない。
- **180 円の桁違い・切り捨て誤りは検出されず。**

### Z-3. needle 健全性（CI 実装を直接検証）

STAGING の申告ではなく `scripts/ci/transcription_audit.py` の `checks()` を Python で import し、`law_id = 329CO0000000150` の check（kind `file`、check 名 `CustomsStorageFee.lean`）に組み込まれた needle を抽出。pinned 正規化テキスト（`_norm()` = `re.sub(r"[\s　]+", "", …)`、CI と同一条件）に対して `.find()` / `.count()` を実行した。

| 項目 | 結果 |
|---|---|
| check 数 | 1（CustomsStorageFee.lean） |
| needle 総数 | **2**（指定どおり） |
| U+3000（全角空白）を含む needle | **0 件** |
| `.find()` | 2/2 FOUND（MISS 0） |
| `.count()` | 全 needle で **1**（一意） |
| 正規化テキスト上の offset | 125246 / 125345（長さ 97 / 109 文字） |

- needle 1 は §1 全体、needle 2 は §2 全体（いずれも末尾の句点「。」を除く連続文字列）を逐語保持。
- CI ゲートを実実行: `python scripts/ci/transcription_audit.py` → **exit code 0、151/151 checks passed**（CustomsStorageFee.lean も PASS）。

### Z-4. 反例探索（境界走査）

独立参照モデル `ref_fee = days × (frac=0 ? whole : whole+1) × 180` に対し、Lean 定義と同じ整数式を全走査で比較。

| パラメータ | 値 |
|---|---|
| days | 0 / 1 / 2 / 3 / 10 |
| whole | 0 / 1 / 2 / 5 / 10 |
| frac | 0 / >0（端数あり代表） |
| ケース数 | **50** |
| 不一致 | **0** |

境界の明示:
- `days = 0` → 0（日数 0）。
- `whole = 0, frac > 0` → 1 単位（1 トン未満も 1 トン）→ 例 `storageFee 1 0 1 = 180`。
- `whole = 0, frac = 0` → 0（トン数 0）。
- `frac = 0` → 切り上げなし（`storageFee 1 1 0 = 180`）。
- `frac > 0` → +1（`storageFee 1 1 1 = 360`）。
- 既存 example/test の数値も独立再計算し一致: `storageFee 3 2 0 = 1080`、`storageFee 0 5 3 = 0`、`storageFee 7 10 5 = 13860`（= 7 × 11 × 180）。

### Z-5. 公理監査

- 一時 Lean ファイルに 3 モジュールの**名前付き宣言 6 件**（impl: `unitRate` / `chargeableUnits` / `storageFee`、Spec: `specUnits` / `specFee` / `agreeCustomsStorageFee`、Tests: 名前付き宣言なし＝全て匿名 `example`）を列挙し `#print axioms` を実行（`lake env lean`、exit code **0**、error 0）。

| 公理 | 件数 |
|---|---|
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件**（許容範囲内） |

→ 6/6 宣言が `does not depend on any axioms`。禁止公理は一切検出されず。監査後、一時ファイル・一時スクリプトは削除済み。

### Z-6. 分類

#### CONFIRMED（原文との食い違い／バグ:**0 件＝ゼロ**）

- **ゼロ。** 金額不一致・桁違い・切り上げ誤り・needle MISS・公理混入・反例矛盾はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN（3 件）

- **B-Z1** §1 は費用の範囲定義（保管・運搬・公告・通信費）であり、金額算術は §2 の保管費のみ。運搬費・公告費・通信費の具体額は原文に数値がなく NOT MODELLED（doc-comment どおり）。
- **B-Z2** §3 は art.70の2 第2項（重量により算出した額と容積により算出した額が異なるときは多い額を収容課金とするルール）を保管費に準用する。モデルは重量／容積の選択を caller-established とし、この「多い額採用」ルールを NOT MODELLED としている（doc-comment どおり）。金額式自体は選択された basis に対して成立し矛盾なし。
- **B-Z3** 入力（保管日数・重量/容積の整数部と端数・収容場所の該当性）は caller-established。Bool を金額式に入れず、入力確定は呼び出し側責任（doc-comment どおり）。

#### UNRESOLVED（2 件）

- **U-Z1** 「一トンまでごとに」の切り上げ解釈（端数>0 なら +1）は標準的読解として原文と整合し、機械的照合も一致した。ただし法的解釈の最終判断は人間の法律専門家に委ねる（本レビューは解釈を確定しない）。
- **U-Z2** doc-comment は §3 の準用内容を「端数処理の準用内容」と表現するが、pinned 原文上 §3 が準用する art.70の2 第2項は「重量額と容積額の多い額を採用する」ルールであり、端数処理そのものではない。**記述の緩み**であって金額式の誤りではないが、準用範囲の正確な把握は人間の法律専門家による確認を要する。

### Z-7. 総合判定・最終報告（サマリ）

- pinned 原文から独立抽出した 240 文字・3 項の数値／算術（一日あたり・一トン／一立方メートルまでごとに・百八十円=180）を、coordinator 要約／STAGING／doc-comment に依存せず再計算して照合。**桁違い・切り上げ誤りは検出されなかった。**
- **CONFIRMED: 0 件（ゼロ）／BY-DESIGN: 3 件／UNRESOLVED: 2 件。** 件数を手柄にしない。
- **needle 健全性**: 2 本、U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0、すべて count 1）。CI ゲート 151/151 PASS（exit 0）。
- **反例探索**: 境界を含む **50 ケースで不一致 0 件**。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` も **0 件**。6/6 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **追記完了**: 本セクション `## Batch Z review (2026-11-20)` を `docs/ADVERSARIAL_REVIEW.md` 末尾に追記（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に整合）。既存セクションはすべて保持。Lean モジュール／Spec／Tests／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・数値／算術の独立抽出と再計算・needle の `.find()` 検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

## Batch AA review (2026-11-20)

### AA-0. レビュア／対象／独立性

- レビュア: Adversarial Review Agent。形式化担当と独立に **cycle-15** の 1 モジュールを原文照合・反例探索した。
- 対象: `JapanTaxLaw/TobaccoTaxFixedAmount.lean`（地方税法施行規則 art.16の4の4）。
- 一次資料: `data/raw/329M50000002023_20261101_508M60000008045.law.json`（law id `329M50000002023`、revision `329M50000002023_20261101_508M60000008045`、pinned・改変禁止）。
- coordinator の要約／STAGING／doc-comment の数値・算術主張は**一切信じず**、pinned JSON の `law_full_text` を Python で直接再帰 flatten し、数値・算術・needle・境界を再抽出・再計算した（Batch S の art.148「要約依存」失敗の再発回避）。
- Lean モジュールは読み取り専用。`docs/ADVERSARIAL_REVIEW.md` 以外は変更せず、commit / push / merge / ブランチ切替は行っていない。

### AA-1. 原文からの独立抽出（pinned 直接 parse）

| 項目 | 独立抽出結果 |
|---|---|
| `tag=Article, attr.Num=16_4_4` の存在 | **1 件**（MainProvision 配下） |
| leaf 文字列 | 11 片 |
| 連結 flat 文字数 | 264（U+3000 = **3**） |
| 正規化 `re.sub(r"[\s　]+","",…)` 後 | **261 文字、U+3000 = 0** |
| doc-comment の「261 chars / U+3000 count 0」 | **一致** |
| 算術 leaf（逐語） | `Ａ×（（Ｃ×２）／Ｂ）` |
| その codepoints | `U+FF21 U+00D7 U+FF08 U+FF08 U+FF23 U+00D7 U+FF12 U+FF09 U+FF0F U+FF22 U+FF09` |
| 係数「２」 | 全角 **U+FF12**、算式内に **1 回**出現（`Ｃ×２`） |
| flat 内のもう 1 個の「２」 | §2 の **ParagraphNum**（条第 2 項の項番号）であり係数ではない |
| §2 末尾 | 「…その端数金額又はその全額を**切り上げる**。」（切り捨てではない） |
| 全角数字の出現 | `２`（係数）×1、`２`（項番号）×1 ＝ 計 2 回 |

独立読解:
- 算式 = `A × ((C × 2) / B)`（C に 2 を掛け、B で割り、A を掛ける）。
- §2 = 計算額に千円未満の端数があるとき、又は全額が千円未満のときは、その端数／全額を**切り上げ**て千円単位にする。

### AA-2. 最重要チェック（art.148 型失敗の回避）

| チェック | 原文 | Lean | 判定 |
|---|---|---|---|
| 算式の反映 | `Ａ×（（Ｃ×２）／Ｂ）` | `fixedAmount a b c = if b = 0 then 0 else roundUpThousand (a * (c * 2) / b)` | **一致**（乗算・除算・係数 2 の構造を保持） |
| 「２」係数の脱落 | 算式内に C×2 が存在 | `numerator c = c * 2`、`(c * 2)` が分子に明示 | **脱落なし** |
| 切り上げ方向 | 「切り上げる」 | `roundUpThousand x = if x = 0 then 0 else (x+999)/1000*1000` | **切り上げ（切り捨てではない）** |
| 境界 1 | — | `roundUpThousand 1 = 1000` | 一致 |
| 境界 1000 | — | `roundUpThousand 1000 = 1000` | 一致 |
| 境界 1001 | — | `roundUpThousand 1001 = 2000` | 一致 |
| ゼロ | — | `roundUpThousand 0 = 0` | 一致（真のゼロ） |
| 分母 0 | 原文は未定義 | `if b = 0 then 0` | 安全版（BY-DESIGN） |

→ **最重要チェック 4 点（算式構造・C×2・切り上げ方向・境界）で原文との食い違い 0 件（ゼロ）。** art.148 型の演算子誤り（乗算→加算等）・係数脱落・切り上げ→切り捨て誤り・桁違いは再発していない。

### AA-3. needle 健全性（CI 実装を直接検証）

STAGING の申告ではなく `scripts/ci/transcription_audit.py` の `checks()` を import し、`TobaccoTaxFixedAmount.lean` の check（law_id `329M50000002023`、kind `file`）に組み込まれた needle を抽出。pinned 正規化テキスト（CI と同一の `_norm()`）に対して `.find()` / `.count()` を実行。

| 項目 | 結果 |
|---|---|
| needle 総数 | **3**（指定どおり） |
| U+3000 を含む needle | **0 本** |
| `.find()` | **3/3 FOUND**（MISS 0） |
| `.count()` | 全 needle **1**（一意） |
| offset / 長さ | 0 / 90、91 / 52、176 / 84 |
| pinned 正規化テキスト | 261 文字（flat 264 文字、U+3000 3 個を除去） |

- needle 1 = §1 冒頭〜「算定するものとする」、needle 2 = 算式＋Ａの定義、needle 3 = §2 全体（いずれも末尾句点を除く逐語）。
- CI ゲート実実行: `python scripts/ci/transcription_audit.py` → **exit code 0、152/152 checks passed**（`TobaccoTaxFixedAmount.lean` も PASS）。

### AA-4. 反例探索

独立参照モデル（pinned 原文の逐語から構成）:
- `lean(a,b,c) = b=0 ? 0 : roundUpThousand(((a*(c*2))//b))`（Lean と同一の Nat 演算）
- `exact(a,b,c) = b=0 ? 0 : (2AC=0 ? 0 : ceil(2AC/(b*1000))*1000)`（算式和を厳密有理数として §2 を適用）
- `literal(a,b,c) = b=0 ? 0 : roundUpThousand(a*((c*2)//b))`（原文の括弧を Nat floor で読んだ場合）

境界（要求どおり）:

| 入力 | 期待 | 実測 | 判定 |
|---|---|---|---|
| `roundUpThousand 0` | 0 | 0 | 一致 |
| `roundUpThousand 1` | 1000 | 1000 | 一致 |
| `roundUpThousand 999` | 1000 | 1000 | 一致 |
| `roundUpThousand 1000` | 1000 | 1000 | 一致 |
| `roundUpThousand 1001` | 2000 | 2000 | 一致 |
| `numerator 0/1/5/10` | 0/2/10/20 | 0/2/10/20 | 一致（C×2 保持） |
| `fixedAmount 100000 1000 10` | 2000 | 2000 | 一致（2000000/1000=2000） |
| `fixedAmount 1000 300 1` | 1000 | 1000 | 一致（2000/300=6.66…→1000） |
| `fixedAmount 1000 0 10` | 0 | 0 | 一致（分母 0 安全版） |

グリッド走査（A,B,C ∈ [0,30]、B≥1、計 31×30×31 = 28,830 ケース）:
- `lean` vs `exact`（厳密有理数で §2 を適用）: **538 ケースで値が異なる**。
- `lean` vs `literal`（括弧内 floor）: 5,762 ケースで異なる（乗算先行の近似）。
- 差の原因は**演算子の誤りではなく Nat 割算の floor による 1 円未満の切捨て**であり、§2 の「千円未満の端数」適用が floor 後の整数に対して行われることに起因する。
- 具体例（両読解の差）:
  - `A=1, B=3, C=1`: 厳密値 = 2/3 円 → §2「全額が千円未満」なら 1000、Lean = **0**。
  - `A=2001, B=4, C=1`: 厳密値 = 1000.5 円 → §2 なら 2000、Lean = **1000**（floor(4002/4)=1000 が 1000 の倍数のため切り上がらない）。
- いずれも係数 2・切り上げ方向自体は正しく、差は丸め精度の modeling choice に限定される（AA-6 の BY-DESIGN / UNRESOLVED を参照）。**本レビューは厳密有理数読解を法の正解と確定しない。**

### AA-5. 公理監査

一時 Lean ファイルに 4 つの名前付き宣言を列挙し `#print axioms` を実行（`lake env lean`、exit code **0**、error 0）。

| 宣言 | 公理 |
|---|---|
| `roundUpThousand` | does not depend on any axioms |
| `numerator` | does not depend on any axioms |
| `fixedAmount` | does not depend on any axioms |
| `roundUpThousand_pos` | `[propext]` |

| 公理 | 件数 |
|---|---|
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **1 件**（許容範囲内） |

→ 禁止公理は一切検出されず。監査後、一時ファイルは削除済み。

### AA-6. 分類

#### CONFIRMED（原文との食い違い／演算子誤り・バグ:**0 件＝ゼロ**）

- **ゼロ。** 算式構造の誤り、係数「２」の脱落、切り上げ→切り捨ての反転、桁違い、needle MISS、公理混入、反例矛盾はいずれも検出されなかった。件数を手柄にしない。
- 上記 AA-4 の 538 ケースの差は、厳密有理数読解を「正解」と確定できないため CONFIRMED とは数えず、BY-DESIGN / UNRESOLVED にすべて記録した（隠蔽していない）。

#### BY-DESIGN（5 件）

- **B-AA1** A（総務大臣が定める額）・B（全国のたばこ消費基礎人口の合計）・C（当該市町村のたばこ消費基礎人口）は caller-established。doc-comment どおり NOT MODELLED。
- **B-AA2** `Money = Nat`。割算は Nat の floor（乗算先行 `a*(c*2)/b`）。**art.148 型の演算子誤りではない**。厳密有理数・丸め精度を主張せず、Batch S の B4 と同趣旨の bounded 近似。AA-4 の 538 件の差はこの近似に起因する。
- **B-AA3** 分母 B=0 → 0 の安全版（原文は割算を定義しない）。
- **B-AA4** 法 485 条の 13 第 1 項の具体的算定・たばこ消費基礎人口の算定方法は NOT MODELLED（doc-comment どおり）。
- **B-AA5** `roundUpThousand` の `x = 0 → 0` は真のゼロ（A=0 または C=0）に対する処理。正数だが 1 円未満の厳密値が floor で 0 になる場合の扱いは U-AA1 で扱う。

#### UNRESOLVED（2 件）

- **U-AA1** §2「全額が千円未満であるときは、その全額を切り上げる」の適用範囲。正数 1 円未満の厳密値（例 A=1,B=3,C=1 → 2/3 円）を 1000 に切り上げるべきか、また floor 値が 1000 の倍数で端数がある場合（例 A=2001,B=4,C=1 → 1000.5 円）を 2000 にすべきかは解釈問題であり、モデルは 0／1000 を返す。最終判断は人間の法律専門家に委ねる（本レビューは解釈を確定しない）。
- **U-AA2** 原文の括弧 `Ａ×（（Ｃ×２）／Ｂ）` を整数演算で読む際の演算順序（内側割算を floor してから A を掛ける vs 乗算先行）。厳密有理数では同値だが Nat では非同値（AA-4: 5,762 ケース）。採用順序の妥当性は人間の法律専門家による確認を要する。

### AA-7. 総合判定・最終報告（サマリ）

- pinned 原文から独立抽出した **261 文字**（正規化、U+3000=0）の算術「Ａ×（（Ｃ×２）／Ｂ）」と §2「切り上げる」を、coordinator 要約／STAGING／doc-comment に依存せず再計算して照合。**最重要チェック 4 点（算式構造・係数 2・切り上げ方向・境界 0/1/1000/1001）で食い違い 0 件（ゼロ）。** art.148 型の失敗は再発していない。
- **CONFIRMED: 0 件（ゼロ）／BY-DESIGN: 5 件／UNRESOLVED: 2 件。** 件数を手柄にしない。発見（原文不一致と確定したもの）は **ゼロ** だが、厳密有理数読解での数値差は BY-DESIGN / UNRESOLVED に実測値付きで記録済み。
- **needle 健全性**: 3 本、U+3000 **0 本**、pinned 正規化テキスト **3/3 FOUND**（MISS 0、すべて count 1）。CI ゲート 152/152 PASS（exit 0）。
- **反例探索**: 境界 9 ケースはすべて一致。グリッド 28,830 ケースで Nat floor 近似に起因する差 538 件を検出（演算子誤りではなく BY-DESIGN / UNRESOLVED に分類）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` = **1 件**（許容）。4/4 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AA review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**（`Batch A1` も match）。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記。既存セクションはすべて保持。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・数値／算術の独立抽出と再計算・needle の `.find()` 検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

---

## Batch AB review (2026-11-20)

- **レビュア役割**: Adversarial Review Agent。形式化担当と独立に **cycle-16** の 1 モジュールを原文照合・反例探索した。coordinator の要約・`docs/STAGING_ROADGRANT.md`・doc-comment の数値／算術主張は**一切信じず**、pinned 原文 JSON から Python で直接再抽出・再計算して照合した（Batch S の art.148「要約依存」失敗の再発回避）。
- **対象モジュール（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/RoadGrantAllocation.lean`（地方税等減収補てん臨時交付金政令 art.5）。`RoadGrantAllocationSpec.lean` / `RoadGrantAllocationTests.lean` も読み取りのみ。
- **一次資料（pinned・改変禁止）**: `data/raw/420AC0000000084_20081022_000000000000000.law.json`（law id `420AC0000000084`、revision `420AC0000000084_20081022_000000000000000`）。`Article Num=5` は `law_full_text.children[1].children[1].children[4]` に存在。
- **抽出方法**: `Article` 配下の leaf-text を Document order で連結し、`re.sub(r"[\s\u3000]+", "", …)` で正規化。漢数字は自前の kansuji パーサ（億／万／千／百／十）で Arabic に変換し、算術は Python で再計算。needle は STAGING の 2 本を候補として扱い、pinned 正規化テキストへ `.find()` を実行。さらに pinned テキストから独立に構築した needle でも追検証した。

### AB-1. 独立抽出結果（pinned 原文からの直接 parse）

| 項目 | 独立抽出（pinned leaf テキストを直接走査） | Lean 側の定数／式 |
|---|---|---|
| art.5 本文 | **281 chars**、U+3000 **0**。ArticleCaption「（地方道路譲与税減収補てん臨時交付金）」＋ArticleTitle「第五条」＋§1〜§3。doc-comment の「flat/normalized leaf text 281 chars, U+3000 count 0」と一致 | doc-comment と一致 |
| §2 文言 | 「２地方道路譲与税減収補てん臨時交付金の総額は、**四十五億九千五百万円**とする。」 | `totalGrant : Money := 4_595_000_000` |
| §2 金額 | kansuji パーサの独立計算: 四十五億 = 45×10^8 = 4,500,000,000、九千五百万 = 9,500×10^4 = 95,000,000、合計 **4,595,000,000**。`== 4595000000` は True、`== 459500000` は False、`== 45950000000` は False | `4_595_000_000` と一致（桁違いなし） |
| §3 文言 | 「３各都道府県及び各市町村に対して交付すべき…額は、前項に規定する…**総額を**、平成二十年六月に各都道府県及び各市町村に対して譲与した地方道路譲与税の額に**よりあん分した額**とする。」 | `allocation e t := if t = 0 then 0 else totalGrant * e / t` |
| §3 算術 | 「総額を」1 回、「地方道路譲与税の額によりあん分した額」1 回、「あん分」1 回。「**加え**」「**加算**」「**割り**」「**乗じ**」は **0 回**。art.148 型の加算混入なし。按分は total × basis / totalBasis の方向 | 乗算先行の `totalGrant * entityBasis / totalBasis` と一致（逆数誤りなし） |

> 注: 独立抽出値は **4,595,000,000**（4.595×10^9）である。桁違い候補 459,500,000（4.595×10^8）および 45,950,000,000（4.595×10^10）はともに原文と一致しないことを明示的に確認した。

### AB-2. 最重要チェック 3 点の独立判定（art.148 型失敗の回避）

| # | チェック項目 | 独立判定 | 根拠 |
|---|---|---|---|
| 1 | §2「四十五億九千五百万円」= 4,595,000,000 が `totalGrant` に反映されているか（桁違いなし） | **一致（発見ゼロ）** | pinned §2 から自前 kansuji パーサで直接算出した値は 4,595,000,000。459,500,000 / 45,950,000,000 いずれとも不一致であることを機械確認。`#eval totalGrant` = `4595000000`。 |
| 2 | §3 の按分が `totalGrant × entityBasis / totalBasis`（逆数誤りなし・分母 0 安全版）か | **一致（発見ゼロ）** | 原文は「総額を…額によりあん分した額」で、加算語は本文に皆無。Lean は `if totalBasis = 0 then 0 else totalGrant * entityBasis / totalBasis`。逆数形 `totalGrant * totalBasis / entityBasis` とは格子点上で明確に異なる（例 e=1,t=10: 正 459,500,000 / 逆 45,950,000,000）。分母 0 は `if` で 0 を返す全関数。 |
| 3 | 定理 `allocation_le_total` に caller-established の前提 `entityBasis ≤ totalBasis` が明示されているか | **一致（発見ゼロ）** | `#check` の出力は `allocation_le_total (entityBasis totalBasis : Money) (h : entityBasis ≤ totalBasis) : allocation entityBasis totalBasis ≤ totalGrant`。前提が第 3 引数として明示的に存在。証明は `Nat.mul_le_mul_left` ＋ `Nat.div_le_of_le_mul` で、前提が無い場合は成り立たない（例 e=20,t=10 は総額超過）。 |

→ **3 点すべて原文に忠実であり、数値・算術・前提の原文との食い違いは 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。

### AB-3. needle 健全性

| needle | 出典 | U+3000 | 長さ | pinned 正規化テキスト |
|---|---|---|---|---|
| #1 | STAGING_ROADGRANT.md（ArticleCaption＋Title＋§1） | **0 本** | 123 | **FOUND**（offset 0、出現回数 1） |
| #2 | STAGING_ROADGRANT.md（§3） | **0 本** | 118 | **FOUND**（offset 162、出現回数 1） |

- STAGING の **2 本すべて**について U+3000 = 0、pinned 正規化テキストへ **2/2 FOUND**（MISS 0、各出現回数 1）。
- 追検証として pinned から独立構築した 3 needle（Caption+Title+§1 / §3（`３` を含む）/ §2 全文）もすべて U+3000 = 0、3/3 FOUND（offset 0 / 161 / 124、各出現回数 1）。needle の文字化け・改変・重複はなし。

### AB-4. 反例探索結果

| 攻撃対象 | 独立計算（Python） | Lean `#eval` | 結果 |
|---|---|---|---|
| 既存 smoke（e=1,t=10） | 459,500,000 | 459500000 | 一致 |
| 既存 smoke（e=3,t=10） | 1,378,500,000 | 1378500000 | 一致 |
| 既存 smoke（e=10,t=10／総額一致） | 4,595,000,000 | 4595000000 | 一致 |
| 分母 0（e=5,t=0／e=0,t=0） | 0 / 0 | 0 / 0 | 一致（安全版） |
| 基準額 0（e=0,t=10） | 0 | 0 | 一致 |
| e=7,t=7（総額一致） | 4,595,000,000 | — | 一致 |
| 割り切れない場合（e=7,t=13） | 2,474,230,769（厳密 2,474,230,769.23 の floor） | 2474230769 | 一致 |
| 按分方向の逆転 | e=1,t=10 で逆数形なら 45,950,000,000（10 倍過大）。格子 441 点中 380 点で正式と差 | — | 逆数誤りなし |
| art.148 型の加算混入 | e=1,t=10 で `total + e/t` なら 4,595,000,000。正式 459,500,000 と差 | — | 加算混入なし |
| 前提違反（e=20,t=10） | 9,190,000,000 ＞ 総額。ただし `h : e ≤ t` を満たさず定理は適用外 | — | 反例にならない |
| 前提充足時の上限（e≤t） | 0〜200 の格子 40,401 点＋大値（4,595,000,000 近傍・2^32）で `allocation ≤ totalGrant` 違反 **0 件** | — | 定理と整合 |
| 単調性・分割和 | 基準額増加で単調（t=1..30 で全確認）。1+3+6 / 10 の分割和は total と完全一致 | — | 矛盾なし |

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

### AB-5. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchAB_axiom_probe.lean` を作成し、名前付き宣言 **3 宣言**（`totalGrant` / `allocation` / `allocation_le_total`）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。監査後、一時ファイルは削除済み。
- 別途 `#check` / `#eval` 用の一時ファイルでも exit code 0 を確認し、定理シグネチャ（明示前提）と全計算値を照合済み。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 3 |
| `totalGrant` / `allocation` | `"does not depend on any axioms"` |
| `allocation_le_total` | `[propext]`（許容範囲） |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **1 件**（`allocation_le_total`、許容） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず。許容された propext のみ。公理監査は合格。**

### AB-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---|
| **CONFIRMED（実際の食い違い・欠陥）** | **0（ゼロ）** |
| **BY-DESIGN** | **5** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

#### CONFIRMED（0 件）

- 金額（4,595,000,000 の桁違い）、按分方向（逆数誤り）、分母 0 安全版、定理の明示前提、needle MISS、算術不一致、禁止公理混入、反例矛盾はいずれも検出されなかった。**発見はゼロである。**

#### BY-DESIGN（5 件）

- **B-AB1 基準額は caller-established**: 各都道府県・各市町村の地方道路譲与税額（entityBasis / totalBasis）の算定・確定は doc-comment のとおり入力側の責任。本モデルは与えられた基準額への按分計算のみ。
- **B-AB2 `Money = Nat`・按分は乗算先行の floor**: `totalGrant * entityBasis / totalBasis`。原文は「あん分した額」のみで端数規定・厳密有理数を指定しないため、Nat の切り捨ては bounded 近似であり厳密有理数・丸め精度は主張しない。**art.148 型の演算子誤りではない**。
- **B-AB3 分母 0 → 0 の全関数化**: 原文は totalBasis = 0 の場合を規定しない。モデルは安全版を採用し、割り算の未定義を回避（反例探索で (5,0)→0 を確認）。
- **B-AB4 定理前提は caller-established として明示**: `h : entityBasis ≤ totalBasis` を引数に明示し、前提無しでの総額上限主張を行わない。前提違反例（e=20,t=10）は定理の適用外として扱う。
- **B-AB5 スコープ外の非モデル化**: 按分の端数処理の詳細・交付手続・他 2 種の交付金（地方税等減収補てん臨時交付金政令の他条）は NOT MODELLED と doc-comment に明記。反映漏れではない。

#### UNRESOLVED（2 件）

- **U-AB1 端数処理（floor）の法的正当性**: 原文 §3 は「あん分した額」とし端数規定を持たない。モデルは Nat の floor（乗算先行）を採用するが、政令が実際に切り捨てを意図するかは pinned 原文のみでは決定不能。**人間の法律専門家による確認を要する**（他バッチ U-1 と同趣旨）。
- **U-AB2 分母 0（基準額合計 0）時の法的取扱い**: 原文は totalBasis = 0 のケースに沈黙する。安全版 0 は modelling choice として透明だが、法的に 0 交付が正しいか（そもそも当該ケースが想定されないか）は原文のみでは解けない。人間の法律専門家の確認を要する。金額・算術の一致（発見ゼロ）には影響しない。

### AB-7. 総合判定・最終報告（サマリ）

- pinned revision `420AC0000000084_20081022_000000000000000` の art.5 から独立抽出した **281 文字**（正規化、U+3000 = 0）の数値・算術を、coordinator 要約／STAGING／doc-comment に依存せず再計算して照合。**最重要チェック 3 点（桁違い・按分方向・分母 0 安全版・定理の明示前提）で食い違い 0 件（ゼロ）**。art.148 型の「要約を信じた誤り」は再発していない。
- **CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 5 件** ／ **UNRESOLVED: 2 件**。発見ゼロを明示した。
- **needle 健全性**: 2 本（STAGING）とも U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0、各出現回数 1）。独立構築 3 needle も 3/3 FOUND。
- **反例探索**: 分母 0・基準額 0・総額一致・割り切れない場合・按分逆転・加算混入・前提違反・単調性・分割和の全境界で矛盾 0 件。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` = **1 件**（許容）。3/3 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AB review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記し、既存セクションはすべて保持した。
- **書き換えファイル**: `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない（作業ツリーには他エージェントによる未追跡ファイルが存在するが、本レビューでは触れていない）。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-AB1 端数処理の法的正当性、U-AB2 分母 0 時の取扱い）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・数値／算術の独立抽出と再計算・needle の `.find()` 検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

---

## Batch AC review (2026-11-20)

### AC-0. 範囲・独立性の申告

- 対象: `JapanTaxLaw/WeightTaxTransfer.lean`（自動車重量譲与税法 art.2 / law 346AC0000000090）のみ。**Lean モジュールは読み取り専用で一切変更していない。**
- 一次資料（pinned・改変禁止）: `data/raw/346AC0000000090_20260401_508AC0000000002.law.json`。`law_full_text.children[1]`（LawBody）→ `MainProvision` 配下の `Article[attr.Num="2"]` を直接探索し、leaf text を平坦化して抽出した。
- **coordinator の要約・`docs/STAGING_WTTRANSFER.md`・Lean doc-comment の数式は信じず**、pinned JSON から自前の日本語数字パーサで数値・算術を再抽出して照合した（art.148 型の「要約を信じた誤り」を再発させないため）。
- `Money = Nat`（`JapanTaxLaw/TaxFinance.lean` 行 29）を確認。±符号・有理数は持たない bounded L4 モデルである。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。commit / push / merge / ブランチ切替は行っていない。

### AC-1. 独立抽出結果（pinned 原文 → 数値／算術）

- Art.2 の Article ノードは **1 件のみ**（`Num="2"`。`Num="2_2"` は別条で混同しない）。平坦化テキストは **333 文字**、U+3000 **0**（Lean doc-comment の「333 chars, U+3000 count 0」と独立に一致）。
- 原文 §1（抜粋）: 「自動車重量譲与税の**三百五十七分の三百三十三**に相当する額は、市町村に対し、…の延長及び面積に按あん分して譲与するものとする。」
- 原文 §2（全文）: 「前項の場合においては、同項の額の**二分の一**の額を同項の道路の延長で、他の**二分の一**の額を同項の道路の面積で按分するものとする。」
- 自前パーサによる変換: `三百五十七 → 357`、`三百三十三 → 333`（日本語の「X分のY」は Y/X）。`二分の一` の出現回数は **2**。

| 原文表現 | 独立抽出値 | Lean 定数／式 | 照合 |
|---|---|---|---|
| 三百五十七分の三百三十三 | 分子 333 / 分母 357 | `transferBase t := t * 333 / 357`（行 33） | ✅ |
| 同項の額の二分の一を延長で | (base/2)×延長按分 | `half := transferBase t / 2` ; `half * entityLength / totalLength`（行 37–38） | ✅ |
| 他の二分の一を面積で | (base/2)×面積按分 | `half * entityArea / totalArea`（行 39） | ✅ |
| 延長分と面積分を合算 | 2 項の和 | 行 38 の `+` 行 39 | ✅ |

### AC-2. 最重要チェックの独立判定

1. **分数の逆転・桁違い: なし。** 原文は「三百五十七分の三百三十三」＝ 333/357 であり、抽出した分子 333・分母 357 は Lean の `t * 333 / 357` と一致。逆転（357/333）でも桁違い（例: 333/3570, 33/357）でもない。境界確認: `transferBase 357 = 333`（逆転なら 382 となるところ）。
2. **半分割の脱落・逆転: なし。** 原文 §2 の「二分の一」は 2 回で、延長側・面積側に各 1 回。Lean は `half := transferBase t / 2` を 1 回だけ作り、その同じ `half` を延長按分・面積按分の両方に掛けて加算しており、(base/2)×延長 + (base/2)×面積 の構造を保つ。半分割の脱落（base×延長+base×面積）や逆転（延長側に面積を掛ける等）はない。
3. **分母 0 安全版: 適切。** 両按分とも `if totalLength = 0 then 0 else …` / `if totalArea = 0 then 0 else …` でガードされ、`allocation` は全関数。ゼロ除算は構造的に不可能（下記 AC-4 の走査で確認）。各分子は `half * entity…` を先に計算してから除算しており、按分の精度落ちも最小化されている。

> 3 つの最重要チェックはいずれも**食い違い 0 件**。

### AC-3. needle 健全性

- `docs/STAGING_WTTRANSFER.md` の `needles` は **2 本**（STAGING の件数は参照したが内容の正しさは pinned で独立検証）。

| # | 長さ | U+3000 | pinned 正規化テキスト |
|---|---:|---:|---|
| 1 | 65 | 0 | **FOUND**（pos=0、出現 1 回） |
| 2 | 60 | 0 | **FOUND**（pos=186、出現 1 回） |

- **2/2 FOUND、MISS 0、U+3000 は 2 本とも 0 本。** needle 1 は §1 の冒頭（「（市町村に対する…）第二条…道路法」）、needle 2 は §2 の全文を覆う。

### AC-4. 反例探索（境界・算術・按分）

| 攻撃対象 | 独立再計算の結果 |
|---|---|
| 分数逆転 357/333 | `totalTax=357` で正しくは 333、逆転なら 382。Lean は 333 → **矛盾なし**。 |
| 日本語数字の桁 misread | 自前パーサで 三百五十七=357 / 三百三十三=333 と独立確定 → **矛盾なし**。 |
| `transferBase` 境界 | 0→0、1→0、356→332、357→333、714→666（いずれも floor(×333/357) と一致）→ **矛盾なし**。 |
| 半分割・按分 | モジュールの 6 個の `example`（357→333、0→0、allocation 1/2&1/2=166、分母0退避 3 通り）を Python で独立再計算し **6/6 一致**。 |
| 分母 0 | `totalLength=0` または `totalArea=0` のとき当該項は 0。8×5⁴ = **5,000 ケース**の全走査で ZeroDivisionError／負値 **0 件** → **矛盾なし**。 |
| 按分の(full share)整合 | base が偶数（例 totalTax=714→base=666）のとき `allocation 714 1 1 1 1 = 666` で base と完全一致。base が奇数（357→333）のときは 332（= 166+166）となり 1 円少ないが、これは `half` の Nat floor に起因する丸めであり、半分割構造の脱落ではない（U-AC1 参照）。 |
| 加算混入・重複計上 | 延長項と面積項はそれぞれ別の半分を掛けて加算するのみで、base 全体の再加算はない（例 1/2 & 1/2 → 166 であって 333 ではない）→ **矛盾なし**。 |

**反例探索で検出された原文・Lean 間の数値・算術の矛盾: 0 件（ゼロ）。**

### AC-5. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchAC_axiom_probe.lean` を作成し、モジュールの名前付き宣言 **2 件**（`transferBase` / `allocation`）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。監査後、一時ファイルは**削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 2 |
| `transferBase` / `allocation` | いずれも `"does not depend on any axioms"` |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |
| その他 6 個の `example` | すべて `by decide`（カーネル還元のみ、公理を持たない） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず、propext も 0 件。公理監査は合格。**

### AC-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 | 意味 |
|---|---:|---|
| **CONFIRMED** | **0（ゼロ）** | 分数逆転・桁違い・半分割の脱落／逆転・分母 0 安全版・needle MISS・公理混入は一切検出されなかった。|
| **BY-DESIGN** | **4** | 明示された境界・モデル選択として妥当。|
| **UNRESOLVED** | **2** | pinned 原文のみでは決定不能で人間の法律専門家の確認を要する。|

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

#### CONFIRMED（0 件）

- 数値（333 / 357、二分の一×2）、算術構造、needle、すべての smoke、分母 0 安全版、公理監査のいずれにも食い違いなし。**ゼロ**。

#### BY-DESIGN（4 件）

- **B-AC1 `Money = Nat` の floor bounded モデル**: `t * 333 / 357`、`half := base / 2`、`half * entity / total` はいずれも自然数除算（floor）で、doc-comment の「bounded L4 モデル」に沿う。有理数計算や繰り上げ・四捨五入を主張する実装ではない。法的な端数処理の当否は U-AC1 で保留。
- **B-AC2 caller-established 入力・スコープ外**: 税額・各市町村の延長/面積・合計値は caller-established。道路の算定・補正（総務省令）と対象外道路の除外は doc-comment 行 24–25 で NOT MODELLED と明示済み。反映漏れではない。
- **B-AC3 分母 0 を 0 とする全関数化**: `totalLength=0` / `totalArea=0` で当該按分项を 0 とするガードは、部分関数を避けるモデル選択として透明。法的な 0 分母の扱いは U-AC2 で保留。
- **B-AC4 doc-comment の §2 引用は要約引用**: Lean 行 15–16 の doc-comment は原文 §2 から冒頭の「前項の場合においては、」を省いた形で引用しているが、数値・算術（二分の一×2、延長側／面積側の対応）は原文と一致し、誤記ではない。

#### UNRESOLVED（2 件）

- **U-AC1 端数処理（floor）の法的正当性**: 原文 art.2 は「三百五十七分の三百三十三」「二分の一」とし、端数処理を定めない。モデルは Nat の floor を採用しており、特に base が奇数のとき `half + half = base - 1`（例 base=333 → 332）となる。これは反例ではなくモデル上の丸めであるが、実際の譲与額で 1 円の差を生み得るため、**人間の法律専門家による確認を要する**（他バッチの U-1 と同趣旨、art.148 型の要約依存を避けるため明示）。
- **U-AC2 分母 0（延長／面積の合計 0）の法的取扱い**: 原文は分母 0 の場合を想定していない。全関数化して 0 を返すのは建模選択であり、法的に 0 を割り当てるべきか（あるいは算定不能とすべきか）は pinned 原文のみでは解けない。**人間の法律専門家による確認を要する**。

### AC-7. 総合判定・最終報告

- pinned revision `346AC0000000090_20260401_508AC0000000002` の Art.2（333 文字、U+3000 = 0）から独立抽出した数値・算術は、coordinator 要約／STAGING／doc-comment に依存せず、**分数 333/357・二分の一×2・延長按分＋面積按分**であることを直接確認し、Lean 定数と一致した。
- **最重要チェック 3 点（分数逆転／桁違い、半分割の脱落・逆転、分母 0 安全版）で食い違い 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。
- **CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 4 件** ／ **UNRESOLVED: 2 件**。発見ゼロを明示した。
- **needle 健全性**: 2 本（STAGING）とも U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0、各出現 1 回）。
- **反例探索**: 分数逆転・桁違い・境界値・6 smoke・分母 0 の 5,000 ケース・按分 full-share・加算混入の全てで矛盾 0 件。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` = **0 件**。2/2 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AC review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記し、既存セクションはすべて保持した。
- **書き換えファイル**: `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-AC1 端数処理の法的正当性、U-AC2 分母 0 の法的取扱い）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・日本語数字の独立抽出と再計算・needle の `.find()` 検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。
---

## Batch AD review (2026-11-20)

### AD-0. 範囲・独立性の申告

- 対象: `JapanTaxLaw/TransitionalTariffRate.lean`（関税定率法等の一部改正法 附則 第二条 / law `143AC0000000054`）のみ。Spec / Tests モジュールも参照したが、**Lean モジュールは読み取り専用で一切変更していない**。
- 一次資料（pinned・改変禁止）: `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`。`law_full_text` → `LawBody`（`children[30]`）→ `SupplProvision` → `Article[attr.Num="2"]`（`children[2]`）を直接走査し、leaf text のみを平坦化（tag / attr 名は除外）して抽出した。
- **coordinator の要約・`docs/STAGING_TARIFFRATE.md`・Lean doc-comment の数式は信じず**、pinned JSON から自前の日本語数字パーサで数値・算術を再抽出して照合した（art.148 型の「要約を信じた誤り」を再発させないため）。
- `Money = Nat`（`JapanTaxLaw/TaxFinance.lean`）を確認。負値・有理数は持たない bounded L4 モデルである。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。commit / push / merge / ブランチ切替は行っていない。

### AD-1. 独立抽出結果（pinned 原文 → 数値／算術）

- 平坦化テキストは **216 文字**、U+3000 **0**（Lean doc-comment の「216 chars, U+3000 count 0」と独立に一致）。
- 原文（全文、pinned から直接抽出）: 「（特定の期間において適用すべき新定率法別表の付表第一号に掲げる物品に対する税率等）第二条昭和五十三年四月一日から附則第一条第一号に掲げる日の前日までの間においては、改正後の関税定率法（以下この項において「新定率法」という。）別表の付表第一号の第二欄の（２）のＢに掲げる物品に係る税率は**一リットルにつき一、四〇〇円**と、同号の第二欄の（４）のＤに掲げる物品に係る税率は**一リットルにつき一三九円**として、新定率法第三条の二の規定を適用する。」
- 自前パーサ（漢数字を位置付き十進として変換、`、`は千の位区切りとして除去）による独立変換: `一、四〇〇 → 1400`、`一三九 → 139`。正規表現 `一リットルにつき([〇一二三四五六七八九十、百千万]+)円` のマッチはちょうど **2 件**、抽出値は `[1400, 139]`。

| 原文表現 | 独立抽出値 | Lean 定数／式 | 照合 |
|---|---|---|---|
| （２）のＢ「一リットルにつき一、四〇〇円」 | 1,400 円/L | `def rateB : Money := 1_400`（行 31） | ✅ |
| （４）のＤ「一リットルにつき一三九円」 | 139 円/L | `def rateD : Money := 139`（行 33） | ✅ |
| 「税率は一リットルにつき…円」＋数量 | 関税額 = リットル × 税率 | `def tariff (liters) (rate) := liters * rate`（行 36） | ✅ |

### AD-2. 最重要チェックの独立判定

1. **1,400 の桁違い: なし。** 原文「一、四〇〇」を自前パーサで独立に `1400` と確定。`140`（一〇〇／一四〇）でも `14,000`（一万四千）でもない。Lean の `rateB = 1_400` と一致。`tariff 10 rateB` の独立値は `14,000` で、140 と誤れば `1,400`、14,000 と誤れば `140,000` となるところ、Lean `#eval` は `14000` を返し誤讀を否定した。
2. **139 の抽出: なし（一致）。** 原文「一三九」→ `139`。Lean の `rateD = 139` と一致。`tariff 10 rateD = 1,390` も一致。
3. **関税額の向き・桁: なし（一致）。** 原文は「一リットルにつき…円」すなわち単価（円/L）であり、関税額 = リットル数 × 税率 が正しい向きである。Lean の `tariff liters rate = liters * rate` は被乗数がリットル数・乗数が税率で、逆数形（rate / liters）や加算混入（liters + rate）ではない。`tariff 1 rateB = 1400`、`tariff 0 rateB = 0`、`tariff 10 rateB = 14000` で桁・向きを確認。

> 最重要チェック 3 点はいずれも**食い違い 0 件**。art.148 型の「要約を信じた誤り」は再発していない。

### AD-3. needle 健全性

- `docs/STAGING_TARIFFRATE.md` の `needles` は **2 本**（STAGING の件数は参照したが内容の正しさは pinned で独立検証）。pinned の正規化テキストは AD-1 の 216 文字（U+3000 = 0）。

| # | 長さ | U+3000 | pinned 正規化テキスト |
|---|---:|---:|---|
| 1 | 157 | 0 | **FOUND**（pos=0、出現 1 回） |
| 2 | 57 | 0 | **FOUND**（pos=158、出現 1 回） |

- **2/2 FOUND、MISS 0、U+3000 は 2 本とも 0 本。** needle 1 は Caption＋「第二条」＋§1 の「…一、四〇〇円と」まで、needle 2 は「同号…一三九円として、新定率法第三条の二の規定を適用する」を覆う。文字化け・改変・重複はなし。

### AD-4. 反例探索（境界・算術）

| 攻撃対象 | 独立計算（Python） | Lean `#eval` | 結果 |
|---|---|---|---|
| `rateB` | 1400 | 1400 | 一致 |
| `rateD` | 139 | 139 | 一致 |
| リットル 0（率 B） | 0 | 0 | 一致 |
| リットル 1（率 B） | 1400 | 1400 | 一致 |
| リットル 1（率 D） | 139 | 139 | 一致 |
| リットル 10（率 B） | 14,000 | 14000 | 一致 |
| リットル 10（率 D） | 1,390 | 1390 | 一致 |
| 格子リットル 0〜5 | B: 0/1400/2800/4200/5600/7000、D: 0/139/278/417/556/695 | — | 乗算則と整合 |
| 率 B を 140 と誤讀 | `tariff 10 = 1,400`（正解 14,000 と不符） | 14000 | 誤讀なし |
| 率 B を 14,000 と誤讀 | `tariff 10 = 140,000`（正解 14,000 と不符） | 14000 | 誤讀なし |
| 向きの逆転（rate / liters） | `tariff 10 rateB` が 140 となるところ | 14000 | 逆転なし |
| 加算混入（liters + rate） | `tariff 10 rateB` が 1,410 となるところ | 14000 | 混入なし |

**反例探索で検出された原文・Lean 間の数値・算術の矛盾: 0 件（ゼロ）。**

### AD-5. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\batchAD_axiom_probe.lean` を作成し、3 モジュールの名前付き宣言 **5 件**（`rateB` / `rateD` / `tariff` / `specTariff` / `agreeTransitionalTariffRate`）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。別途 `#eval` 用一時ファイルでも exit code 0 を確認。監査後、一時ファイルは**削除済み**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 5 |
| 5 宣言すべて | `"does not depend on any axioms"` |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |
| モジュール内 `example`（`by decide`） | カーネル還元のみ、公理を持たない |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず、propext も 0 件。公理監査は合格。**

### AD-6. CONFIRMED / BY-DESIGN / UNRESOLVED の件数と一覧

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（実際の食い違い・欠陥）** | **0（ゼロ）** |
| **BY-DESIGN** | **3** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

#### CONFIRMED（0 件）

- 桁違い（1,400→140/14,000）、率 D（139）、関税額の向き・桁、needle MISS、算術不一致、禁止公理混入、反例矛盾はいずれも検出されなかった。**発見はゼロである。**

#### BY-DESIGN（3 件）

- **B-AD1 スコープは caller-established**: 適用期間（昭和五十三年四月一日から附則第一条第一号に掲げる日の前日まで）・物品区分（（２）のＢ／（４）のＤ）・リットル数は入力側の責任。第三条の二の具体的算定・付表の他欄は doc-comment どおり NOT MODELLED。反映漏れではない。
- **B-AD2 `Money = Nat` の bounded モデル**: 税率は円/リットルの整数、関税額は `liters * rate`（乗算のみ）。分数・小数・端数処理・丸めを主張する実装ではない。
- **B-AD3 doc-comment の原文引用は要約引用**: Lean 行 13–16 の「原文逐語」は `...` により中略しているが、数値（1,400 / 139）・算術（×）・物品区分は AD-1 の pinned 全文と一致し、誤記ではない。

#### UNRESOLVED（2 件）

- **U-AD1 第三条の二の算定の範囲**: 原文は本条で「新定率法第三条の二の規定を適用する」と定めるのみで、具体的な算定手順（他欄との併用・端数処理等）は pinned 原文に含まれない。本モデルが乗算のみで完全な関税額算定たり得るかは原文のみでは決定不能。**人間の法律専門家による確認を要する**（数値・算術の一致には影響しない）。
- **U-AD2 適用期間・物品区分の認定**: 実際の取引が当該期間・当該物品区分に該当するかの判断は caller-established であり、pinned 原文のみでは解けない。人間の法律専門家の確認を要する。

### AD-7. 総合判定・最終報告（サマリ）

- pinned revision `143AC0000000054_20260601_508AC0000000005` の附則 第二条（216 文字、U+3000 = 0）から独立抽出した数値・算術は、coordinator 要約／STAGING／doc-comment に依存せず、**率 B = 1,400 円/L・率 D = 139 円/L・関税額 = リットル × 税率**であることを直接確認し、Lean 定数と一致した。
- **最重要チェック 3 点（1,400 の桁違い、139 の抽出、関税額の向き・桁）で食い違い 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。
- **CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 3 件** ／ **UNRESOLVED: 2 件**。発見ゼロを明示した。
- **needle 健全性**: 2 本（STAGING）とも U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0、各出現 1 回）。
- **反例探索**: リットル 0・1・10、率 B=1400／率 D=139、0〜5 の格子、誤讀（140 / 14,000）、向き逆転、加算混入の全てで矛盾 0 件。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` = **0 件**。5/5 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AD review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記し、既存セクションはすべて保持した。
- **書き換えファイル**: `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない（`git status` は本レビュー前後とも clean）。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-AD1 第三条の二の算定範囲、U-AD2 適用期間・物品区分の認定）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・日本語数字の独立抽出と再計算・needle の `.find()` 検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

---

## Batch AE review (2026-11-20)

### AE-0. 範囲・独立性の申告

- **対象モジュール（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/ProvisionalTariffRate.lean`（関税暫定措置法 附則 art.2-2／特定の期間において適用すべき税率等、law id `335AC0000000036`）。
- **一次資料（pinned・改変禁止）**: `data/raw/335AC0000000036_20260401_508AC0000000005.law.json`（revision `335AC0000000036_20260401_508AC0000000005`）。
- **coordinator の要約を信じず**、pinned 原文から Python で直接・独立に数値を抽出して照合した。`docs/STAGING_PROVTARIFF.md`（cycle-19）は needle の取得にのみ使用し、記載数値は根拠にしていない。doc-comment の「原文逐語」も照合対象であって根拠ではない。
- **書き換えたファイルは `docs/ADVERSARIAL_REVIEW.md` のみ**。既存セクション（Batch G/H/I/J/AD ほか）はすべて保持。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。`git status --short` には他エージェントによる未追跡ファイルが存在するが、本レビューでは触れていない。

### AE-1. 独立抽出結果（pinned 原文 → Arabic → Lean 定数）

**抽出方法**: pinned JSON の全文字列リーフ **84,228** 個を再帰走査して連結し、`re.sub(r"\s+", "", …)` で正規化（U+3000 を含む全空白を除去）。正規化テキスト **617,768 文字**、U+3000 = **0**。アンカー出現: `別表第五の第二欄` 1 回（pos 45172）、`一、六〇〇円` 2 回（pos 45206 / 45286）、`一、三〇〇円` 1 回（pos 45246）、`一三七円` 2 回（pos 45326 / 383915＝他条文）、`新暫定法第八条の五` 1 回（pos 45334）。

**独立抽出した附則逐語（pos 45172 から 260 文字、空白除去済み）**:

> 別表第五の第二欄の（１）のＤに掲げる物品に係る税率は一リットルにつき一、六〇〇円と、同表の第二欄の（２）のＢに掲げる物品に係る税率は一リットルにつき一、三〇〇円と、同表の第二欄の（３）のＧに掲げる物品に係る税率は一リットルにつき一、六〇〇円と、同表の第二欄の（４）のＤに掲げる物品に係る税率は一リットルにつき一三七円として、新暫定法第八条の五の規定を適用する。

| 区分 | 原文金額文字列 | 独立抽出値（円/L） | Lean 定数 | 照合 |
|---|---|---:|---|:---:|
| （１）のＤ | 一、六〇〇 | **1600** | `rate1D = 1_600` | ✅ |
| （２）のＢ | 一、三〇〇 | **1300** | `rate2B = 1_300` | ✅ |
| （３）のＧ | 一、六〇〇 | **1600** | `rate3G = 1_600` | ✅ |
| （４）のＤ | 一三七 | **137** | `rate4D = 137` | ✅ |

- 機械比較 `observed == lean` は **True（4/4 一致）**。
- **関税額の向き・桁**: 原文「一リットルにつき△△円」より `tariff (liters) (rate) := liters * rate`（リットル × 税率）が正しい。`Money` は `abbrev Money := Nat`（`TaxFinance.lean` 行 29）で符号・端数・オーバーフローの懸念なし。

### AE-2. 最重要チェック（art.148 型の失敗の再発防止）

coordinator 要約を経由せず、pinned 原文の文字列から直接桁を確定した。

| 検証項目 | 独立抽出値 | Lean | 判定 |
|---|---:|---:|---|
| 一、六〇〇円 → 1600（桁違い 160／16,000 の排除） | 1600 | `1_600` | **正しい**。160 / 16,000 は抽出値と不一致として検出される |
| 一、三〇〇円 → 1300（桁違い 130／13,000 の排除） | 1300 | `1_300` | **正しい**。130 / 13,000 は検出される |
| 一三七円 → 137（桁違い 1,370／13 の排除） | 137 | `137` | **正しい**。1,370 / 13 は検出される |
| 関税額 = リットル × 税率 | `liters * rate` | `tariff` | **正しい**。L=10 で乗算 16,000/1,370 に対し除算なら 160/13 となり明確に区別できる |

→ **最重要チェック 4 点すべてで食い違い 0 件（ゼロ）。** art.148 で問題になった「要約を信じた誤り」は再発していない。

### AE-3. needle 健全性

`docs/STAGING_PROVTARIFF.md` の cycle-19 needle **2 本**を、pinned 正規化テキストに対して `.find()` で検証した。

| # | needle（抜粋） | U+3000 | 長さ | 検出位置 | 結果 |
|---:|---|:---:|---:|---:|:---:|
| 1 | 同表の第二欄の（２）のＢに掲げる物品に係る税率は一リットルにつき一、三〇〇円 | 0 | 38 | 45214 | **FOUND** |
| 2 | 同表の第二欄の（４）のＤに掲げる物品に係る税率は一リットルにつき一三七円として、新暫定法第八条の五の規定を適用する | 0 | 57 | 45294 | **FOUND** |

- **2/2 FOUND（MISS 0）**、U+3000 含有 **0 本**。pinned 正規化テキスト全体の U+3000 も 0。

### AE-4. 反例探索の結果

`tariff (liters) (rate) = liters * rate`（Nat 乗算）を独立再計算し、モジュールの `example` 4 件と照合した。

| 攻撃対象 | 結果 |
|---|---|
| リットル 0（4 率すべて） | 0 / 0 / 0 / 0。`example : tariff 0 rate1D = 0` と一致。**矛盾なし**。 |
| リットル 1（4 率すべて） | 1600 / 1300 / 1600 / 137。原文「一リットルにつき」と整合。`example tariff 1 rate1D = 1600`、`tariff 1 rate4D = 137` と一致。**矛盾なし**。 |
| リットル 10（4 率すべて） | 16000 / 13000 / 16000 / 1370。`example tariff 10 rate2B = 13000` と一致。**矛盾なし**。 |
| 4 率 × {0,1,10} = 12 点グリッド | 全点で独立計算値と Lean 定数が一致。**矛盾なし**。 |
| 桁違い候補（160/16,000、130/13,000、1,370/13） | すべて `detected=True`（pinned 抽出値と不一致として排除）。**矛盾なし**。 |
| 向き逆転（税率 ÷ リットル） | L=10 で 16000↔160、1370↔13 と明確に異なり、実装は乗算側。**矛盾なし**。 |
| Nat オーバーフロー／端数 | `Money = Nat`（任意精度）で乗算のみ。切り捨て・丸め・負数は発生しない。**矛盾なし**。 |

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

### AE-5. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\ae_axiom_probe.lean` を作成し、モジュールの名前付き宣言 **5 件**すべてに `#print axioms` を実行（`lake env lean`、exit code **0**）。監査後、一時ファイルは削除済み。
- `run_cmd` で環境内定数名を列挙した結果、本名前 space の永続定数は下記 5 件のみ（`example` は名前付き定数として残らない）。走査 **5/5**。

| 宣言 | 結果 |
|---|---|
| `JapanTaxLaw.ProvisionalTariffRate.rate1D` | does not depend on any axioms |
| `JapanTaxLaw.ProvisionalTariffRate.rate2B` | does not depend on any axioms |
| `JapanTaxLaw.ProvisionalTariffRate.rate3G` | does not depend on any axioms |
| `JapanTaxLaw.ProvisionalTariffRate.rate4D` | does not depend on any axioms |
| `JapanTaxLaw.ProvisionalTariffRate.tariff` | does not depend on any axioms |

| 監査項目 | 結果 |
|---|---|
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず、propext も 0 件。公理監査は合格。**

### AE-6. CONFIRMED / BY-DESIGN / UNRESOLVED の分類と件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **3** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 数値・桁・向き・needle・公理のいずれにも食い違いはなかった。欠陥件数を手柄にしない。

#### CONFIRMED（0 件）

- 金額: 1600 / 1300 / 1600 / 137 の 4 値すべてで pinned 原文と Lean 定数が一致。桁違い（160 / 16,000 / 130 / 13,000 / 1,370）なし。
- 算術: `tariff = リットル × 税率` の向き・桁が原文と一致。加算・除算・桁ずれの混入なし。
- needle: 2 本とも U+3000 なし・FOUND。簡体字混入・原文改変なし。

#### BY-DESIGN（3 件）

- **B-AE1 適用期間・物品区分・リットル数は caller-established**: doc-comment 行 23 に明記。本モデルは与えられたリットル数と税率の乗算のみを提供する。欠落ではない。
- **B-AE2 `Money = Nat` の bounded モデル**: 負数・端数・丸め・オーバーフローを扱わず、`liters * rate` の自然数乗算のみ。attenuation や他欄との併用は対象外として明示済み。
- **B-AE3 第八条の五の具体的算定・付表の他欄は NOT MODELLED**: doc-comment 行 24 に明記。スコープ外の反映漏れではない。

#### UNRESOLVED（2 件）

- **U-AE1 第八条の五の具体的算定手順（端数処理等）**: 原文は「新暫定法第八条の五の規定を適用する」と定めるのみで、具体的算定手順は pinned 原文に含まれない。本モデルが乗算のみで完全な関税額算定たり得るかは原文のみでは決定不能。**人間の法律専門家による確認を要する**（数値・算術の一致には影響しない）。
- **U-AE2 適用期間・物品区分の該当性認定**: 実際の取引が当該期間・当該物品区分に該当するかの判断は caller-established であり、pinned 原文のみでは解けない。**人間の法律専門家による確認を要する**。

### AE-7. 総合判定・最終報告（サマリ）

- pinned revision `335AC0000000036_20260401_508AC0000000005` の附則（正常化テキスト 617,768 文字、U+3000 = 0）から独立抽出した 4 税率は **1600 / 1300 / 1600 / 137 円/L** であり、coordinator 要約・STAGING・doc-comment に依存せず Lean 定数 `rate1D` / `rate2B` / `rate3G` / `rate4D` と一致した。
- **最重要チェック（1600 の桁違い、1300 の桁違い、137 の抽出、関税額の向き・桁）で食い違い 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。
- **CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 3 件** ／ **UNRESOLVED: 2 件**。発見ゼロを明示した。
- **needle 健全性**: 2 本（STAGING_PROVTARIFF）とも U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0）。
- **反例探索**: リットル 0・1・10、4 率、12 点グリッド、桁違い候補、向き逆転、Nat オーバーフローの全てで矛盾 0 件。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` = **0 件**、`propext` = **0 件**。5/5 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AE review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記し、既存セクションはすべて保持した。
- **書き換えファイル**: `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-AE1 第八条の五の算定範囲、U-AE2 適用期間・物品区分の認定）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・日本語数字の独立抽出と再計算・needle の `.find()` 検証・整数式の反例走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

---

## Batch AF review (2026-11-20)

### AF-0. 範囲・独立性の申告

- **対象モジュール（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/ReformDoubleBasicDeduction.lean`（税制改革関連法 art.9「相続税及び贈与税の負担の軽減及び合理化等」、law id `363AC0000000107`）。
- **一次資料（pinned・改変禁止）**: `data/raw/363AC0000000107_19881230_000000000000000.law.json`（revision `363AC0000000107_19881230_000000000000000`、公布日 1988-12-30）。
- **coordinator の要約を信じず**、pinned 原文から Python で直接・独立に算術を抽出して照合した。`docs/STAGING_REFORMDOUBLE.md`（cycle-20）は needle の取得にのみ使用し、その記載内容は根拠にしていない。Lean モジュールの doc-comment 内「原文逐語」も照合対象であって根拠ではない。
- **書き換えたファイルは `docs/ADVERSARIAL_REVIEW.md` のみ**。既存セクション（Batch G〜AE ほか）はすべて保持。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。`git status --short` には他エージェントによる `docs/BLOCKED.md` / `docs/COVERAGE.md` のレビューセッション数更新が存在するが、本レビューでは一切触れていない。

### AF-1. 独立抽出結果（pinned 原文 → 算術 → Lean 定数）

**抽出方法**: `law_full_text` 配下の文字列リーフ **117 個**を再帰走査（`tag` / `attr` のメタデータ文字列は除外し、真のテキストリーフのみを収集）、`re.sub(r"\s+", "", …)` で正規化（U+3000 を含む全空白を除去）。正規化テキスト **4,023 文字**、U+3000 = **0**。Art.9 を構成する 11 リーフを平坦化した正規化テキストは **286 文字**、U+3000 = **0**（doc-comment 行 10 の「286 chars, U+3000 count 0」申告と一致）。

**独立抽出した Art.9 逐語（286 文字、空白除去済み）**:

> （相続税及び贈与税の負担の軽減及び合理化等）第九条次の措置を講ずることにより相続税の負担の軽減及び合理化を図る。一健全な資産の形成と国民生活の安定等に配慮し、遺産に係る基礎控除等を二倍に引き上げるとともに、税率区分の幅を拡大するほか、最高税率を引き下げること。二配偶者の生活の安定に資するため、配偶者が相続により取得した財産について非課税とする範囲を拡大すること。２相続税の負担の公平の確保を図るため、遺産に係る基礎控除等の算定の基礎となる相続人の数に含まれる養子の数を制限する措置を講ずる。３相続税の改正との関連において、贈与税の税率区分の幅を拡大する等の措置を講ずる。

| 原文（pinned Art.9 第1号） | 独立抽出した算術 | Lean 定数 | 照合 |
|---|---|---|:---:|
| 「遺産に係る基礎控除等を**二倍**に引き上げる」 | `doubled = base × 2`（2 倍） | `def doubled (base : Money) : Money := base * 2`（行 30） | ✅ |

- 機械比較 `observed == lean` は **True（1/1 一致）**。
- `Money` は `JapanTaxLaw.TaxFinance` の `abbrev Money := Nat` であり、符号・端数・オーバーフローの懸念なし。Nat 乗算のみで算術は閉じている。

### AF-2. 最重要チェック（art.148 型の失敗の再発防止）

coordinator 要約・STAGING を経由せず、pinned 原文の文字列から直接「二倍」の意味を確定した。

| 検証項目 | 独立抽出結果（Art.9 正規化テキスト） | Lean | 判定 |
|---|---|---|---|
| 「遺産に係る基礎控除等を二倍に引き上げる」= 2 倍 | 完全一致 **1 回**、「二倍」**1 回** | `base * 2` | **正しい**。base × 2 として符号化 |
| 1/2（半分）と誤る誤り | 「一倍」「半分」「二分の一」「1/2」すべて **0 回** | — | **検出されず** |
| +2（二円分の加算）と誤る誤り | 「+2」「二円」「二つ」すべて **0 回** | — | **検出されず** |
| 本条は税制改革の基本方針規定であり actual 控除額は個別法令で定義される点 | doc-comment 行 19–20 に明記（「実際の控除額は個別法令（相続税法 etc.）で定義される。base は caller-established。」） | Scope コメント | **正しい**。NOT MODELLED として明示済み |

→ **最重要チェック 4 点すべてで食い違い 0 件（ゼロ）。** art.148 で問題になった「要約を信じた誤り」は再発していない。

### AF-3. needle 健全性

`docs/STAGING_REFORMDOUBLE.md` の cycle-20 needle **2 本**を、pinned 正規化テキスト（4,023 文字）に対して `.find()` で検証した。

| # | needle（全文） | U+3000 | 長さ | 検出位置（正規化テキスト） | 結果 |
|---:|---|:---:|---:|---:|:---:|
| 1 | （相続税及び贈与税の負担の軽減及び合理化等）第九条次の措置を講ずることにより相続税の負担の軽減及び合理化を図る | 0 | 55 | 1908 | **FOUND** |
| 2 | 遺産に係る基礎控除等を二倍に引き上げるとともに、税率区分の幅を拡大するほか、最高税率を引き下げること | 0 | 50 | 1987 | **FOUND** |

- **2/2 FOUND（MISS 0）**、U+3000 含有 **0 本**。pinned 正規化テキスト全体の U+3000 も 0。
- 両 needle は Art.9 正規化テキスト内でもそれぞれ pos 0 / pos 79 に FOUND であり、原文改変・簡体字混入なし（モジュール中の簡体字疑わしい文字 `遗` `产` `県` `権` `债` `质` `许` `録` `证` はすべて 0 件。検出された `税` 12 件 / `関` 1 件は正しい日本語漢字）。

### AF-4. 反例探索の結果

`doubled (base) = base * 2`（Nat 乗算）を独立再計算し、モジュールの `example` 4 件（`by decide`）と照合した。

| 攻撃対象 | 独立計算値 | Lean example | 結果 |
|---|---:|---|---|
| base = 0 | 0 | `doubled 0 = 0` | **矛盾なし** |
| base = 1 | 2 | `doubled 1 = 2` | **矛盾なし** |
| base = 500 | 1000 | `doubled 500 = 1000` | **矛盾なし** |
| base = 1,000,000 | 2,000,000 | `doubled 1_000_000 = 2_000_000` | **矛盾なし** |
| 誤モデル識別（base = 500） | 正: `500 × 2 = 1000`／誤: `500 ÷ 2 = 250`／誤: `500 + 2 = 502` | `base * 2` | 2 種の誤モデルは正値と明確に異なり、実装は乗算側。**矛盾なし** |
| Nat オーバーフロー／端数／負数 | 乗算のみ、切り捨て・丸め・符号なし | `Money = Nat` | **矛盾なし** |

- 4 境界（0 / 1 / 500 / 100万）すべてで独立計算値と Lean 定数が一致。モジュール import は成功（`by decide` の 4 example すべて成立）。

**反例探索で検出された原文・Lean 間の矛盾: 0 件（ゼロ）。**

### AF-5. 公理監査結果

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\af_axiom_probe.lean` を作成し、本モジュールの名前付き宣言 **1 件**に対して `#print axioms` を実行（`lake env lean`、exit code **0**）。4 つの `example` は名前付き定数として残らないため走査対象外。監査後、一時ファイルは削除済み。

| 宣言 | 結果 |
|---|---|
| `JapanTaxLaw.ReformDoubleBasicDeduction.doubled` | does not depend on any axioms |

| 監査項目 | 結果 |
|---|---|
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず、propext も 0 件。公理監査は合格（1/1 走査、exit code 0）。**

### AF-6. CONFIRMED / BY-DESIGN / UNRESOLVED の分類と件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **3** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 算術・桁・向き・needle・公理のいずれにも食い違いはなかった。欠陥件数を手柄にしない。

#### CONFIRMED（0 件）

- 算術: 「二倍に引き上げる」= base × 2 を pinned 原文から独立抽出し、Lean の `base * 2` と一致。1/2 誤り・+2 誤りは原文に存在せず検出されなかった。
- 境界: 0 / 1 / 500 / 100万の 4 点ですべて独立計算値と Lean `example` が一致。桁違い・向き逆転なし。
- needle: 2 本とも U+3000 なし・FOUND。簡体字混入・原文改変なし。
- 公理: 禁止公理すべて 0 件。

#### BY-DESIGN（3 件）

- **B-AF1 `base` は caller-established**: doc-comment 行 20 に明記。本モデルは与えられた `base` への ×2 のみを提供する。実際の基礎控除額を本モデルで算出しない設計であり、欠落ではない。
- **B-AF2 本条は税制改革の基本方針規定であり actual 控除額は個別法令で定義される**: doc-comment 行 19–20 に明記（最重要チェックのとおり NOT MODELLED として明示済み）。スコープ外の反映漏れではない。
- **B-AF3 その他の措置は NOT MODELLED**: 税率区分の拡大・最高税率の引き下げ・配偶者非課税範囲の拡大・養子数の制限・贈与税税率区分の拡大を、doc-comment 行 21–22 で過不足なく列挙し NOT MODELLED と明記。pinned 原文の第1号・第2号・第2項・第3項に相当する。

#### UNRESOLVED（2 件）

- **U-AF1 「遺産に係る基礎控除等」の具体的な算定基礎**: 原文は「基礎控除等を二倍に引き上げる」と定めるのみで、基礎控除額自体の定義・特例は pinned 原文（本条）に含まれない（個別法令に委ねる旨は B-AF2 のとおり明記）。本モデルが `base × 2` のみで実額算定たり得るかは原文のみでは決定不能。**人間の法律専門家による確認を要する**（数値・算術の一致には影響しない）。
- **U-AF2 「二倍に引き上げる」の法的効果の及ぶ範囲**: 経過措置・他条文との関係・施行日等の判断は pinned 原文のみでは解けない。caller-established の範囲にはあるが、その認定は原文から確定不能。**人間の法律専門家による確認を要する**。

### AF-7. 総合判定・最終報告（サマリ）

- pinned revision `363AC0000000107_19881230_000000000000000` の Art.9（flat/normalized 286 文字、U+3000 = 0）から独立抽出した算術「二倍 = base × 2」は、coordinator 要約・STAGING・doc-comment に依存せず Lean 定数 `doubled = base * 2` と一致した。
- **最重要チェック（二倍 = ×2、1/2 誤りなし、+2 誤りなし、基本方針規定・actual 控除額は個別法令で定義される点の NOT MODELLED 明記）で食い違い 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。
- **CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 3 件** ／ **UNRESOLVED: 2 件**。発見ゼロを明示した。
- **needle 健全性**: 2 本（STAGING_REFORMDOUBLE）とも U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0）。
- **反例探索**: base 0 / 1 / 500 / 100万の 4 境界、誤モデル（÷2 / +2）識別、Nat オーバーフローの全てで矛盾 0 件。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` すべて **0 件**。1/1 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AF review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記し、既存セクションはすべて保持した。
- **書き換えファイル**: `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-AF1 基礎控除額の算定基礎、U-AF2 二倍引き上げの法的効果の範囲）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・算術の独立抽出と再計算・needle の `.find()` 検証・境界値走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。
## Batch AG review (2026-11-20)

### AG-0. 範囲・独立性の申告

- **対象モジュール（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/TonnageTaxPenalty.lean`（特別とん税法 art.10「罰則」、law id `332AC0000000038`、revision `332AC0000000038_20250601_504AC0000000068`）。
- **一次資料（pinned・改変禁止）**: `data/raw/332AC0000000038_20250601_504AC0000000068.law.json`（art.10）。
- **coordinator の要約・担当 STAGING・Lean doc-comment の「原文逐語」を信じず**、pinned 原文から Python で直接・独立に漢字数字を抽出して照合した。needle は手打ちせず CI 実装 `scripts/ci/transcription_audit.py` の `checks()` から取得した。
- **書き換えたファイルは `docs/ADVERSARIAL_REVIEW.md` のみ**。既存セクション（Batch A〜AF ほか）はすべて保持。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。

### AG-1. 独立抽出結果（pinned 原文 → 漢字数字 → Lean 定数）

**抽出方法**: `law_full_text` を CI `transcription_audit.py` の `text()` と同一ロジックで再帰平坦化（pinned ファイル全体の正規化テキスト **5,044 文字**、U+3000 = **0**）。`MainProvision` 配下の `Article[attr.Num="10"]` を直接走査し、art.10 の全 3 項を逐語取得。**flat/normalized 178 文字、U+3000 = 0**（doc-comment 行 10 の「178 chars, U+3000 count 0」申告と一致）。

**独立抽出した art.10 逐語（178 文字、一字一句改変なし）**:

> （罰則）第十条偽りその他不正の行為により、特別とん税を免れ、又は納付すべき特別とん税を納付しなかつた者は、三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する。２前項の犯罪の実行に着手してこれを遂げない者についても、同項の例による。３前二項の場合においては、特別とん税を納付すべき者から、国税徴収の例により、直ちにその特別とん税を徴収する。

| 原文（pinned art.10 第1項） | 独立抽出（自前 kansuji パーサ） | Lean 定数 | 照合 |
|---|---|---|:---:|
| 「**三年**以下の拘禁刑」 | `三` = 3 | `def maxImprisonmentYears : Nat := 3`（行 32） | ✅ |
| 「**五十万**円以下の罰金」 | `五十万` = 50 × 10^4 = 500,000 | `def maxFineYen : Money := 500_000`（行 34） | ✅ |

- 機械比較 `observed == lean` は **True（2/2 一致）**。`Money` は `JapanTaxLaw.TaxFinance` の `abbrev Money := Nat` であり、符号・端数・オーバーフローの懸念なし。
- **原文は第1項・第2項・第3項の 3 項構成**。第3項（§3 徴収手続:「国税徴収の例により、直ちに…徴収する」）の存在も独立確認した（doc-comment は §1・§2 と並び §3 を NOT MODELLED と明記 → AG-6 B-AG3）。

### AG-2. 最重要チェック（art.148 型の失敗の再発防止）

coordinator 要約・STAGING を経由せず、pinned 原文の文字列から直接上限値を確定した。

| 検証項目 | 独立抽出結果（pinned art.10 正規化テキスト） | Lean | 判定 |
|---|---|---|---|
| 「三年以下の拘禁刑」= 3 年以下 | `三年以下` **1 回**、`三` を自前パーサで 3 と変換 | `maxImprisonmentYears = 3` | **正しい** |
| 「五十万円以下の罰金」= 500,000 円以下 | `五十万円以下` **1 回**、`五十万` = 500,000 と変換 | `maxFineYen = 500_000` | **正しい** |
| 桁違い: 3 年 → 30 年 | `三十年` **0 回**（原文に存在せず） | 定数 3（`≠ 30`） | **検出されず** |
| 桁違い: 50 万 → 5 万 | `五万円` **0 回** | 定数 500,000（`∉ {50,000}`） | **検出されず** |
| 桁違い: 50 万 → 500 万 | `五百万円` **0 回** | 定数 500,000（`∉ {5,000,000}`） | **検出されず** |
| 犯罪成立要件・未遂範囲・§3 徴収手続の NOT MODELLED 明記 | 原文 §1 / §2 / §3 に対応 | doc-comment 行 22–24 に明記 | **正しい** |

→ **最重要チェック 6 点すべてで食い違い 0 件（ゼロ）。** art.148 で問題になった「要約を信じた誤り（桁違い等）」は再発していない。

### AG-3. needle 健全性（CI 実装の 2 本を直接検証）

`scripts/ci/transcription_audit.py` の `checks()` を Python で import し、`law_id = 332AC0000000038` の `TonnageTaxPenalty.lean` check（kind = `file`）に組み込まれた **2 本**の needle を取得（手打ちせず、STAGING／doc-comment の申告は信じない）。pinned `law_full_text` の正規化テキスト（CI `contains()` / `_norm()` と同一条件 `re.sub(r"[\s　]+", "", …)`）に対して `.find()` / `.count()` を実行した。

| # | needle（全文） | 長さ | U+3000 | FOUND | count | offset（正規化） |
|---:|---|---:|:---:|:---:|---:|---:|
| 1 | （罰則）第十条偽りその他不正の行為により、特別とん税を免れ、又は納付すべき特別とん税を納付しなかつた者は、三年以下の拘禁刑若しくは五十万円以下の罰金に処し、又はこれを併科する | 87 | 0 | ✅ | 1 | 1371 |
| 2 | 前項の犯罪の実行に着手してこれを遂げない者についても、同項の例による | 34 | 0 | ✅ | 1 | 1460 |

- **needle 総数 2 本、U+3000 含有 0 本、2/2 FOUND（MISS 0）、すべて count 1（一意）。** needle 文字列の改変・正規化・異体字変換はしていない。
- 補足: §3（徴収手続）は needle に含まれないが、これは AG-6 B-AG3 のとおり NOT MODELLED として明示されたスコープ外であり、needle 欠落ではない。

### AG-4. 反例探索（境界値・桁違いの独立走査）

`by decide` スモークを信じず、`withinLimits years fine := years ≤ 3 && fine ≤ 500_000` を Python で独立再実装し、境界を走査した。**不一致 0 件（MISMATCH_COUNT = 0）**。

| ケース | 入力 (years, fine) | 独立計算 | 期待値 | 結果 |
|---|---|---:|---:|---|
| 境界（双方上限ぴったり） | (3, 500000) | true | true | ✅ |
| 年数超過 | (4, 500000) | false | false | ✅ |
| 罰金超過 | (3, 500001) | false | false | ✅ |
| 双方超過 | (4, 500001) | false | false | ✅ |
| ゼロ | (0, 0) | true | true | ✅ |
| 内部点 | (2, 499999) | true | true | ✅ |
| 年数 Extrem（100万） | (1000000, 0) | false | false | ✅ |
| 罰金 Extrem（10億） | (0, 1000000000) | false | false | ✅ |

- 8 ケースすべてで独立計算値と期待値が一致。桁違い（30 年・5 万・500 万）を採った誤モデルなら境界 (3, 500000) は true にならないか (4, 500000) が true になるところ、実装はいずれも拒否しており**誤モデルは検出されず**。
- モジュールの `example` 6 件（`by decide`）は、上限定数 2 件・境界 3 年/50 万円 true・0/0 true・4 年 false・500001 円 false をカバーし、上記独立走査と整合（import 成功、exit code 0）。
- **反例（不一致）検出数: 0 件。**

### AG-5. 公理監査（`lake env lean` / `#print axioms`）

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\ag_axiom_probe.lean` を作成し、本モジュールの名前付き宣言 **3 件**（`maxImprisonmentYears` / `maxFineYen` / `withinLimits`）すべてに `#print axioms` を実行（`lake env lean`、exit code **0**、エラー 0）。6 つの `example` は名前付き定数として残らないため走査対象外。監査後、一時ファイルは削除済み。

| 宣言 | 結果 |
|---|---|
| `JapanTaxLaw.TonnageTaxPenalty.maxImprisonmentYears` | does not depend on any axioms |
| `JapanTaxLaw.TonnageTaxPenalty.maxFineYen` | does not depend on any axioms |
| `JapanTaxLaw.TonnageTaxPenalty.withinLimits` | does not depend on any axioms |

| 監査項目 | 結果 |
|---|---:|
| 走査宣言数 | 3 |
| axiom-free（`does not depend on any axioms`） | **3** |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在・許容範囲内） |

→ **禁止公理（Classical.choice / sorryAx / Quot.sound）は一切検出されず、propext も 0 件。公理監査は合格（3/3 走査、exit code 0）。**

### AG-6. CONFIRMED / BY-DESIGN / UNRESOLVED の分類と件数

| 分類 | 件数 |
|---:|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **4** |
| **UNRESOLVED** | **3** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 数値・桁・境界・needle・公理のいずれにも食い違いはなかった。欠陥件数を手柄にしない。

#### CONFIRMED（0 件）

- 数値: 「三年以下」= 3、「五十万円以下」= 500,000 を pinned 原文から独立抽出し、Lean 定数と一致（2/2）。30 年・5 万・500 万の桁違いは原文・実装の双方に存在せず検出されなかった。
- 境界: (3,500000)=true / (4,500000)=false / (3,500001)=false / (4,500001)=false / (0,0)=true を含む 8 ケースですべて期待値どおり。反例なし。
- needle: 2 本とも U+3000 なし・FOUND・count 1。原文改変なし。
- 公理: 禁止公理すべて 0 件、3/3 axiom-free。

#### BY-DESIGN（4 件）

- **B-AG1 上限定数のみを提供する設計**: `maxImprisonmentYears` / `maxFineYen` / `withinLimits` は罰則の数値上限と境界判定のみを与え、個別事案の科刑（刑の選択・量刑）は行わない。doc-comment 行 22–24 に「実際の科刑は司法判断に委ねられ、本モデルは法的レビューを提供しない」と明記。スコープ外の反映漏れではない。
- **B-AG2 「併科する」の表現**: 原文 §1 の「若しくは…に処し、又はこれを併科する」について、本モデルは `withinLimits` が双方 simultaneously に上限内であることを許す（(3,500000)=true）ことで併科可能性を暗黙に表現する。専用の `concurrent` 述語は持たないが、doc-comment が「『併科可能性』の規定のみを扱う」とスコープを明記しており、設計選択である。
- **B-AG3 §1・§2 の犯罪成立要件・未遂範囲は NOT MODELLED**: 「偽りその他不正の行為」の具体的認定・§2「実行に着手してこれを遂げない者」の認定は、doc-comment 行 23 で「犯罪の成立要件（不正行為の具体的認定）、未遂の範囲…は NOT MODELLED」と明記済み。needle 2 本で原文を逐語保持している。
- **B-AG4 §3 の徴収手続は NOT MODELLED**: 原文 §3「前二項の場合においては、特別とん税を納付すべき者から、国税徴収の例により、直ちにその特別とん税を徴収する。」は、doc-comment 行 23 で「§3 の徴収手続は NOT MODELLED」と明記済み。needle には含まれないがスコープ外の明示であり、欠落ではない。

#### UNRESOLVED（3 件）

- **U-AG1 「偽りその他不正の行為」の具体的認定**: 何が「不正の行為」に該当するか、免れ・納付しなかつた者の認定基準は pinned 原文（本条）のみでは確定不能。本モデルは上限値のみを扱うため数値・境界の一致には影響しないが、**人間の法律専門家による確認を要する**。
- **U-AG2 未遂（§2「実行に着手してこれを遂げない者」）の範囲**: 「実行に着手」の時点・遂げない者への「同項の例による」の具体的適用範囲は pinned 原文のみでは解けない。**人間の法律専門家による確認を要する**。
- **U-AG3 §3 徴収手続（「国税徴収の例により、直ちに…徴収する」）の具体的内容**: 「国税徴収の例」が指す手続は他法令に委ねられ pinned 原文に含まれない（B-AG4 のとおり NOT MODELLED 明記）。**人間の法律専門家による確認を要する**。

### AG-7. 総合判定・最終報告（サマリ）

- pinned revision `332AC0000000038_20250601_504AC0000000068` の art.10（flat/normalized 178 文字、U+3000 = 0）から独立抽出した「三年以下 = 3」「五十万円以下 = 500,000」は、coordinator 要約・STAGING・doc-comment に依存せず Lean 定数 `maxImprisonmentYears = 3` / `maxFineYen = 500_000` と一致した。
- **最重要チェック（3 年 / 500,000 円、30 年・5 万・500 万の桁違い回避、犯罪成立要件・未遂範囲・§3 徴収手続の NOT MODELLED 明記）で食い違い 0 件（ゼロ）。** art.148 型の「要約を信じた誤り」は再発していない。
- **CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 4 件** ／ **UNRESOLVED: 3 件**。発見ゼロを明示した。
- **needle 健全性**: CI 実装の 2 本とも U+3000 **0 本**、pinned 正規化テキスト **2/2 FOUND**（MISS 0、すべて count 1）。
- **反例探索**: 境界 (3,500000)=true / (4,500001)=false / (0,0)=true を含む 8 ケース、桁違い誤モデル識別、Extrem 値の全てで矛盾 0 件。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` すべて **0 件**。3/3 宣言を走査、exit code 0。監査用一時ファイルは削除済み。
- **見出し**: `## Batch AG review (2026-11-20)` は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法)[^\n]*review` に **match することを Python で確認済み**。本セクションを `docs/ADVERSARIAL_REVIEW.md` 末尾に追記し、既存セクションはすべて保持した。
- **書き換えファイル**: `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール／`data/*` は一切変更せず、commit / push / merge / ブランチ切替は行っていない。解析用一時ファイルはすべて削除済み。
- 残る UNRESOLVED（U-AG1 不正行為の認定、U-AG2 未遂の範囲、U-AG3 §3 徴収手続）は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・漢字数字の独立抽出と照合・needle の `.find()` 検証・境界値走査・`#print axioms` 公理監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって人間の法的レビューを完了したものとはみなさない。

---

## Batch AH review (2026-11-20) — 地方税法 art. 38 個人の均等割の標準税率

- **レビュア役割**: Adversarial Review Agent（FORMALIZE/PROVE から独立）
- **対象モジュール（読み取り専用・変更していない）**: `JapanTaxLaw/PerCapitaEqualRate.lean`, `PerCapitaEqualRateSpec.lean`, `PerCapitaEqualRateTests.lean`
- **一次資料（pinned・改変禁止）**: `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  - law_id `325AC0000000226`, revision `325AC0000000226_20261101_508AC0000000002`, 施行日 2026-11-01, SHA-256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`
- **抽出方法**: 一次資料の JSON を直接再帰走査し、`MainProvision` 配下の `Article` のうち `attr.Num == "38"` かつ `ArticleTitle == （個人の均等割の税率）` のノードのみを選んだ。STAGING / doc-comment / coordinator 要約は一切信じず、原文テキストから **独立** に **再抽出** した。
- **再抽出結果**: 「個人の均等割の標準税率は、千円とする。」（正規化 35 文字）。漢字数字 「千」 を自前で Arabic 1,000 に変換。原文に 「千円」 は 1 回のみ。
- **照合**: Lean 実装 `standardRate = 1_000`、独立仕様 `specRateYen = 1000` と一致。桁違い（100 / 10,000 / 100,000）は混入していない。

### H / T / D / C / U（本バッチの検出候補）

- **H（反証可能仮説）**: H-AH1 「標準税率は千円 (=1,000) である」；H-AH2 「perpiece 相当の算術適用 n×1,000 は本条の範囲内である」。
- **T（再現検査）**: T-AH1 pinned JSON の当該 Article のみを再抽出し `.find("千円")` = 1 を確認；T-AH2 `python scripts/ci/transcription_audit.py` の新規 needle が scoped で PASS；T-AH3 Lean の boundary examples (0/1/11/12/13) が全て kernel `decide` で通る。
- **D（合否）**: D-AH1 = PASS（1,000 一致）；D-AH2 = PASS（境界 5 点すべて一致、矛盾 0）。
- **C（対立解釈）**: C-AH1 「千円は標準税率であり条例で変更され得る」— 本スライスは標準税率のみを扱い、条例変更は NOT MODELLED として明記（対立解釈を否定せず範囲外として保持）。
- **U（不確かさ）**: U-AH1 均等割の算出単位（「一人につき」の明示は本条になく、他条との関係は pinned 原文のみでは確定不能）— 人間の法律専門家レビューを要する。U-AH2 軽減・免除該当者の扱いは原文に含まれず NOT MODELLED。

**CONFIRMED: 0 件（ゼロ）** ／ **BY-DESIGN: 1 件** ／ **UNRESOLVED: 2 件**。発見ゼロは欠陥不在の証明ではない。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。法的妥当性の最終判断は専門家に委ね、`LEGAL_REVIEW_PENDING` は変更しない。

## 地方税法 art. 74の5 — LocalTobaccoTaxRate（独立原文監査）

- 対象モジュール（読み取り専用・形式化担当から独立）:
  `JapanTaxLaw/LocalTobaccoTaxRate.lean`, `LocalTobaccoTaxRateSpec.lean`,
  `LocalTobaccoTaxRateTests.lean`
- 一次資料（pinned・改変禁止）:
  `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
  law_id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002`
- 独立再抽出: 形式化担当の STAGING を信じず、上記 JSON の Article `Num=74_5` を
  再帰走査して逐語「たばこ税の税率は、千本につき千七十円とする。」を取得。
  漢数字「千七十」を自前で 1,070 に変換し、実装 `ratePerThousand` と
  独立仕様 `specRateYen` の両方と照合（D=PASS）。
- 対立解釈（C）: 「千七十円」を 1,700 円／170,000 円と読む誤りを境界例で拒否。
  単位は円/千本であり、課税標準・按分・附則は本スライスの射程外。
- 不確かさ（U）: 数値一致は原文忠实性を示すのみで、法的正確性・人間レビューを
  含意しない。LEGAL_REVIEW_PENDING は別軸で維持。

## Batch AI review (2026-11-20) — 森林環境譲与税法 art.31 / 相続税法施行令 art.5の2 / 税理士法施行令 art.6の2（cycle-23/24/25 独立原文照合）

- **レビュア役割**: Independent Adversarial Review Agent（形式化担当・coordinator・STAGING から独立）。commit / push / merge / ブランチ切替は一切行わず、Lean モジュールは読み取り専用で変更していない。
- **対象モジュール（変更していない）**: `JapanTaxLaw/ForestGrantRounding.lean`（+ `Spec` / `Tests`）, `JapanTaxLaw/MultiDonorDeduction.lean`（+ `Spec` / `Tests`）, `JapanTaxLaw/ExamFee.lean`（+ `Spec` / `Tests`）。
- **一次資料（pinned・改変禁止）**:
  - `data/raw/431AC0000000003_20260401_508AC0000000002.law.json`（law `431AC0000000003`, art.31）
  - `data/raw/325CO0000000071_20260401_506CO0000000143.law.json`（law `325CO0000000071`, art.5の2）
  - `data/raw/326CO0000000216_20240401_505CO0000000146.law.json`（law `326CO0000000216`, art.6の2）
- **抽出方法**: STAGING / doc-comment / coordinator 要約を信じず、上記 pinned JSON を Python で直接再帰走査して `law_full_text` の全文字リーフを平坦化し、`re.sub(r"[\s　]+", "", s)` で正規化。`MainProvision` 配下の `Article` を `attr.Num` で選択（31 / `5_2` / `6_2`）して逐語取得。漢数字は自前で算数へ変換した。

### 1. 独立抽出結果（pinned 原文 → 漢数字算術 → Lean 定数）

- **ForestGrantRounding / art.31（正規化 151 文字、モジュール header の 151 文字と一致）**:
  - 逐語: 「（各譲与時期の譲与額の計算）第三十一条各市町村及び都道府県に対する前条第一項に規定する各譲与時期に譲与すべき森林環境譲与税の額として第二十七条から前条までの規定を適用して計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもって、当該譲与時期に譲与すべき森林環境譲与税の額とする。」
  - 換算: 「千円」= 1,000。「端数金額を控除」= 0〜999 円を減じて 1,000 円単位へ切捨て。
  - Lean: `grainYen = 1_000`, `roundDownThousand a = a - a % grainYen`。一致。**100 円 / 10,000 円の桁違い混入なし**。
- **MultiDonorDeduction / art.5の2（256 文字、header と一致）**:
  - 逐語: 「（特定贈与者が二人以上ある場合における特定贈与者ごとの贈与税の課税価格から控除する金額の計算）第五条の二法第二十一条の九第五項に規定する相続時精算課税適用者（以下「相続時精算課税適用者」という。）がその年中において二人以上の同項に規定する特定贈与者（以下「特定贈与者」という。）からの贈与により財産を取得した場合には、法第二十一条の十一の二第一項の規定により控除する金額は、特定贈与者の異なるごとに、六十万円に、特定贈与者ごとの贈与税の課税価格が当該課税価格の合計額のうちに占める割合を乗じて計算するものとする。」
  - 換算: 「六十万円」= 600,000。算術 `600,000 × (当該者課税価格 ÷ 合計額)`。
  - Lean: `baseDeductionYen = 600_000`, `donorDeductionYen total price = 600_000 * price / total`。一致。**6 万 / 600 万の桁違い混入なし**。
- **ExamFee / art.6の2（143 文字、header と一致）**:
  - 逐語: 「（受験手数料等）第六条の二法第九条第一項に規定する政令で定める額は、受験科目の数が一である場合にあつては四千円、受験科目の数が二以上である場合にあつては四千円と千五百円に一を超える受験科目の数を乗じて得た額との合計額とする。２法第九条第二項に規定する政令で定める額は、八千八百円とする。」
  - 換算: 「四千円」= 4,000, 「千五百円」= 1,500, 「八千八百円」= 8,800。算術 n=1 → 4,000; n≥2 → 4,000 + 1,500(n−1); 法9条2項 → 8,800。
  - Lean: `baseFee = 4_000`, `perExtraSubjectYen = 1_500`, `secondClauseFee = 8_800`, `examFee(n) = 0 (n=0) / 4,000 (n=1) / 4,000 + 1,500(n−1) (n≥2)`。一致。**桁違いなし**。
- **独立判定**: 3 モデルとも数値・粒度・算術形が pinned 原文と一致（D=PASS）。独立仕様 `Spec.lean` の `specRound` / `specShare` / `specExamFee` とも同一で、`agree*` は `by decide` で真（カーネル確認済み）。

### 2. needle 健全性（独立検証）

STAGING の needle テキストを信じず、`scripts/ci/transcription_audit.py` の `checks()` に実際に組み込まれた当該 3 エントリの文字列を取得し、上で自前正規化した pinned 原文に対して `.find()` / `.count()` を実行した。

| モデル | needle 本数 | U+3000 含有 | 正規化原文に FOUND | 出現回数 | 正規化長 |
|---|---|---|---|---|---|
| ForestGrantRounding | 2 | 0 | 2/2 | 各 1 | 36 / 25 |
| MultiDonorDeduction | 2 | 0 | 2/2 | 各 1 | 55 / 40 |
| ExamFee | 2 | 0 | 2/2 | 各 1 | 77 / 20 |

- 合計 **6/6 FOUND**、U+3000 含有 **0 本**、全件 count=1（一意）。
- 検査した文字列:
  - FG-1 `金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもって` / FG-2 `当該譲与時期に譲与すべき森林環境譲与税の額とする。`
  - MD-1 `六十万円に、特定贈与者ごとの贈与税の課税価格が当該課税価格の合計額のうちに占める割合を乗じて計算するものとする` / MD-2 `法第二十一条の十一の二第一項の規定により控除する金額は、特定贈与者の異なるごとに`
  - EF-1 `受験科目の数が一である場合にあつては四千円、受験科目の数が二以上である場合にあつては四千円と千五百円に一を超える受験科目の数を乗じて得た額との合計額とする` / EF-2 `法第九条第一項に規定する政令で定める額は`

### 3. 反例探索（境界値・グリッド走査）

| モデル | グリッド（独立 Python） | 不一致 | 必須境界の独立再計算 |
|---|---|---|---|
| ForestGrantRounding | amount 0..20,000 | 0 | 999→0, 1,000→1,000, 1,499→1,000, 1,500→1,000, 12,345→12,000, 100,000→100,000 |
| MultiDonorDeduction | total 0..60, price 0..total | 0 | (2,1)→300,000, (4,1)→150,000, (3,1)→200,000, (3,2)→400,000, (1,1)→600,000 |
| ExamFee | n 0..100 | 0 | n=1→4,000, n=2→5,500, n=3→7,000, n=5→10,000, 法9条2項→8,800 |

- 指定境界（999→0 / 1,000→1,000 / 1,499→1,000 / 12,345→12,000; 六十万円の按分; n=1→4,000 / n=2→5,500 / n=3→7,000 / 8,800）はすべて原文から導いた期待値と一致。
- 読違い反例の拒否: 100 円単位なら 12,345→12,300、10,000 円単位なら→10,000 となり「千円未満」と矛盾; 6 万なら (2,1)→30,000、600 万なら→3,000,000 となり「六十万円」と矛盾; 一科目 40,000 / 加算 15,000 / 2 項 88,000 なら原文「四千円・千五百円・八千八百円」と矛盾。いずれも反例として成立しない。
- **全グリッドで不一致 0（反例ゼロ）**。

### 4. 公理監査

- 6 モジュール（impl / Spec / Tests）を走査: `sorry`, `admit`, `axiom`, `Classical`, `noncomputable` は **いずれも 0 件**。
- 一時 probe を `/tmp` 相当の一時領域に作成し `lake env lean` で実行（リポジトリ内 Lean ファイルは未変更）。13 個の名前付き境界定理・`agree*` 定理を `by decide` で証明し `#print axioms` を施行 → **全 13 件が "does not depend on any axioms"**。
- よって `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` の依存は **いずれも 0**。証明はカーネル還元（`by decide`）のみ。解析用一時ファイルはすべて削除済み。

### 5. CONFIRMED / BY-DESIGN / UNRESOLVED の分類

| ID | 区分 | 内容 | 根拠 |
|---|---|---|---|
| F-AI1 | BY-DESIGN | ForestGrant: 第27〜30条の「計算した金額」を導く配分・基準・算定手続は NOT MODELLED と明記 | モジュール doc 22-24 行 |
| F-AI2 | BY-DESIGN | ForestGrant: 1,500→1,000 の切捨て（四捨五入ではない）は原文「端数金額を控除」に忠实 | 原文 + 式 `a - a%1000` |
| M-AI1 | BY-DESIGN | MultiDonor: `total=0` は本条の適用外（2 人以上の特定贈与者が前提）として別記録; Spec は 0 を返し impl も Nat 除算で 0 | モジュール doc 26 行 / `specShare` |
| M-AI2 | BY-DESIGN | MultiDonor: 特定贈与者・相続時精算課税適用者の認定、法21の11の2第1項の他要件は NOT MODELLED | モジュール doc 25 行 |
| E-AI1 | BY-DESIGN | ExamFee: n=0 は適用外（一科目以上が前提）、法9条1項/2項の申請区分認定・減免・納付手続は NOT MODELLED | モジュール doc 25-27 行 |
| M-AI3 | UNRESOLVED | MultiDonor: 端数処理の具体的な方法（切捨て/四捨五入等）が本条文に明示なし。実装は自然数除算（切捨て）を仮定するが法的確定ではなく人間レビュー保留 | モジュール doc 23-24 行 |

- **CONFIRMED: 0 件（ゼロ）** — 数値・桁・needle・公理・境界のいずれにも欠陥として確定した発見なし。
- **BY-DESIGN: 5 件** / **UNRESOLVED: 1 件**。
- 発見ゼロ（CONFIRMED ゼロ）は欠陥不在の証明ではない。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。法的妥当性の最終判断は専門家に委ね、`LEGAL_REVIEW_PENDING` は変更しない。

---

### ForeignCorpResidualRate.lean — 法人税法 第百四十五条の四（law 340AC0000000034 / revision 340AC0000000034_20261001_508AC0000000012）

- **対象（読み取り専用・変更なし）**: `JapanTaxLaw/ForeignCorpResidualRate.lean`, `ForeignCorpResidualRateSpec.lean`, `ForeignCorpResidualRateTests.lean`。
- **pinned 原文**: `data/raw/340AC0000000034_20261001_508AC0000000012.law.json`。JSON メタデータから law_id / law_revision_id / enforcement `2026-10-01` を直接確認（doc-comment の申告と一致）。doc-comment が挙げる `W_L_corporate145_4.txt` は正規化済み担当範囲テキストのファイル名で repo 内に実体なし → 同名 revision の raw JSON を採用。
- **抽出方法**: STAGING / `transcription_audit.py` / Lean doc-comment を信じず、自前の使い捨て Python（`_adv_tmp/verify.py`, 監査後削除）で `law_full_text` を再帰平坦化し、`attr.Num == "145_4"` の記事ノードを **1 件だけ**特定。全空白・U+3000 を除去して照合。

**独立抽出した原文（正規化・改変なし）**: `第百四十五条の四外国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、各対象会計年度の外国法人に係る課税標準国際最低課税残余額に百分の九十・七の税率を乗じて計算した金額とする。`

#### 独立抽出（原文 literal → 独立計算 → Lean 定数）

| 原文 literal | 独立計算 / 解釈 | Lean 定数 | 照合 |
|---|---|---|:---:|
| `第百四十五条の四` | `Num="145_4"` で記事 1 件を同定 | doc-comment の条名・定理コメント | ✅ |
| `百分の九十・七` | 90.7 百分率 = 907/1000 = 0.907 | `foreignCorpResidualRate := ⟨907, 1000, by decide⟩`; `num=907`, `den=1000` | ✅ |
| `課税標準国際最低課税残余額` | `base : Money`（caller-established、算術のみ） | `foreignCorpResidualTax (base : Money)` | ✅ |
| `税率を乗じて計算した金額` | `(base × 907) / 1000`（floor） | `TaxRate.applyFloor = m*num/den`; Spec `(base*907)/1000` | ✅ |

- 当該条の数値リテラルは `九十・七`（=907/1000）のみ。桁違い候補（9070/1000 や 907/10000）は原文に不在 → 検出されず。

#### 反例（境界・入力ケース、独立再計算 vs Lean 申告値）

`tax(b) = (b*907)//1000` を Python で独立実装し、3 ファイルの `example` 定数値（kernel `decide` 申告）と比較。**11/11 一致、MISMATCH 0**。

| base | 0 | 1 | 2 | 99 | 100 | 999 | 1000 | 1001 | 12345 | 100000 | 1000000 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 独立 | 0 | 0 | 1 | 89 | 90 | 906 | 907 | 907 | 11196 | 90700 | 907000 |
| Lean | 0 | 0 | 1 | 89 | 90 | 906 | 907 | 907 | 11196 | 90700 | 907000 |
| 照合 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

- floor 境界 999→906 / 1000→907 / 1001→907 を独立確認（Spec の agreement list の 101→91, 907123→822760 も整合）。
- 対抗モデル（率を 90/100=0.9 と誤読）なら 1000→900 となり Lean の 907 と不一致 → 誤りは検出される。実不一致は 0 件。

#### 判定

- **BY-DESIGN**（CONFIRMED = 0）。pinned 原文の条・率・算術定式はすべて一致。発見された欠陥なし。
- **射程限定**: (1) `base`（課税標準額）は caller-established で算定は扱わない。(2) 外国法人該当性・対象会計年度・GloBE ルールによる国際最低課税残余額の算定はスコープ外。(3) 原文は「乗じて計算した金額」のみで端数規定を持たず、丸めは `floor` を per-law business data として採用した設計選択（原文由来の不一致ではない）。(4) 内国法人の art. 82の13 / 国内最低課税額 art. 145の8（75.3%）は未検証・射程外。(5) 検証は pinned revision の当該条のみ、他 revision へ一般化しない。
- **H/T/D/C/U**:
  - **H** (Hypothesis): doc-comment の転記（率 90.7%、式 `base×907/1000`）は pinned 原文どおりで Lean 定数は正しい。
  - **T** (Test): raw JSON から `Num=145_4` を独立抽出し literal 4 点を照合、11 境界ケースを独立再計算して Lean 申告値と比較。
  - **D** (Decision): 4/4 literal + 11/11 ケース一致、MISMATCH 0 → **BY-DESIGN / CONFIRMED=0**。
  - **C** (Competing interpretation): `百分の九十・七` を 907/10000 (=0.0907) と読む誤読もあり得るが、原文は「百分の九十・七」= 90.7 百分率であり 907/1000 が正統。誤読なら 1000→90 となり全ケース不一致。
  - **U** (Uncertainty): 端数処理（floor）の法的妥当性・GloBE 算定・適用判定は pinned 原文のみでは解けず人間の専門家レビューを要する。数値・算術の一致には影響しない。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。解析用一時ファイルは削除済み。Lean / `data/*.json` / `scripts/*.py` は一切変更せず、commit / push は行っていない。
### DisasterIncomeTaxRelief.lean — 災害減免法 art. 2（所得税の軽減区分）

- **pin**: law_id `322AC0000000175` / revision `…_20220101_503AC0000000011` — INVENTORY 現行と一致、raw snapshot sha256 一致。needle 6/6 FOUND（transcription audit 162/162）。
- **独立再抽出（一次資料 = pinned e-Gov art.2 原文 → 独立仕様）**:

| 原文（pinned, 正規化） | 独立抽出 | Spec 定数 | 照合 |
|---|---|---|---|
| `合計所得金額が五百万円以下であるとき当該所得税の額の全部` | 5_000_000 円以下 → 全部（10/10） | `specReliefFraction` = (10,10) | ✅ |
| `合計所得金額が七百五十万円以下であるとき当該所得税の額の十分の五` | 7_500_000 円以下 → 十分の五（5/10） | (5,10) | ✅ |
| `合計所得金額が七百五十万円を超えるとき当該所得税の額の十分の二・五` | 超過 → 二・五/十 = 5/20 | (5, 2*10) | ✅ |

- **境界値**: 5_000_000 → 全部、5_000_001 → 半額、7_500_000 → 半額、7_500_001 → 四分の一。実装と独立仕様の一致は `agree_relief_fraction` を Lean カーネルで検証。
- **対立解釈 (C)**: 軽減率の丸め・端数処理は原文に明示がなく、本モジュールは分数の選択のみを扱う。税額への適用・適用要件（甚大な被害、千万円以下、第七十二条非適用）は caller-established として未モデル化。
- **不確かさ (U)**: `二・五` を 5/20 と通分したことは算術的等価だが、行政実務上の端数処理は別途政令に委任されており未検証。
- **判定**: **BY-DESIGN**。CONFIRMED 0 件。人間の法的レビューは独立軸（LEGAL_REVIEW_PENDING）。

### VehicleWeightUnit.lean — 自動車重量税法 art. 7（〇・五トン単位）

- **pin**: law_id `346AC0000000089` / revision `…_20220401_504AC0000000004`, raw snapshot sha256 verified; needle 2/2 FOUND in the scoped article.
- **H**: 「車両重量〇・五トン又はその端数ごとに」は 0.5 t（=5/10 t）ごとの切上単位を意味し、`(w+4)/5`（w は 0.1 t 単位）として独立に読み取れる。
- **T**: pinned art.7 から needle を独立再抽出し、w=0,1,5,6,11 の単位数を独立計算して Lean 申告値と比較。
- **D**: 2/2 literal + 5/5 ケース一致、MISMATCH 0 → **BY-DESIGN / CONFIRMED=0**。
- **C**: 「端数」の扱いは原文上「一単位として数える」と読むのが自然だが、行政実務の weighing 丸め規則は別途政令・通達に委任され、本モデルは射程外。
- **U**: 車両区分・税率・有効期間・臨時検査の〇・五乗じは caller-established で未形式化。
- **判定**: **BY-DESIGN**。CONFIRMED 0 件。人間の法的レビューは独立軸（LEGAL_REVIEW_PENDING）。
## Batch AJ review (2026-11-21)

対象: cycle-26/27/28/29/30/31 の 6 モデル（`DutyFreeTransfer` / `SavingsDepositInterest` / `PowderSakeQuantity` / `TobaccoRate` / `StampExchangeFee` / `RemittanceReportLimit`）。coordinator 要約・STAGING を信じず、`data/raw/*.law.json` の pinned 原文から Python で直接・独立に漢数字を算数へ変換して抽出し、Lean 定数・needle・境界・公理を照合した。CI `checks()` の needle 実文字列は `scripts/ci/transcription_audit.py` から直接読み出し、自前正規化した pinned 原文に対して検証した（STAGING の记载は未使用）。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない（法的解釈・行政実務の妥当性は判定しない）。

### 1. pin 完全性（改変検知）

`data/INVENTORY.json` の `raw_snapshot.source_sha256` と実ファイルの SHA-256 を 6 件すべて再計算し一致を確認。revision id も specified どおり（下記）。pinned 原文は改変されていない。

| モデル | law_id / revision | SHA-256 一致 |
|---|---|---|
| DutyFreeTransfer | 327CO0000000125 / …_20171008_428CO0000000240 | ✅ |
| SavingsDepositInterest | 326AC1000000145 / …_20211122_503AC0000000046 | ✅ |
| PowderSakeQuantity | 337CO0000000097 / …_20250401_507CO0000000006 | ✅ |
| TobaccoRate | 359AC0000000072 / …_20260525_506AC0000000052 | ✅ |
| StampExchangeFee | 415M60000008069 / …_20191001_501M60000008047 | ✅ |
| RemittanceReportLimit | 409CO0000000363 / …_20250501_507CO0000000128 | ✅ |

### 2. 独立抽出（漢数字 → 算数）と Lean 定数照合

自作の漢数字パーサ（十/百/千/万・〇・七三の小数を Fraction で厳密処理）をセルフテストした上で、pinned 条の原文スライトから数値を抽出。桁違い（1800/180000、1万/100万、680/68020、10万/1000万 等）を厳しく確認した。

| モデル | pinned 条 | 原文数値スライト | 独立抽出値 | Lean 定数 | 境界（独立再計算） | 照合 |
|---|---|---|---|---|---|---|
| DutyFreeTransfer | art.12 | `価格が一万八千円に満たない` | 一万八千 = **18,000** | `thresholdYen = 18_000` | 17,999→true / 18,000→false / 18,001→false（厳密 `<`） | ✅ |
| SavingsDepositInterest | art.8 | `十万円をこえる` | 十万 = **100,000** | `thresholdYen = 100_000` | 99,999→false / 100,000→false / 100,001→true（厳密 `>`） | ✅ |
| PowderSakeQuantity | art.12の3 | `重量に〇・七三（一キログラム当たりのリットル数）` | 〇・七三 = **73/100** | `litersTimes100 kg = kg * 73` | kg=1→73 / 10→730 / 100→7300（liters×100=kg×73） | ✅ |
| TobaccoRate | art.11 §1 | `千本につき六千八百二円` | 六千八百二 = **6,802** | `ratePerThousandYen = 6_802` | n=1→6,802 / 2→13,604 / 10→68,020 | ✅ |
| StampExchangeFee | art.9 | `一枚につき五円` / `十円に満たない` / `一円未満の端数…切り捨て` | 五=**5**, 十=**10**, 一=**1** | `perSheetYen=5`, `smallThresholdYen=10`, `halfFloor=a/2` | amount 9→4 / 10→5 / 3枚・10→15 | ✅ |
| RemittanceReportLimit | art.8 | `政令で定める金額は、百万円とする` | 百万 = **1,000,000** | `limitYen = 1_000_000` | 999,999→true / 1,000,000→true / 1,000,001→false（`<=`） | ✅ |

- 漢数字パーサ開啟値: 一万八千→18000、十万→100000、六千八百二→6802、五→5、十→10、百万→1000000、一→1、〇・七三→73/100（全件期待値どおり）。
- 全 6 モデルの条 flat text 長は 176 / 158 / 83 / 151 / 179 / 140 文字で、各モデル doc-comment の申告値と完全一致（U+3000 は 0 件）。

**桁違いチェック結果: 不一致ゼロ。** 一万八千=18,000（18,000 でなく 1,800/180,000 ではない）、十万=100,000（1万/100万ではない）、六千八百二=6,802（680/68,020 ではない）、百万=1,000,000（10万/1000万ではない）を原文から直接確認。

### 3. needle 健全性（CI `checks()` 実文字列を自前正規化原文で検証）

正規化は CI と同一の `re.sub(r"[\s　]+", "", s)`（U+3000 を含む全空白を除去）を needle と pinned 原文の双方に適用し、部分文字列包含を判定（file locator、CI と同一）。各モデル 2 本、計 12 本。

| モデル | needle 数 | U+3000 含有 | FOUND（自前正規化原文） |
|---|---|---|---|
| DutyFreeTransfer | 2 | 0 / 0 | 2/2 ✅ |
| SavingsDepositInterest | 2 | 0 / 0 | 2/2 ✅ |
| PowderSakeQuantity | 2 | 0 / 0 | 2/2 ✅ |
| TobaccoRate | 2 | 0 / 0 | 2/2 ✅ |
| StampExchangeFee | 2 | 0 / 0 | 2/2 ✅ |
| RemittanceReportLimit | 2 | 0 / 0 | 2/2 ✅ |

- **12/12 FOUND、U+3000 含有 0 件、needle 健全性に問題なし。**
- 補足: RemittanceReportLimit は同一法令内に `Num=8` が 2 件あるが、needle は本則 art.8（百万円、140 文字）に固有（`第八条法第四条第一項に規定する政令で定める金額は、百万円とする`）で、正しい条文を指している。

### 4. 反例探索（境界値＋グリッド走査）

| モデル | 境界 | グリッド走査 | 反例 |
|---|---|---|---|
| DutyFree | 17,999=true / 18,000=false / 18,001=false | p=0..20,000 全点で `p<18000` と一致 | 0 |
| Savings | 99,999=false / 100,000=false / 100,001=true | a=0..200,000 全点で `a>100000` と一致 | 0 |
| PowderSake | 0→0 / 1→73 / 10→730 / 100→7300 | kg=0..5,000 全点で `kg*73` と一致 | 0 |
| Tobacco | n=0→0 / 1→6,802 / 2→13,604 / 10→68,020 / 100→680,200 | n=0..1,000 全点で `6802*n` と一致 | 0 |
| Stamp | (s=1) 8→4 / 9→4 / 10→5 / 11→5、(s=3,a=10)→15 | s=0..5 × a=0..50 全点で `a<10 ? a/2 : 5*s` と一致 | 0 |
| Remittance | 999,999=true / 1,000,000=true / 1,000,001=false | a=999,990..1,000,009 全点で `a<=1000000` と一致 | 0 |

**反例検出数: ゼロ。**

### 5. NOT MODELLED（BY-DESIGN）の明記確認

6 モデルすべてに `Scope / NOT MODELLED` 節があり、各境界の射程外が明記されている。特筆点:

- **TobaccoRate**: 原文 art.11 は §1（6,802 円/千本）に加え §2 に特例 14,424 円/千本（`一万四千四百二十四円`）を含むが、モデルは §1 のみを扱い §2 を明示的に NOT MODELLED としている → **BY-DESIGN**（転記漏れではない）。
- DutyFree: 使用・贈与の認定、許可手続、法11条1項の譲渡定義、免税物品の範囲 → NOT MODELLED（`満たない` は厳密 `<` と境界検証済み）。
- Savings: 指定金融機関委託の例外、政令期間、引出し日期間の対応 → NOT MODELLED。
- PowderSake: リットル数の端数処理（原文に明示なし）、重量測定・法7条6項定義 → NOT MODELLED。
- Stamp: 交換請求の具体認定、2枚以上の合計額算定手続、「半額」切捨ての法的解釈（未確定）→ NOT MODELLED。
- Remittance: §2 外国通貨換算、国外送金等の定義、調書提出手続、法4条1項の他要件 → NOT MODELLED。

### 6. 公理監査

- `lake env lean` で 6 モジュールを import し、11 個の named def/threshold/関数に加え、`by decide` で再構成した 10 個の境界定理（計 21 件）へ `#print axioms` を実行。**21/21 が "does not depend on any axioms"**（`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存 = 0）。
- 6 モデル＋Spec＋Tests の静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。全証明は `by decide` のカーネル還元証明。

### 7. 分類・件数

- **CONFIRMED（数値・境界・needle・公理）= 0 件**。発見（意味的）= **ゼロ**。
- **BY-DESIGN = 6 件**（上記 NOT MODELLED の各モデル明示スコープ。TobaccoRate §2 の 14,424 円を含む）。
- **UNRESOLVED = 2 件**（いずれも pinned 原文のみでは解けず人間の法律専門家判断を要する: (1) StampExchangeFee の「半額」一円未満切捨ての法的妥当性（モデル内でも「法的解釈は未確定」と明記）、(2) PowderSakeQuantity のリットル数端数処理の有無。数値・算術の一致には影響しない）。
- **CONFIRMED（ドキュメント表記のみ・非意味的）= 1 件**: 5 モデル（SavingsDepositInterest / PowderSakeQuantity / TobaccoRate / StampExchangeFee / RemittanceReportLimit）の header `Raw snapshot:` が `data/raw/data/raw/…` と二重になっており、実在する正規パスは `data/raw/…`（DutyFreeTransfer は正しい単一パス）。law_id・revision・文字数・needle・定数はすべて正しく、計算・証明・pin 完全性への影響なし。修正は Lean モジュール側のため本レビューでは変更せず報告のみ。

> 本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。解析用一時ファイルはすべて削除済み。Lean モジュール / `data/*.json` / `scripts/*.py` は読み取り専用で一切変更せず、commit / push / merge / ブランチ切替は行っていない。
## Batch AK review (2026-11-21) — 関税法施行令 art.40 / TravelerExemptionLimit.lean（cycle-33 独立照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・STAGING は信じず、pinned `data/raw/*.law.json` から直接・独立に抽出して照合した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/TravelerExemptionLimit.lean`、`TravelerExemptionLimitSpec.lean`、`TravelerExemptionLimitTests.lean`。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。
- **一次資料（pinned・改変禁止）**: `data/raw/335CO0000000069_20260401_508CO0000000085.law.json`（law_id `335CO0000000069` / revision `335CO0000000069_20260401_508CO0000000085`、施行 2026-04-01）。
- **needle 出所**: `scripts/ci/transcription_audit.py` の `checks()` cycle-33 エントリから実文字列 2 本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+", "", s)` を**自前で正規化した pinned 原文**に適用して部分文字列包含を判定した。
- **本レビューは機械的独立照合（原文 parse・漢数字算術化・needle 検証・境界グリッド・公理監査）であり、人間の法律専門家によるレビューではない。** 法的解釈・行政実務の妥当性は判定しない。

### AK-1. pin 完全性と原文独立抽出（漢数字 → 算数）

`data/INVENTORY.json` の `raw_snapshot.source_sha256` と実ファイルを再計算し一致を確認（計算値 `b64be40dba650308d9f0ae478e89539b412c4f0a4fac981b6c770d3f1e1f121a`、INVENTORY 値は同一 hex の大文字表記のみ。pin は改変されていない）。

- `MainProvision` 配下の `Article` は 70 件、`attr.Num = "40"` は **1 件のみ**。その flat text は **64 文字**、U+3000 は **0 件**（モジュール doc-comment の申告値 64 / 0 と一致）:

  `（特定旅客の携帯品に係る関税の免除が適用される金額の上限）第四十条法第十四条第一項に規定する政令で定める金額は、二十万円とする。`

- 自作漢数字パーサをセルフテスト（二十万→200000、二万→20000、二百万→2000000、二十→20、十万→100000、一万八千→18000、六千八百二→6802、全件期待値どおり）した上で、原文スライト `金額は、([漢数字]+)円とする` から数値を抽出 → リテラル **`二十万`** → **200,000**。
- **桁違いチェック**: 原文は `二十万`（2×10×10,000）であり `二万`=20,000 でも `二百万`=2,000,000 でもない。Lean 定数 `limitYen : Money := 200_000`（`Money = Nat`）と**一致**。

| 項目 | 独立抽出 | Lean 定数 | 照合 |
|---|---:|---:|:---:|
| 金額リテラル | `二十万` | `200_000` | ✅ |
| 十の桁 | 二十 = 20 | 20 | ✅ |
| 万の乗数 | ×10,000 | ×10,000 | ✅ |
| 2万/200万 との誤認 | なし（20,000 / 2,000,000 を明示的に除外） | — | ✅ |

### AK-2. needle 健全性（CI `checks()` 実文字列 2 本）

正規化は CI と同一 `re.sub(r"[\s　]+", "", s)` を needle と pinned 原文の双方へ適用。file locator（`kind = "file"`, `law_id = 335CO0000000069`）に従い正規化全文（長さ 54,956+ 以降）で包含判定した。

| # | CI needle（実文字列） | U+3000 | FOUND | 正規化全文 offset | slice |
|---|---|---:|:---:|---:|---|
| 1 | `特定旅客の携帯品に係る関税の免除が適用される金額の上限）第四十条` | 0 | ✅ | 53,956 | [53,956, 53,988) |
| 2 | `法第十四条第一項に規定する政令で定める金額は、二十万円とする` | 0 | ✅ | 53,988 | [53,988, 54,018) |

- **2/2 FOUND、U+3000 含有 0 件。** 2 本の slice は隣接するが重複せず、**互いに異なる条文位置**を指す。
- Article 40 の正規化 flat text（64 文字）内での offset は needle 1 = **1**（見出し `(特定旅客…上限)` ＋ `第四十条` の見出し側）、needle 2 = **33**（本文）。ツリー上の位置も needle 1 は `Article[Num=40]` の見出し部分、needle 2 はその配下の `Paragraph[Num=1] / ParagraphSentence / Sentence[Num=1]` の本文であり、**条文位置スライスが異なることを独立確認**した（needle 2 のみが金額リテラル `二十万` を含む）。
- 補足: `ArticleTitle` の `attr` は `第四十条`、見出し文言は `ArticleTitle` ではなく直後の `Paragraph` 前の見出しノードに格納されている。needle 1 はその見出しを、needle 2 は本文を夫々正しく指す。

### AK-3. 反例探索（境界値＋グリッド）

| 入力 a | `isAtOrBelowLimit a` | 期待 | 照合 |
|---:|:---:|:---:|:---:|
| 0 | true | true | ✅ |
| 1 | true | true | ✅ |
| 199,998 | true | true | ✅ |
| **199,999** | **true** | true | ✅ |
| **200,000** | **true** | true（境界含む） | ✅ |
| **200,001** | **false** | false | ✅ |
| 200,002 | false | false | ✅ |
| 1,000,000 | false | false | ✅ |

- 自前 Python シミュレーション `a <= 200000` を **a = 199,900〜200,100 の全 201 点**で走査 → 不一致 **0 件**。
- 一時 Lean ファイルで `#eval isAtOrBelowLimit 0 / 199_999 / 200_000 / 200_001` → `true / true / true / false`、`#eval limitYen` → `200000`。モジュール内の 5 本の `by decide` example と、一時ファイルで再構成した 11 本の境界 `by decide` 定理（下記 AK-4）すべてがカーネル還元で成立。
- **反例検出数: ゼロ。**

### AK-4. 公理監査

- 一時 Lean ファイル `batchAK_axiom_probe.lean`（外部 temp ディレクトリ、プロジェクト外）で対象モジュールを import し、2 つの named def（`limitYen` / `isAtOrBelowLimit`）＋再構成した 11 本の境界定理（上限一致、20,000/2,000,000 との不一致、0/1/199,998/199,999/200,000/200,001/200,002/1,000,000）＝**13 宣言**へ `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **13/13 が `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は **いずれも 0 件**。
- 対象 3 ファイルの静的スキャン: `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。全証明は `by decide` のカーネル還元証明。
- 監査後、一時 Lean ファイルおよび一時解析スクリプトは**すべて削除済み**。作業ツリーには他エージェントによる既存の無関係な変更があるが、本レビューでは一切触れていない。

### AK-5. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（意味的: 数値・needle・境界・公理）** | **0（ゼロ）** |
| CONFIRMED（ドキュメント表記のみ・非意味的） | 2 |
| BY-DESIGN | 3 |
| UNRESOLVED | 1 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 下記 D-1/D-2 はモデル値・証明・pin 完全性に影響しない表記上の問題であり、過去バッチの慣例に従い「ドキュメント表記のみ・非意味的」として分離した。両者を混同しないこと。

#### CONFIRMED（意味的）— 0 件

- 金額: `二十万 = 200,000` を pinned 原文から独立抽出し、桁違い（20,000 / 2,000,000）を明示的に除外して Lean 定数と一致。
- needle: 2/2 FOUND、U+3000 = 0、異なる条文位置スライス（見出し／本文）。
- 境界: 199,999→true / 200,000→true / 200,001→false、201 点グリッド不一致 0。
- 公理: 禁止公理 0、13/13 axiom-free、`by decide` カーネル証明。

#### CONFIRMED（ドキュメント表記のみ・非意味的）— 2 件

- **D-1 Raw snapshot パスの二重化**: `TravelerExemptionLimit.lean` の header `Raw snapshot: data/raw/data/raw/335CO0000000069_...law.json` は実在パス `data/raw/335CO0000000069_...law.json` の二重表記。Batch AJ で指摘された同種の表記誤り。law_id / revision / 文字数 / needle / 定数 / pin 完全性はすべて正しく、計算・証明への影響なし。修正は Lean モジュール側のため本レビューでは変更せず報告のみ。
- **D-2 法令名の略記**: pinned JSON の `law_title` は **`関税暫定措置法施行令`**（昭和三十五年政令第六十九号）だが、3 ファイル（`TravelerExemptionLimit.lean` / `Spec` / `Tests`）の header は **`関税法施行令`** と表記（タスク側の呼称も同略記）。対象を一意に定める law_id / revision / 条文スライスは一致しており、金額・比較・証明への影響なし。正式名称との表記差のみ。

#### BY-DESIGN — 3 件

- **B-1 スコープの明示**: 「特定旅客」の認定、携帯品の範囲、免除の適用手続は `Scope / NOT MODELLED` として明記。金額定数と境界判定のみの bounded L4 モデル。
- **B-2 親法他要件の非対象**: 法14条1項の他の要件は NOT MODELLED と明記。caller-established の範囲。
- **B-3 金額の Nat 表現**: `Money = Nat`（非負整数・円単位）。円未満端数や外貨換算は原文に記載がなく、モデル化対象外としてDesign上有効。

#### UNRESOLVED — 1 件

- **U-1 境界包含（`<=`）の法的根拠**: 本 pinned スライス（施行令 art.40）は金額を `二十万円とする` と定めるのみで、`以下` / `こえない` 等の比較文言を含まない。`isAtOrBelowLimit` の `<=`（200,000 を含む）は親法（関税暫定措置法14条1項）の文言に由来する解釈であり、**本 pinned 原文のみからは独立導出できない**。タスク指定どおりの境界込みとして機械照合は完了しているが、その法的正当性の最終判断は**人間の法律専門家を要する**。数値・算術の一致（意味的 CONFIRMED = 0）には影響しない。

### AK-6. 総合判定・最終報告

- pinned revision `335CO0000000069_20260401_508CO0000000085` の art.40 から独立抽出した `二十万 = 200,000` は Lean 定数 `limitYen = 200_000` と一致。**桁違いはゼロ**。needle 2/2 FOUND（U+3000 ゼロ、異なる条文位置スライス）、境界グリッド不一致 0、公理依存 0。
- **CONFIRMED（意味的）= 0（ゼロ）／CONFIRMED（ドキュメント表記のみ・非意味的）= 2／BY-DESIGN = 3／UNRESOLVED = 1。**
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、13/13 axiom-free、全証明が `by decide` のカーネル還元。監査用一時 Lean ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AJ ほか全 34 件）は**すべて保持**し、本セクションを末尾に追記したのみ。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` の 1 ファイルだけ。
- 残る U-1 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。


## Batch AL review (2026-11-21) — 登録免許税法施行令 art.26 / 石油ガス譲与税法 art.1（cycle-34/35 独立照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・STAGING は信じず、pinned `data/raw/*.law.json` から直接・独立に漢数字を算数化して照合した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/MortgageRegistrationCapital.lean` / `...Spec.lean` / `...Tests.lean`（cycle-34）、`JapanTaxLaw/OilGasGrantTax.lean` / `...Spec.lean` / `...Tests.lean`（cycle-35）。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。
- **一次資料（pinned・改変禁止）**:
  - 登録免許税法施行令 art.26: `data/raw/342CO0000000146_20261001_507CO0000000124.law.json`（law_id `342CO0000000146` / revision `342CO0000000146_20261001_507CO0000000124`、施行 2026-10-01）
  - 石油ガス譲与税法 art.1: `data/raw/340AC0000000157_20090401_421AC0000000009.law.json`（law_id `340AC0000000157` / revision `340AC0000000157_20090401_421AC0000000009`、施行 2009-04-01。実ファイル名を確認済み）
- **needle 出所**: `scripts/ci/transcription_audit.py` の `checks()` cycle-34/35 エントリから実文字列を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+", "", s)` を**自前で正規化した pinned 原文**に適用して部分文字列包含を判定した（`kind = "file"`, `load_law_text` と同一の平坦化全文）。
- **本レビューは機械的独立照合（原文 parse・漢数字算術化・needle 検証・境界グリッド・公理監査）であり、人間の法律専門家によるレビューではない。** 法的解釈・行政実務の妥当性は判定しない。

### AL-1. pin 完全性と原文独立抽出（漢数字 → 算数）

`data/INVENTORY.json` の `raw_snapshot.source_sha256` と実ファイルを再計算し、2 件とも一致（改変なし）:

| モデル | law_id / revision | 計算 SHA-256 = INVENTORY | bytes |
|---|---|---|---|
| MortgageRegistrationCapital | 342CO0000000146 / …_20261001_507CO0000000124 | `0FC3F9CA…9AA2B` 一致 | 178,197 一致 |
| OilGasGrantTax | 340AC0000000157 / …_20090401_421AC0000000009 | `3F8C479B…AF058` 一致 | 39,399 一致 |

- 自作漢数字パーサをセルフテスト（五→5、五億→500000000、二十→20、十万→100000、一万八千→18000、六千八百二→6802 他 11 件、全件期待値どおり）した上で抽出した。
- **art.26 flat text**（76 文字 / U+3000 = 0、原文そのまま）:
  `（抵当権等の設定等の登記等が課税される普通法人の資本金等の額）第二十六条法別表第三の一の四の項及び一の五の項に規定する政令で定める金額は、五億円とする。`
- **art.1 flat text**（136 文字 / U+3000 = 0、原文そのまま）:
  `（石油ガス譲与税）第一条石油ガス譲与税は、石油ガス税法（昭和四十年法律第百五十六号）の規定による石油ガス税の収入額の二分の一に相当する額とし、都道府県及び道路法（昭和二十七年法律第百八十号）第七条第三項に規定する指定市（以下「指定市」という。）に対して譲与するものとする。`
- `Article` の `attr.Num` は両法とも対象 1 件のみ（art.26 = 1 件、art.1 = 1 件）。flat 文字数・U+3000 数はモジュール doc-comment の申告（76/0、136/0）と一致。

| モデル | 原文リテラル | 独立抽出 | Lean 定数 | 桁違いチェック | 照合 |
|---|---|---:|---|---|:---:|
| MortgageRegistrationCapital | `金額は、五億円とする` | 五 = 5 × 億 = 10^8 → **500,000,000** | `capitalThresholdYen : Money := 500_000_000` | 五千万(50,000,000) / 五十億(5,000,000,000) を明示的に除外 | ✅ |
| OilGasGrantTax | `収入額の二分の一に相当する額` | 分母リテラル `二`=2、分子 `一`=1 → **1/2** | `grantYen(revenue) = revenue / 2` | `三`/`四` ではなく `二` を直接確認 | ✅ |

**桁違いチェック結果: 不一致ゼロ。** 五億 = 500,000,000（5 千万でも 50 億でもない）、二分の一 = 1/2 を pinned 原文から直接確認。

### AL-2. needle 健全性（CI `checks()` 実文字列を自前正規化原文で検証）

正規化は CI と同一 `re.sub(r"[\s　]+", "", s)` を needle と pinned flat 全文の双方へ適用。file locator に従い `load_law_text` と同一の平坦化全文で包含判定。

| モデル | # | CI needle（実文字列） | U+3000 | FOUND | 正規化全文 offset | 記事内 offset |
|---|---|---|---:|:---:|---:|---:|
| Mortgage | 1 | `抵当権等の設定等の登記等が課税される普通法人の資本金等の額）第二十六条` | 0 | ✅ | 13,292 | 1 |
| Mortgage | 2 | `法別表第三の一の四の項及び一の五の項に規定する政令で定める金額は、五億円とする` | 0 | ✅ | 13,327 | 36 |
| OilGas | 1 | `石油ガス譲与税は、石油ガス税法` | 0 | ✅ | 33 | 12 |
| OilGas | 2 | `石油ガス税の収入額の二分の一に相当する額` | 0 | ✅ | 69 | 48 |

- **4/4 FOUND、U+3000 含有 0 件。** 各モデルの 2 本は隣接するが重複せず、**互いに異なる条文位置スライス**を指す（Mortgage: 見出し `）第二十六条` 側と本文 `五億円とする` 側、OilGas: 前文 `石油ガス税法` と後文 `二分の一に相当する額`）。needle 2 のみが金額リテラルを含む。

### AL-3. 反例探索（境界値＋奇数偶数＋グリッド）

| 攻撃対象 | 結果 | 反例 |
|---|---|---:|
| Mortgage 境界 499,999,999 / 500,000,000 / 500,000,001 | true / true / false（境界含む `<=`） | 0 |
| Mortgage グリッド c = 499,999,900〜500,000,100（201 点） | `c <= 500000000` と全点一致 | 0 |
| OilGas 偶数 0 / 2 / 100 / 1,000,000 | 0 / 1 / 50 / 500,000（1/2 と一致） | 0 |
| OilGas 奇数 1 / 3 / 99 / 101 | 0 / 1 / 49 / 50（Nat 除算の切捨て、有理数 1/2 の floor と一致） | 0 |
| OilGas グリッド r = 0〜200 | `r // 2` と `floor(r/2)` が全点一致 | 0 |

- 一時 Lean ファイルで境界定理を `by decide` で再構成（下記 AL-4）し、モジュール内の example と一致を確認。**反例検出数: ゼロ。**

### AL-4. 公理監査

- 一時 Lean ファイル `batchAL_axiom_probe.lean`（外部 temp ディレクトリ、プロジェクト外）で 6 ファイル（2 モデル＋Spec＋Tests）を import し、8 個の named def（`capitalThresholdYen` / `isAtOrBelowThreshold` / `specThreshold` / `specBelow` / `agreeMortgageRegistrationCapital` / `grantYen` / `specGrant` / `agreeOilGasGrantTax`）＋再構成した 12 本の境界定理（計 **20 宣言**）へ `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **20/20 が `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は**いずれも 0 件**。
- 6 ファイルの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。全証明は `by decide` のカーネル還元証明。
- 監査後、一時 Lean ファイルおよび一時解析スクリプト（`.py` / `.txt`）は**すべて削除済み**。

### AL-5. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（意味的: 数値・needle・境界・公理）** | **0（ゼロ）** |
| CONFIRMED（ドキュメント表記のみ・非意味的） | 2 |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 数値・needle・境界・公理の機械照合はすべて合格。下記 D-1/D-2 は表記上の問題であり、過去バッチの慣例に従い分離した。

#### CONFIRMED（意味的）— 0 件

- 金額: 五億 = 500,000,000、二分の一 = 1/2 を pinned 原文から独立抽出し、桁違いを明示的に除外して Lean 定数と一致。
- needle: 4/4 FOUND、U+3000 = 0、異なる条文位置スライス。
- 境界: 499,999,999→true / 500,000,000→true / 500,000,001→false、201 点グリッド不一致 0、奇数偶数グリッド不一致 0。
- 公理: 禁止公理 0、20/20 axiom-free、`by decide` カーネル証明。

#### CONFIRMED（ドキュメント表記のみ・非意味的）— 2 件

- **D-1 MortgageRegistrationCapital の Raw snapshot パス二重化**: `MortgageRegistrationCapital.lean` の header `Raw snapshot: data/raw/data/raw/342CO0000000146_...law.json` は実在パス `data/raw/342CO0000000146_...law.json` の二重表記。Batch AJ/AK で指摘された同種。law_id / revision / 文字数 / needle / 定数 / pin 完全性はすべて正しく、計算・証明への影響なし。
- **D-2 OilGasGrantTax の Raw snapshot パス二重化**: `OilGasGrantTax.lean` header も同様に `data/raw/data/raw/340AC0000000157_...law.json`（正規は `data/raw/340AC0000000157_...law.json`）。影響なし。※ 修正は Lean モジュール側のため本レビューでは変更せず報告のみ。

#### BY-DESIGN — 4 件

- **B-1 Mortgage スコープ明示**: 「普通法人」「抵当権等の設定等の登記」の認定、別表の項の適用、資本金等の額の算定手続は `Scope / NOT MODELLED` と明記。金額定数と境界判定のみの bounded L4 モデル。
- **B-2 OilGas スコープ明示**: 指定市の認定、譲与の手続、石油ガス税法の収入額算定は NOT MODELLED と明記。
- **B-3 `Money = Nat` 表現**: 円未満端数・外貨換算は原文に記載がなく、モデル化対象外として Design 上有効（両モデル共通）。
- **B-4 OilGas 奇数収入の端数処理は未形式化（タスク指定どおり確認）**: `grantYen(revenue) = revenue / 2` は自然数除算（切捨て）。doc-comment は「収入額が奇数の場合の端数処理は本条文に明示なし → 未形式化、人間レビュー保留。実装は自然数除算（切捨て）を仮定するが法的確定ではない」と明記。Spec/Tests も `1→0 / 3→1 / 101→50` の切捨てを確認。**転記漏れではなく明示されたスコープ境界**。

#### UNRESOLVED — 2 件

- **U-1 Mortgage の `<=`（境界包含）の法的根拠**: pinned art.26 は金額を `五億円とする` と定めるのみで、`以下` / `こえない` 等の比較文言を含まない。`isAtOrBelowThreshold` の `<=`（500,000,000 を含む）はタスク指定どおりの機械照合は完了しているが、その法的正当性は本 pinned 原文のみからは独立導出できない。**人間の法律専門家を要する**（AK U-1 と同趣旨）。数値・算術の一致（意味的 CONFIRMED = 0）には影響しない。
- **U-2 OilGas 奇数収入の端数処理の法的決定**: 原文 `二分の一` には丸め規定がなく、切捨て（floor）が正しいかは pinned 原文のみでは決定不能。モデルは B-4 のとおり未形式化として明記しているが、法的確定は**人間の法律専門家を要する**。偶数・有理数一致（意味的 CONFIRMED = 0）には影響しない。

### AL-6. 総合判定・最終報告

- pinned art.26 の `五億 = 500,000,000` と art.1 の `二分の一 = 1/2` は Lean 定数と一致。**桁違いゼロ**。needle 4/4 FOUND（U+3000 ゼロ、異なる条文位置スライス）、境界・奇数偶数グリッド不一致 0、公理依存 0。
- **CONFIRMED（意味的）= 0（ゼロ）／CONFIRMED（ドキュメント表記のみ・非意味的）= 2／BY-DESIGN = 4／UNRESOLVED = 2。**
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、20/20 axiom-free、全証明が `by decide` のカーネル還元。監査用一時ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AK ほか全 35 件）は**すべて保持**し、本セクションを末尾に追記したのみ。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` の 1 ファイルだけ。追記後レビュー件数は **36 件**。
- 残る U-1 / U-2 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

## Batch AM review (2026-11-21) — SpecialCorporationGrantTax / OilCoalTaxRate（cycle-36/37 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・STAGING は信じず、pinned `data/raw/*.law.json` を直接・独立に再 parse し、漢数字を自前の算術パーサで変換して照合した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/SpecialCorporationGrantTax.lean` / `...Spec.lean` / `...Tests.lean`（cycle-36）、`JapanTaxLaw/OilCoalTaxRate.lean` / `...Spec.lean` / `...Tests.lean`（cycle-37）。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。
- **一次資料（pinned・改変禁止）**:
  - SpecialCorporationGrantTax: `data/raw/431AC0000000004_20260401_508AC0000000002.law.json`（law_id `431AC0000000004` / revision `431AC0000000004_20260401_508AC0000000002`、施行 2026-04-01）
  - OilCoalTaxRate: `data/raw/353AC0000000025_20260525_506AC0000000052.law.json`（law_id `353AC0000000025` / revision `353AC0000000025_20260525_506AC0000000052`、施行 2026-05-25）
- **needle 出所**: `scripts/ci/transcription_audit.py` の `checks()` cycle-36/37 エントリから実文字列を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+","",s)` を**自前で平坦化・正規化した pinned 原文**に適用して部分文字列包含を判定した（`kind = "file"`, `load_law_text` と同一の `law_full_text` 平坦化全文）。
- **本レビューは機械的独立照合（原文 parse・漢数字算術化・needle 検証・境界グリッド・公理監査）であり、人間の法律専門家によるレビューではない。** 法的解釈・行政実務の妥当性は判定しない。

### AM-1. pin 完全性と原文独立抽出（漢数字 → 算数）

自前スクリプトで `data/INVENTORY.json` の `raw_snapshot` と実ファイルの SHA-256 / サイズを再計算し、2 件とも一致（改変なし）:

| モデル | law_id / revision | 計算 SHA-256 = INVENTORY | bytes |
|---|---|---|---|
| SpecialCorporationGrantTax | 431AC0000000004 / …_20260401_508AC0000000002 | `E8FE17721DBF1D8C3CDC3A8B71A5E2F49499C6E43A045EFE77C1615986AFAD74` 一致 | 143,326 一致 |
| OilCoalTaxRate | 353AC0000000025 / …_20260525_506AC0000000052 | `B72F9FC1FDE5B54CDB4862074330E7F2BE99858780717F589E4932D1D115B625` 一致 | 206,133 一致 |

自作漢数字パーサをセルフテスト（五→5、二十→20、七百→700、千八十→1080、二千四十→2040、一万八千→18000、五億→500000000、六千八百二→6802 の 8 件、全件期待値どおり）した上で抽出した。

- **art.29 flat text**（65 文字 / U+3000 = 0、原文そのまま、モジュール doc-comment の申告 65/0 と一致）:
  `（特別法人事業譲与税）第二十九条特別法人事業譲与税は、特別法人事業税の収入額に相当する額とし、都道府県に対して譲与するものとする。`
- **art.9 flat text**（99 文字 / U+3000 = 0、原文そのまま、モジュール doc-comment の申告 99/0 と一致）:
  `（税率）第九条石油石炭税の税率は、次の各号に掲げる区分に応じ、当該各号に定める金額とする。一原油及び石油製品一キロリットルにつき二千四十円二ガス状炭化水素一トンにつき千八十円三石炭一トンにつき七百円`
- `Article` は MainProvision 内に Model1 = 36 件、Model2 = 28 件。対象条文はそれぞれ `ArticleTitle` = `第二十九条` / `第九条` の 1 件のみ。

| モデル | 原文リテラル | 独立抽出（漢数字算術化） | Lean 定数 | 桁違い除外チェック | 照合 |
|---|---|---:|---|---|:---:|
| SpecialCorporationGrantTax | `収入額に相当する額` | 対応関係スライスより **同一額（恒等）** | `grantYen revenue := revenue`（Spec も `specGrant r := r`） | 定数関数・係数倍数・切捨てを明示的に除外 | ✅ |
| OilCoalTaxRate / 一 | `一キロリットルにつき二千四十円` | 二千=2000 + 四十=40 → **2,040** | `crudeOilRatePerKL : Money := 2_040` | 240（二百四十）/ 20,040 を除外 | ✅ |
| OilCoalTaxRate / 二 | `一トンにつき千八十円` | 千=1000 + 八十=80 → **1,080** | `gaseousHCRatePerTon : Money := 1_080` | 180（百八十）/ 10,080 を除外 | ✅ |
| OilCoalTaxRate / 三 | `一トンにつき七百円` | 七=7 × 百=100 → **700** | `coalRatePerTon : Money := 700` | 70（七十）/ 7,000（七千）を除外 | ✅ |

**桁違いチェック結果: 不一致ゼロ。** 二千四十 = 2,040、千八十 = 1,080、七百 = 700 を pinned 原文から直接抽出し、各誤読候補を明示的に除外して Lean 定数と一致。「収入額に相当する額」は定数関数ではなく恒等対応であり、`grantYen(r) = r` は原文逐語に忠実。

### AM-2. needle 健全性（CI `checks()` 実文字列を自前正規化原文で検証）

正規化は CI と同一 `re.sub(r"[\s　]+","",s)` を needle と自前平坦化した pinned flat 全文の双方へ適用。file locator に従い `load_law_text` と同一の平坦化全文で包含判定した。

| モデル | # | CI needle（実文字列） | U+3000 | FOUND | 正規化全文 offset | needle 長 |
|---|---|---|---:|:---:|---:|---:|
| SpecialCorpGrant | 1 | `特別法人事業譲与税）第二十九条` | 0 | ✅ | 10,957 | 15 |
| SpecialCorpGrant | 2 | `特別法人事業譲与税は、特別法人事業税の収入額に相当する額とし、都道府県に対して譲与するものとする` | 0 | ✅ | 10,972 | 48 |
| OilCoalRate | 1 | `原油及び石油製品一キロリットルにつき二千四十円` | 0 | ✅ | 2,670 | 23 |
| OilCoalRate | 2 | `ガス状炭化水素一トンにつき千八十円` | 0 | ✅ | 2,694 | 17 |
| OilCoalRate | 3 | `石炭一トンにつき七百円` | 0 | ✅ | 2,712 | 11 |

- **5/5 FOUND、U+3000 含有 0 件。** 各モデルの needle は互いに異なる条文位置スライスを指す（SpecialCorp: offset 10,957 の見出し側と 10,972 の本文側で重複なし。OilCoal: 2,670 / 2,694 / 2,712 の 3 区分スライス）。3 本目までが金額リテラルを含む。

### AM-3. 反例探索（境界値・数量グリッド 0..10）

| 攻撃対象 | 結果 | 反例 |
|---|---|---:|
| Model1 `grantYen(r) = r`、r = 0..10（11 点） | 全点で `grantYen(r) = r` | 0 |
| Model1 `agreeSpecialCorporationGrantTax = true`（[0,1,2,999,1_000_000,10_000_000]） | `by decide` で検証、一致 | 0 |
| Model2 原油 2040×q、q = 0..10（11 点） | 0/2040/4080/…/20400、全点一致 | 0 |
| Model2 ガス 1080×q、q = 0..10（11 点） | 0/1080/2160/…/10800、全点一致 | 0 |
| Model2 石炭 700×q、q = 0..10（11 点） | 0/700/1400/…/7000、全点一致 | 0 |
| Model2 線形性 `rate×(a+b)=rate×a+rate×b`（a,b ∈ 0..10） | 3 税率すべてで真 | 0 |
| Model2 単調性・`tax(0)=0` | 3 税率すべてで真 | 0 |

- 独立 Python 再計算と、一時 Lean ファイルで `by decide` による境界定理再構成（下記 AM-4）の双方で一致。**反例検出数: ゼロ。**

### AM-4. 公理監査

- 一時 Lean ファイル `batchAM_axioms.lean`（外部 temp ディレクトリ、プロジェクト外）で 6 ファイル（2 モデル＋Spec＋Tests）を import し、10 個の named def（`grantYen` / `specGrant` / `agreeSpecialCorporationGrantTax` / `crudeOilRatePerKL` / `gaseousHCRatePerTon` / `coalRatePerTon` / `crudeOilTax` / `gaseousHCTax` / `coalTax` / `agreeOilCoalTaxRate`）へ `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **10/10 が `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は**いずれも 0 件**。
- 別途 12 本の境界定理を `by decide` で再構成し、コンパイル成功（カーネル還元証明）。
- 6 ファイルの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。
- 監査後、一時 Lean ファイルおよび一時解析スクリプト（`.py` / `.out` / `.lean`）は**すべて削除済み**。

### AM-5. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（意味的: 数値・needle・境界・公理）** | **0（ゼロ）** |
| CONFIRMED（ドキュメント表記のみ・非意味的） | 1 |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 数値・needle・境界・公理の機械照合はすべて合格。下記 D-1 は表記上の問題であり、過去バッチの慣例に従い分離した。

#### CONFIRMED（意味的）— 0 件

- 金額: 二千四十 = 2,040、千八十 = 1,080、七百 = 700、「収入額に相当する額」= 恒等を pinned 原文から独立抽出し、各誤読候補を除外して Lean 定数と一致。
- needle: 5/5 FOUND、U+3000 = 0、異なる条文位置スライス。
- 境界: 数量 0..10 の 11 点×3 税率＋Model1 11 点、計 44 点のグリッド不一致 0、線形性・単調性・tax(0)=0 すべて真。
- 公理: 禁止公理 0、10/10 axiom-free、`by decide` カーネル証明。

#### CONFIRMED（ドキュメント表記のみ・非意味的）— 1 件

- **D-1 Model1 の法令名ラベル「地方税法 art.29」の誤付与**: `SpecialCorporationGrantTax.lean` の header は「地方税法 art.29（特別法人事業譲与税）」と記載するが、pinned law_id `431AC0000000004` の実法令名は `特別法人事業税及び特別法人事業譲与税に関する法律`（INVENTORY `official_title` および原文 `revision_info.law_title` / `LawTitle` とも一致）であり、対象はその `第二十九条`。すなわち「地方税法」は誤表記（正しくは同特別法 art.29）。law_id / revision / 条文逐語 / 文字数 / needle / 定数 / pin 完全性 / 恒等計算はすべて正しく、計算・証明への影響なし。※ 修正は Lean モジュール側のため本レビューでは変更せず報告のみ。

#### BY-DESIGN — 4 件

- **B-1 Model1 スコープ明示**: 特別法人事業税の収入額の算定、都道府県への配分・譲与手続は `Scope / NOT MODELLED` と明記。「譲与額 = 収入額」の対応関係のみを扱う bounded L4 モデル。
- **B-2 Model2 スコープ明示**: 各区分の物的定義（原油/石油製品/ガス状炭化水素/石炭）、課税標準、申告・納付手続は NOT MODELLED と明記。3 税率定数と `tax = rate × quantity` のみを扱う。
- **B-3 数量の整数表現と単位差**: 原油は kL、ガス・石炭は t で単位が異なり、モデルは 3 つの独立関数（`crudeOilTax` / `gaseousHCTax` / `coalTax`）で表現。端数数量・単位換算は原文に記載がなく、モデル化対象外として Design 上有効（Money = Nat 表現を含む）。
- **B-4 税率定数のみの抽出**: art.9 は「税率は次の各号に掲げる区分に応じ当該各号に定める金額とする」と定め、モデルは 3 金額定数のみを抽出。区分の認定ロジックは含めない（B-2 と補完関係）。

#### UNRESOLVED — 2 件

- **U-1 Model1「相当する額」の法的意味**: pinned 原文は `収入額に相当する額` と定めるのみで、調整・丸め・時点差の有無を明示しない。`grantYen(r) = r`（恒等）はタスク指定どおりの機械照合は完了しているが、「相当する」が厳密同一額を意味するかは pinned 原文のみからは独立導出できない。**人間の法律専門家を要する**（AL U-1 と同趣旨）。数値・算術の一致（意味的 CONFIRMED = 0）には影響しない。
- **U-2 Model2 の税率適用・端数と適用時期**: 原文は 3 区分の金額を定めるのみで、端数数量の取扱い・税率の適用期間（施行日 2026-05-25 と課税期間の対応）等を本スライスでは決定していない。モデルは整数数量・定税率を仮定するが、法的確定は**人間の法律専門家を要する**。税率定数と整数グリッドの一致（意味的 CONFIRMED = 0）には影響しない。

### AM-6. 総合判定・最終報告

- pinned art.29 の「収入額に相当する額」= 恒等、art.9 の `二千四十 = 2,040` / `千八十 = 1,080` / `七百 = 700` は Lean 定数と一致。**桁違いゼロ**。needle 5/5 FOUND（U+3000 ゼロ、異なる条文位置スライス）、数量 0..10 グリッド不一致 0、公理依存 0。
- **CONFIRMED（意味的）= 0（ゼロ）／CONFIRMED（ドキュメント表記のみ・非意味的）= 1／BY-DESIGN = 4／UNRESOLVED = 2。**
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、10/10 axiom-free、exit code 0、全証明が `by decide` のカーネル還元。監査用一時ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AL ほか全件）は**すべて保持**し、本セクションを末尾に追記したのみ。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` の 1 ファイルだけ。追記後レビュー件数は **37 件**（`^## .*review` 見出し: 36 → 37）。
- 残る U-1 / U-2 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

---

## Batch AN review (2026-11-21) — RawMaterialRatio / LocalTaxShortfallRounding（cycle-38/39 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・STAGING は信じず、pinned `data/raw/*.law.json` を直接・独立に再 parse し、`law_full_text` の string leaf を平坦化して原文を抽出した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/RawMaterialRatio.lean` / `...Spec.lean` / `...Tests.lean`（cycle-38）、`JapanTaxLaw/LocalTaxShortfallRounding.lean` / `...Spec.lean` / `...Tests.lean`（cycle-39）。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。
- **一次資料（pinned・改変禁止）**:
  - RawMaterialRatio: `data/raw/344M50000040016_20260401_508M60000040016.law.json`（law_id `344M50000040016` / revision `344M50000040016_20260401_508M60000040016`）。INVENTORY `raw_snapshot.source_file` 一致、SHA-256 `5825565D…5E75854F` 一致、size `113717` 一致。
  - LocalTaxShortfallRounding: **実ファイル名は `data/raw/420M60000008116_20081022_000000000000000.law.json`**（task 本文の一般名を実ファイルで確認）。law_id `420M60000008116` / revision `420M60000008116_20081022_000000000000000`。INVENTORY `source_file` 一致、SHA-256 `ED13259B…16ACA` 一致、size `16365` 一致。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-38/39 エントリ（line 1556-1566）から実文字列を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+","",s)` を**自前で平坦化した pinned 原文**に適用して包含判定した（`kind = "file"`, `art = None`）。
- **本レビューは機械的独立照合（pinned 原文 parse・定数照合・needle 検証・境界グリッド・公理監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AN-1. pin 完全性と原文独立抽出（桁違い・帯の誤りの直接確認）

自前スクリプトで `Article` ノードを再帰走査し、対象条文の string leaf を連結（flat/normalized）。モジュール doc-comment の申告と独立に照合した。

| モデル | 条文 | flat 長 | U+3000 | 原文逐語（独立抽出） |
|---|---|---:|---:|---|
| RawMaterialRatio | `Article Num="1_2"`（第一条の二、見出し「（貨物の価額に占める原料又は材料の価額の割合）」） | 116 | 0 | `（貨物の価額に占める原料又は材料の価額の割合）第一条の二法第八条の二第一項第一号及び第三号ロ（不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）に規定する財務省令で定める割合は、おおむね百分の六十とする。` |
| LocalTaxShortfallRounding | `Article Num="5"`（第五条、見出し「（端数計算）」） | 133 | 0 | `（端数計算）第五条地方税等減収補てん臨時交付金の額を算定する場合においては、特別な定めがある場合のほか、その算定の過程及び算定した額に五百円未満の端数があるときはその端数金額を切り捨て、五百円以上千円未満の端数があるときはその端数金額を千円として計算するものとする。` |

- **Model 1（60%）**: 原文リテラル `百分の六十` をファイル全体で 1 件検出。独立換算 `六十 = 60`、`百分の = /100` → **60/100**。Lean `thresholdYen(v) = v * 60 / 100`、Spec `specThreshold(v) = v * 60 / 100` と一致。**桁違い（6 / 600）・分母誤り（/10, /1000）なし。**
- **Model 2（二帯端数）**: 原文は `五百円未満`（< 500 円）→ `切り捨て`、`五百円以上千円未満`（500 円以上 1000 円未満）→ `千円として計算`。端数を `r = amount % 1000`（0〜999 円）とし、`r < 500` で切捨て、その他で `+1000` する Lean `roundToThousand` と一致。**帯の誤り（500/1000 を 50/100、5000/10000 とする誤読）なし。境界の `五百円以上`（≥500）が `r < 500` の else 側に正しく入っている。**
- **単位確認**: `TaxFinance.Money := Nat`（yen）。原文の閾値が円単位であることとモデル整数表現が整合（千円単位の値を `amount` に入れる 1000 倍誤りは不存在）。
- **pin 完全性**: 2 件とも INVENTORY の `source_file` / `source_sha256` / `size_bytes` と実ファイルが一致（改変なし）。

### AN-2. needle 健全性（CI `checks()` 実文字列を自前正規化原文で検証）

| モデル | # | CI needle（実文字列） | 長 | U+3000 | FOUND | 正規化原文 offset |
|---|---|---|---:|---:|:---:|---:|
| RawMaterialRatio | 1 | `貨物の価額に占める原料又は材料の価額の割合）第一条の二` | 27 | 0 | ✅ | 1 |
| RawMaterialRatio | 2 | `に規定する財務省令で定める割合は、おおむね百分の六十とする` | 29 | 0 | ✅ | 86 |
| LocalTaxShortfallRounding | 1 | `五百円未満の端数があるときはその端数金額を切り捨て` | 25 | 0 | ✅ | 67 |
| LocalTaxShortfallRounding | 2 | `五百円以上千円未満の端数があるときはその端数金額を千円として計算する` | 34 | 0 | ✅ | 93 |

- **4/4 FOUND、needle 内の U+3000 含有 0 件、各原文の U+3000 も 0 件。** 2 本目の needle が Model 1 では「おおむね百分の六十」を、Model 2 では「五百円以上千円未満…千円として計算する」を直接含み、率・帯の意味的核心を抑えている。offset は正規化 flat 文字列（116 / 133 文字）上の 0-based 位置。

### AN-3. 反例探索（指定境界・60% グリッド）

独立 Python 再計算を Lean `example`（`by decide`）と照合。

| 攻撃対象 | 独立計算 | Lean example | 反例 |
|---|---|---|:---:|
| `thresholdYen 0` | 0 | 0 | 0 |
| 60% of 100 | 60 | 60 | 0 |
| 60% of 1000 | 600 | 600 | 0 |
| 60% of 10000 | 6000 | 6000 | 0 |
| `roundToThousand 499`（r=499<500） | 0 | 0 | 0 |
| `roundToThousand 500`（r=500≥500, 境界） | 1000 | 1000 | 0 |
| `roundToThousand 999`（r=999, 带上限） | 1000 | 1000 | 0 |
| `roundToThousand 1000`（r=0, 桁繰上がり） | 1000 | 1000 | 0 |
| `roundToThousand 1499`（r=499） | 1000 | 1000 | 0 |
| `roundToThousand 1500`（r=500, 境界） | 2000 | 2000 | 0 |

- Spec の独立定式（`specThreshold` / `specRound`）との `agree… = true`（`by decide`）も確認。**反例検出数: ゼロ（0）。** 境界 499→0 / 500→1000 の切替え、1000→1000 の連続性、1499→1000 / 1500→2000 の再切替えはいずれも原文の二帯规定どおり。

### AN-4. 公理監査

- 一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で 6 ファイルを import し、6 個の named def（`thresholdYen` / `specThreshold` / `agreeRawMaterialRatio` / `roundToThousand` / `specRound` / `agreeLocalTaxShortfallRounding`）へ `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **6/6 が `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は**いずれも 0 件**。
- 6 ファイルの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。
- 監査後、一時ファイル（`.py` / `.txt` / `.lean`）は**すべて削除済み**。

### AN-5. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（数値・needle・境界・公理の意味的発見）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 桁違い・帯の誤り・needle 不整合・境界反例・禁止公理はすべて検出されなかった。

#### CONFIRMED — 0 件

- 率: `百分の六十` → 60/100、Lean `v*60/100` と一致（桁違い・分母誤りなし）。
- 端数: `五百円未満` → 切捨て、`五百円以上千円未満` → 千円繰上、Lean の二帯（`r<500` / else `+1000`）と一致（帯・境界の誤りなし）。
- needle: 4/4 FOUND、U+3000 = 0。
- 境界: 指定 10 点すべてで独立計算と Lean が一致、反例 0。
- 公理: 禁止公理 0、6/6 axiom-free、`by decide` カーネル還元。

#### BY-DESIGN — 4 件

- **B-1 Model 1 の「おおむね」未形式化は明示済みスライス境界**: `RawMaterialRatio.lean` の `Scope / NOT MODELLED` に「『おおむね』は近似を表すため、本スライスは 60/100 の算術閾値のみを扱い、許容幅（法的解釈）は NOT MODELLED」と明記。**「おおむね」の許容幅が未形式化であることを独立確認した。** 実装は 60% の算術閾値のみ。
- **B-2 Model 1 のその他スコープ外**: 法 8 条の 2 第 1 項の区分、第三国輸入の認定は NOT MODELLED と明記。
- **B-3 Model 2 のスコープ外**: 「特別な定めがある場合」の別规定、交付金そのものの算定方法（算定基礎）は NOT MODELLED と明記。本スライスは端数処理（千円単位への二帯丸め）のみ。
- **B-4 整数 Money 表現**: `Money := Nat`（円）。60% は整数除算 `v*60/100`（floor）、端数は `% 1000` の二帯。原文に小数・通貨単位換算の定めはなく、整数スライスとして設計上妥当。

#### UNRESOLVED — 2 件

- **U-1 「おおむね」の許容幅の法的意味**: pinned 原文は `おおむね百分の六十` と定めるのみで、許容される幅（例: 60% ±α の α、あるいは行政認定の告訴方針）を数値化しない。B-1 のとおり未形式化は明示済みだが、**その法的許容幅を pinned 原文のみから独立導出することは不能**で、**人間の法律専門家を要する**。60% 算術閾値の一致（意味的 CONFIRMED = 0）には影響しない。
- **U-2 Model 2 の「特別な定めがある場合」の適用範囲**: 原文は `特別な定めがある場合のほか` と留保するが、当該別规定を列挙しない。その留保が本スライスの二帯端数に影響するか、また「算定の過程」に生じる端数と「算定した額」の端数の両方を同一二帯で処理する実務上の詳細は、pinned 原文のみでは決定不能で**人間の法律専門家を要する**。二帯定数と境界グリッドの一致（意味的 CONFIRMED = 0）には影響しない。

### AN-6. 総合判定・最終報告

- pinned 原文（art.1の2 の `おおむね百分の六十` = 60/100、art.5 の `五百円未満` 切捨て／`五百円以上千円未満` 千円繰上）を独立抽出し、Lean 実装と照合。**桁違い・帯の誤りゼロ**。needle 4/4 FOUND（U+3000 ゼロ）、指定境界 10 点反例ゼロ、公理依存ゼロ。
- **CONFIRMED: 0 件（ゼロ）／BY-DESIGN: 4 件／UNRESOLVED: 2 件。発見ゼロを明示する。**
- **「おおむね」の許容幅は未形式化であることを確認**（B-1: doc-comment に明示、U-1: 法的意味は人間の法律専門家を要する）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、6/6 axiom-free、exit code 0。監査用一時ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AM ほか全 37 件）は**すべて保持**し、本セクションを末尾に追記したのみ。追記後レビュー件数は **38 件**（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review`: 37 → 38）。
- 残る U-1 / U-2 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。


---

## Batch AO review (2026-11-21) — 不当廉売関税率政令 art.2 / AntiDumpingRate.lean（cycle-40 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・STAGING は信じず、pinned `data/raw/428CO0000000196_20210814_503CO0000000231.law.json` を直接・独立に再 parse し、`law_full_text` の string leaf を平坦化・正規化して原文を抽出した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/AntiDumpingRate.lean`（koreaRatePerMille / chinaRatePerMille / dutyYen）。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため `.lake/build` に当該モジュールの `.olean`（git 無視のビルド成果物）が生成されたが、ソース・データは未変更。
- **一次資料（pinned・改変禁止）**: law_id `428CO0000000196` / revision `428CO0000000196_20210814_503CO0000000231`（改正法 `503CO0000000231`、施行 2021-08-14）。実ファイル size **10,709 bytes**、SHA-256 **`91088DAFB3AA19F7BD89A61036E83672B26F56E4491AFF95B51F4C475680CC2C`**。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-40 エントリ（line 1596-1599, `kind="file"`, `art=None`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+","",s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合（pinned 原文 parse・定数照合・needle 検証・価格グリッド走査・公理監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AO-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `Article` ノードを再帰走査し、対象条文の string leaf を連結（flat/normalized）。`Article Num="2"` は pinned 内に **1 ノードのみ**（path `law_full_text.children[1].children[2].children[1]`）。

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| flat 長 | 99 | 99 chars | ✅ |
| U+3000 数 | 0 | 0 | ✅ |
| 正規化後長 | 99（変化なし） | — | ✅ |

原文逐語（独立抽出・flat）:
`（税率）第二条特定貨物又は暫定不当廉売関税賦課貨物に課する不当廉売関税の税率は、大韓民国を原産地とするものにあっては四十九・五パーセント、中国を原産地とするものにあっては七十三・七パーセントとする。`

→ モジュール doc-comment の引用「大韓民国を原産地とするものにあっては四十九・五パーセント、中国を原産地とするものにあっては七十三・七パーセントとする。」と**一字違わず一致**。

**率の独立換算と桁違いの明示除外**:

| 原文リテラル | 出現数 | 採用値 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|
| `四十九・五パーセント` | 1 | 49.5% = **495/1000** | `koreaRatePerMille = 495` | `4.95%`（495/10000）／`495%`（4950/1000）を**明示除外** |
| `七十三・七パーセント` | 1 | 73.7% = **737/1000** | `chinaRatePerMille = 737` | `7.37%`（737/10000）／`737%`（7370/1000）を**明示除外** |

- 日本語数字 `四十九・五` → 49.5、`七十三・七` → 73.7 を自前パーサで Arabic 変換し、`百分率 × 10 = 千分率` として 495 / 737 を得た。`4950/1000`・`495/10000` 等の桁違いは**一切採用していない**。
- `dutyYen(rate, value) = value * rate / 1000`（Nat 整数除算・切捨て）は、上記 per-mille 定数をそのまま適用する定式であり、率の表現（`495/1000`・`737/1000`）と整合。

### AO-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列） | 長 | U+3000 | 正規化冪等 | 条文スライス offset | 原文全体 offset | FOUND |
|---|---|---:|---:|:---:|---:|---:|:---:|
| N1 | `大韓民国を原産地とするものにあっては四十九・五パーセント` | 28 | 0 | ✅ | 40 | 1,427 | ✅ |
| N2 | `中国を原産地とするものにあっては七十三・七パーセント` | 26 | 0 | ✅ | 69 | 1,456 | ✅ |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、正規化前後で同一（冪等）。原文（条文スライス）自体の U+3000 も 0。
- 2 本は同一 `Article Num=2` 内で **offset 40 と 69** にあり、**異なる条文位置スライス（非重複・非オーバーラップ）** を指す。N1 は Korea 側、N2 は China 側の意味的核心（率リテラル）を直接抑えている。原文全体（正規化 2,987 文字）でも offset 1,427 / 1,456 で双方 FOUND。

### AO-3. 反例探索（価格グリッド 0..10000）

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で `dutyYen` と独立参照式 `refDuty(rate,v)=v*rate/1000` を全点比較（`lake env lean`、exit code **0**）。

| 攻撃対象 | 独立計算 / Lean 結果 | 反例 |
|---|---|---:|
| `dutyYen(495, 1000)` | 495 | 0 |
| `dutyYen(737, 1000)` | 737 | 0 |
| `dutyYen(495, 10000)` | 4,950 | 0 |
| `dutyYen(737, 10000)` | 7,370 | 0 |
| `dutyYen(495, 0)` / `dutyYen(737, 0)` | 0 / 0 | 0 |
| 価格 v ∈ 0..10000（10,001 点）× 両税率 不一致数 (`badKorea` / `badChina`) | 0 / 0 | 0 |
| 単調性 `duty(v) ≤ duty(v+1)` 破り数（v ∈ 0..9999）× 両税率 | 0 / 0 | 0 |

- 上記 6 本の端点定理を `by decide`（カーネル還元）で再構成し、すべてコンパイル成功。
- **反例検出数: ゼロ（0）。** 率・定数・計算式の一致は完全。

### AO-4. 公理監査

- 一時 Lean ファイル（外部 temp）で `JapanTaxLaw.AntiDumpingRate` を import し、3 個の named def（`koreaRatePerMille` / `chinaRatePerMille` / `dutyYen`）へ `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **3/3 が `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は**いずれも 0 件**。
- モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。
- 監査後、一時ファイル（`.py` / `.lean`）は**すべて削除済み**。

### AO-5. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（数値・needle・境界・公理の意味的発見）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 桁違い・needle 不整合・価格グリッド反例・禁止公理はすべて検出されなかった。

#### CONFIRMED — 0 件

- 率: `四十九・五` → 495/1000、`七十三・七` → 737/1000（桁違いなし、除外候補はすべて不採用）。
- needle: 2/2 FOUND、U+3000 = 0、異なる条文位置スライス。
- 境界: 価格 0..10000 の 10,001 点×2 税率、単調性 9,999 点×2 税率、不一致・反例 0。
- 公理: 禁止公理 0、3/3 axiom-free、`by decide` カーネル還元。

#### BY-DESIGN — 4 件

- **B-1 原産地認定・別表税率の未形式化（明示済みスライス境界）**: `AntiDumpingRate.lean` の `Scope / NOT MODELLED` に「原産地の認定、別表の上欄/下欄の生産者別税率、課税価格の算定は NOT MODELLED。本スライスは本文に明記された 2 つの税率定数のみを扱う。」と明記。**原産地認定と別表（生産者別）税率が未形式化であることを独立確認した。** 補足: pinned スナップショットに生産者別税率の別表は存在せ（`AppdxTable` タグ 0 件）、`別表` の 2 出現はいずれも art.1 の関税定率法の貨物分類番号・art.5 の「法の別表の税率」参照であり本スライス外。したがって本モデルが扱うのは art.2 本文の 2 国税率のみで妥当。
- **B-2 税率定数のみの抽出**: art.2 は「…税率は、大韓民国…四十九・五パーセント、中国…七十三・七パーセントとする。」と 2 国の率のみを定める。モデルは `koreaRatePerMille` / `chinaRatePerMille` の 2 定数と `dutyYen` のみを提供し、区分認定ロジックは含めない（B-1 と補完）。
- **B-3 整数 Money 表現と floor**: `Money := Nat`（円）。per-mille 定数は整数（495 / 737）で厳密に表現され、`value * rate / 1000` は自然数除算（切捨て）。原文に小数通貨・端数処理の定めはなく、整数スライスとして設計上妥当（法的正当性は U-1 で保留）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: flat 99 文字・U+3000 = 0・原文逐語がいずれも独立抽出と一致（AO-1）。訂正を要する表記の陳腐化は**存在しない**。

#### UNRESOLVED — 2 件

- **U-1 端数処理（floor）の法的正当性**: pinned art.2 は税率（495/1000・737/1000）のみを定め、課税価格が 1000 で割り切れない場合の端数（例: 1 円 × 495/1000 → 0 円）の取扱いを明示しない。`dutyYen` の整数切捨てはモデル上の選択として透明だが、**不当廉売関税の端数処理が本当に切捨てであるかは pinned 原文 art.2 のみからは決定不能**。**人間の法律専門家による確認を要する**（過去バッチ G/H/I の U-1 と同趣旨）。率・定数の一致（意味的 CONFIRMED = 0）には影響しない。
- **U-2 原産地認定・別表税率の法的取扱い**: 未形式化自体は B-1 のとおり明示済みだが、実務上の原産地認定手続、および art.1/art.5 が参照する関税定率法「別表」の税率と本スライス税率との適用関係（並課・優先等）は、pinned 原文のみでは決定不能。**人間の法律専門家を要する**。2 国税率と価格グリッドの一致（意味的 CONFIRMED = 0）には影響しない。

### AO-6. 総合判定・最終報告

- pinned 原文（政令 art.2 の `四十九・五パーセント = 495/1000`、`七十三・七パーセント = 737/1000`）を独立抽出し、Lean 実装と照合。**桁違いゼロ**。needle 2/2 FOUND（U+3000 ゼロ、異なる条文位置スライス）、価格 0..10000 グリッド反例ゼロ、公理依存ゼロ。
- **CONFIRMED: 0 件（ゼロ）／BY-DESIGN: 4 件／UNRESOLVED: 2 件。発見ゼロを明示する。**
- **原産地認定・別表税率の未形式化を確認**（B-1: doc-comment に明示、U-2: 法的取扱いは人間の法律専門家を要する）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、3/3 axiom-free、exit code 0。監査用一時ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AN ほか全 38 件）は**すべて保持**し、本セクションを末尾に追記したのみ。追記後レビュー件数は **39 件**（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review`: 38 → 39）。
- 残る U-1 / U-2 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

## Batch AP review (2026-11-21)

酒税法施行規則 art.7の8 / 関税法施行令 art.78 — PowderCoefficientRounding / ContainerSpec（cycle-43/44 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・STAGING は信じず、pinned `data/raw/*` 2 ファイルを直接・独立に再 parse し、`law_full_text` の string leaf を平坦化・正規化して原文を抽出した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/PowderCoefficientRounding.lean`（`truncate3` / `truncate2`） + `PowderCoefficientRoundingSpec.lean` + `PowderCoefficientRoundingTests.lean`、`JapanTaxLaw/ContainerSpec.lean`（`minWidthHeightDm` / `minLengthDm` / `meetsDimensions`） + `ContainerSpecSpec.lean` + `ContainerSpecTests.lean`。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。監査は外部 temp ディレクトリの一時 `.py` / `.lean` で実施し、終了後に削除した。
- **一次資料（pinned・改変禁止）**:
  - 酒税法施行規則 art.7の8: law_id `337M50000040026` / revision `337M50000040026_20250401_507M60000040034`、`data/raw/337M50000040026_20250401_507M60000040034.law.json`（**125,149 bytes**, SHA-256 **`F1C174E67A74D3A56BA5A9214C71700AE6F92569E111042476EC67DC01D41612`**）。`Article Num="7_8"` は pinned 内に **1 ノードのみ**。
  - 関税法施行令 art.78: law_id `329CO0000000155` / revision `329CO0000000155_20260401_508CO0000000085`、`data/raw/329CO0000000155_20260401_508CO0000000085.law.json`（**459,811 bytes**, SHA-256 **`7F76960B6510A6BD086C236C7D7FACF5E47CB276F24A3F4A705C0C0AA8E15D01`**）。`Article Num="78"` は pinned 内に **1 ノードのみ**。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-43 エントリ（line 1729-1733, `kind="file"`, `art=None`）と cycle-44 エントリ（line 1735-1739, 同）から実文字列各 2 本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s\u3000]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AP-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `Article` ノードを再帰走査し、対象条文の string leaf を連結（flat/normalized）。両条文とも該当 `Article` は 1 ノードのみで、別位置との重複なし。

| 項目 | 独立抽出（powder art.7の8） | doc-comment 申告 | 独立抽出（container art.78） | doc-comment 申告 | 照合 |
|---|---:|---:|---:|---:|:---:|
| flat 長 | 121 | 121 chars | 147 | 147 chars | ✅ |
| U+3000 数 | 0 | 0 | 0 | 0 | ✅ |
| 正規化後長 | 121（変化なし） | — | 147（変化なし） | — | ✅ |

原文逐語（独立抽出・flat、省略なし）:

- **art.7の8**: `（粉末酒の換算係数の端数計算）第七条の八令第十九条第一項第一号に規定する換算係数の算出は、同号に定める算式による計算の過程において生ずる小数点以下第三位未満の端数及び当該計算により得られた換算係数の小数点以下第二位未満の端数を切り捨てて行う。`
- **art.78**: `（大型のコンテナの規格の指定）第七十八条法の別表第七六〇六・一二号の一及び第七六〇六・九二号の一に規定する政令で定める規格の大型のコンテナは、幅及び高さが二・四メートル以上で長さが二・九メートル以上のコンテナのうち、日本産業規格に定める国際大型コンテナの積重ね強度以上の強度を有するものとする。`

**数値リテラルの独立換算と桁違いの明示除外**:

| 原文リテラル | 条文 | 出現 | 採用値 | Lean 定式 | 除外した誤読 |
|---|---|---:|---|---|---|
| `小数点以下第三位未満の端数` | art.7の8 | 1 | 1/1000 単位へ切捨て（1/10000 単位で **10 の倍数**） | `truncate3 x = x / 10 * 10` | `小数点以下第一位`（÷1）、`第四位未満`（÷10000＝1/100 単位）を**明示除外**。1/100 と 1/1000 の取り違え（÷100）も不採用 |
| `小数点以下第二位未満の端数` | art.7の8 | 1 | 1/100 単位へ切捨て（1/10000 単位で **100 の倍数**） | `truncate2 x = x / 100 * 100` | 途中処理と同じ ÷10（1/1000 単位）への誤読を**明示除外** |
| `二・四メートル` | art.78 | 1 | 2.4 m = **24 dm**（1/10 m 単位） | `minWidthHeightDm = 24` | `〇・二四メートル`（0.24 m＝24 cm）、`二十四メートル`（24 m）を**明示除外** |
| `二・九メートル` | art.78 | 1 | 2.9 m = **29 dm**（1/10 m 単位） | `minLengthDm = 29` | `〇・二九メートル`（0.29 m）、`二十九メートル`（29 m）、cm/mm 単位を**明示除外** |

- 桁違い候補（`小数点以下第一位` / `小数点以下第四位未満の端数を切り捨て` / `百分の一位` / `千分の一位` / `〇・二四メートル` / `二十四メートル` / `〇・二九メートル` / `二十九メートル` / `二・四センチメートル` / `二・四ミリメートル` / `二・九センチメートル`）は、自前正規化原文（全文）に対する検索で**いずれも NOT FOUND**。採用値は原文から強制される一意の解釈のみ。
- 「第三位未満」= 1/1000 未満を捨てる → 1/10000 単位で下 1 桁（10 未満）を捨てる → `÷10×10`。「第二位未満」= 1/100 未満を捨てる → 下 2 桁（100 未満）を捨てる → `÷100×100`。単位系（1/10000）と桁数の対応を独立に導出した結果は Lean 定式と一致。
- 寸法は 1 m = 10 dm として 2.4 → 24、2.9 → 29。`meetsDimensions w h l = w>=24 && h>=24 && l>=29` は原文の「幅及び高さが二・四メートル以上で長さが二・九メートル以上」と同値。**境界値は `>=`（以上）であり `>`（超える）ではない**点も原文で確認。

### AP-2. needle 健全性（CI `checks()` 実文字列各 2 本を自前正規化原文で検証）

偏移量は self-normalized 文字列上の 0-based index。

| # | CI needle（実文字列） | 長 | U+3000 | 正規化冪等 | 条文スライス offset | 原文全体 offset | FOUND（条文/全文） |
|---|---|---:|---:|:---:|---:|---:|:---:|
| P-N1 | `小数点以下第三位未満の端数` | 13 | 0 | ✅ | 68 | 4,486 | ✅ / ✅ |
| P-N2 | `小数点以下第二位未満の端数を切り捨てて行う` | 21 | 0 | ✅ | 99 | 4,517 | ✅ / ✅ |
| C-N1 | `幅及び高さが二・四メートル以上で長さが二・九メートル以上` | 28 | 0 | ✅ | 71 | 63,257 | ✅ / ✅ |
| C-N2 | `大型のコンテナの規格の指定）第七十八条` | 19 | 0 | ✅ | 1 | 63,187 | ✅ / ✅ |

- **4/4 FOUND**（各モデル 2/2）。needle 内の U+3000 含有 **0 件**、正規化前後で同一（冪等）。両条文スライス自体の U+3000 も 0。
- 各 2 本は同一 `Article` 内で異なる位置（powder: 68 / 99、container: 1 / 71）にあり、**非重複・非オーバーラップ**。C-N2 は条見出し直後の offset 1、C-N1 は寸法句を直接抑えている。原文全体（正規化 powder 14,543 文字 / container 73,569 文字）でも全件 FOUND。
- U+3000 は両スナップショットの**全文**には存在する（powder 56 件、container 189 件 — 主に章見出し）。したがって「U+3000 を除去せずに照合する」tests は誤検知を生み得るが、CI と同一の正規化を適用した本監査では全件 FOUND であり、needle 自体の健全性に問題はない。

### AP-3. 反例探索

一時 Python スクリプトで Lean と同一の整数演算を再実装し、端点・境界・格子を走査（独立参照式との全点比較）。

| 攻撃対象 | 独立計算 / 期待値 | 結果 | 反例 |
|---|---|---:|---:|
| `truncate3(12345)` = `12345/10*10` | 12,340 | 12,340 | 0 |
| `truncate3(12349)` | 12,340 | 12,340 | 0 |
| `truncate2(12345)` = `12345/100*100` | 12,300 | 12,300 | 0 |
| `truncate2(12999)` / `truncate2(10000)` | 12,900 / 10,000 | 一致 | 0 |
| `agreePowderCoefficientRounding`（[0,1,9,10,11,12345,12999,99999]） | full agreement | true | 0 |
| `meetsDimensions(24,24,29)` | true（境界≡） | true | 0 |
| `meetsDimensions(23,24,29)` / `(24,23,29)` / `(24,24,28)` | false / false / false（境界直下） | すべて一致 | 0 |
| `meetsDimensions(30,25,120)` / `(0,0,0)` | true / false | 一致 | 0 |
| `agreeContainerSpec`（6 点格子） | full agreement | true | 0 |

- **反例検出数: ゼロ（0）。** 桁違い（1/100 ↔ 1/1000、0.24 m ↔ 24 m）も、境界の含み（`>=` vs `>`）も、独立参照式との不一致も検出されなかった。
- 補足: `specT3` / `specT2` / `specMeets` は impl と独立に書かれた整数定式であり、`agree*` フラグが両者の全点一致を `decide` で証明している。 形式化担当の主張を鵜呑みにしたものではなく、テキスト上も別定義である点を確認した。

### AP-4. 公理監査

- 一時 Lean ファイル（外部 temp）で 6 モジュール（impl / Spec / Tests ×2 モデル）を import し、**10 個の named def**（`truncate3` / `truncate2` / `specT3` / `specT2` / `agreePowderCoefficientRounding` / `minWidthHeightDm` / `minLengthDm` / `meetsDimensions` / `specMeets` / `agreeContainerSpec`）と、**`by decide` 証明スタイルを再構成した 3 本の probe theorem**（`ap_probe_t3` / `ap_probe_t2` / `ap_probe_meets`）に対し `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **13/13 すべて `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は**いずれも 0 件**。
- 6 ファイルの静的スキャンでも `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致は**合計 0 件**（6/6 ファイルで 0）。
- 注意: CI の `generate_axiom_probe.py` は `theorem` / `lemma` 宣言のみを `#print axioms` 対象にするが、本 2 ユニットは証明をすべて `example`（匿名）で書いており named theorem を宣言しない。上記の補足 probe を追加したことで、`by decide` が禁じられた公理を導入しないことを明示的に確認した。
- 監査後、一時ファイル（`.py` / `.lean`）は**すべて削除済み**。

### AP-5. 未形式化の確認（換算係数算出式・強度判定）

| 項目 | pinned 原文 | モジュール `Scope / NOT MODELLED` | 独立確認 |
|---|---|---|---|
| 換算係数の算出式 | art.7の8 は「令第十九条第一項第一号に規定する換算係数」「**同号に定める算式**による計算」と**他条文を参照するだけで算式本体を含まない** | 「『同号に定める算式』そのもの（換算係数の算出式）は NOT MODELLED」と明記 | ✅ 未形式化を確認。本スライスは二段の端数処理のみ |
| 大型コンテナの強度判定 | art.78 は「日本産業規格に定める国際大型コンテナの**積重ね強度以上の強度**を有するものとする」と要件を定めるが、判定手順・規格番号は本文にない | 「日本工業規格に定める国際大型コンテナの積重ね強度」の判定は NOT MODELLED、と明記 | ✅ 未形式化を確認。判定ロジックは RTL に存在しない |
| 品目区分（別表の号） | art.78 は「法の別表第七六〇六・一二号の一及び第七六〇六・九二号の一」を参照 | 「コンテナの品目区分（別表の号）は NOT MODELLED」と明記 | ✅ 未形式化を確認 |

- **非意味的な doc-comment 表記差（1 件、BY-DESIGN 枠内で記録）**: ContainerSpec.lean の `Scope / NOT MODELLED` 行は「**日本工業規格**に定める…」と表記するが、pinned art.78 の原文は「**日本産業規格**に定める…」（名称変更後の現行表記）。原文逐語引用（AP-1）自体は省略記法のため語句を含まず、モデル化された数値（24 / 29）・needle・境界・公理には**一切影響しない**。スライス外の説明文の陳腐化であり、訂正するかどうかは形式化担当の判断事項。**人間の法的レビューを要する事由ではない。**

### AP-6. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（数値・needle・境界・公理の意味的発見）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 桁違い・needle 不整合・境界反例・禁止公理はすべて検出されなかった。BY-DESIGN の 1 件（B-5）は非意味的な doc-comment 表記差であり、CONFIRMED を汚さない。

#### CONFIRMED — 0 件

- 数値: 第三位未満 → ÷10×10、第二位未満 → ÷100×100（1/10000 単位）、二・四メートル → 24 dm、二・九メートル → 29 dm。原文から強制される一意の解釈と一致。桁違い候補 11 種はすべて NOT FOUND。
- needle: 4/4 FOUND、U+3000 = 0、正規化冪等、非重複位置。
- 境界: `truncate3` / `truncate2` の切捨て境界、寸法 24 / 29 の `>=` 境界（`23,24,28` が false）、`agree*` 全点一致。反例 0。
- 公理: 13/13 axiom-free、禁止公理 0、6 ファイルの禁止トークン 0。

#### BY-DESIGN — 5 件

- **B-1 換算係数算出式の未形式化（明示済みスライス境界）**: art.7の8 は令第十九条第一項第一号の「同号に定める算式」を参照するのみで算式本文を持たない。doc-comment の NOT MODELLED 宣言と一致（AP-5）。
- **B-2 二段端数処理の整数定式**: 値を 1/10000 単位の Nat で表現し、途中 → `÷10×10`、最終 → `÷100×100`。自然数除算による切捨ては原文の「切り捨てて」と整合する設計選択（法的正当性は U-1 で保留）。
- **B-3 強度判定・品目区分の未形式化（明示済みスライス境界）**: art.78 の「積重ね強度以上の強度」判定および別表の号は doc-comment に明記されたとおり NOT MODELLED（AP-5）。
- **B-4 寸法の 1/10 m 整数表現**: 小数を避け 2.4 m / 2.9 m を 24 / 29 dm として比較。桁違いを構造的に排除する設計選択。
- **B-5 非意味的な doc-comment 表記差（軽微）**: 「日本工業規格」vs pinned「日本産業規格」。スライス外の説明文のみ。数値・needle・境界・公理への影響ゼロ。機械的照合による指摘であり、訂正は任意。

#### UNRESOLVED — 2 件

- **U-1 二段端数処理の法的正当性と算式との適用関係**: pinned art.7の8 は「同号に定める算式」を参照するだけで、算式本体（令第十九条第一項第一号）を含まない。したがって「途中の第三位未満切捨て」と「最終の第二位未満切捨て」の順序・適用範囲、および算出式の計算途中で本当にこの二段処理が生じるかは、pinned 原文のみからは決定不能。**人間の法律専門家による確認を要する。** 数値一致（CONFIRMED = 0）には影響しない。
- **U-2 強度判定・品目区分の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、「日本産業規格に定める国際大型コンテナの積重ね強度以上の強度」の具体的判定方法、および art.78 が参照する別表第七六〇六・一二号の一／九二号の一号区分と本スライス寸法条件との適用関係は、pinned 原文のみでは決定不能。**人間の法律専門家を要する。** 寸法閾値と境界の一致（CONFIRMED = 0）には影響しない。

### AP-7. 総合判定・最終報告

- pinned 原文（art.7の8 の「小数点以下第三位未満／第二位未満」、art.78 の「二・四メートル／二・九メートル」）を独立抽出し、Lean 実装と照合。**桁違いゼロ**。needle 4/4 FOUND（U+3000 ゼロ、非重複位置）、反例ゼロ、公理依存ゼロ。
- **CONFIRMED: 0 件（ゼロ）／BY-DESIGN: 5 件／UNRESOLVED: 2 件。意味的発見ゼロを明示する。**
- **換算係数算出式・強度判定（および品目区分）の未形式化を確認**（B-1 / B-3: doc-comment に明示、U-1 / U-2: 法的取扱いは人間の法律専門家を要する）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、13/13 axiom-free、exit code 0。監査用一時ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AO ほか全 39 件）は**すべて保持**し、本セクションを末尾に追記したのみ。追記後レビュー件数は **40 件**（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review`: 39 → 40）。
- 残る U-1 / U-2 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

## Batch AQ review (2026-11-22)

石油ガス譲与税法施行規則 art.1 / law 341M50000008002 — RoadWidthThreshold（cycle-45 独立原文照合・反例探索）

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。coordinator 要約・`docs/STAGING_ROADWIDTH.md` は信じず、pinned `data/raw/*` を直接・独立に再 parse し、`law_full_text` の string leaf を平坦化・自前正規化して原文を抽出した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/RoadWidthThreshold.lean`（`widthThresholdDm` / `isNarrowRoad`）+ `RoadWidthThresholdSpec.lean`（`specNarrow` / `agreeRoadWidthThreshold`）+ `RoadWidthThresholdTests.lean`。**Lean モジュール / `data/*` / `scripts/*` は一切変更せず**、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。監査は外部 temp ディレクトリの一時 `.py` / `.lean` / `.txt` で実施し、終了後に削除した。
- **一次資料（pinned・改変禁止）**: law_id `341M50000008002` / revision `341M50000008002_20191128_501M60000008059`、`data/raw/341M50000008002_20191128_501M60000008059.law.json`（**26,582 bytes**, SHA-256 **`4A676A0093742423265AD491A7D498C1D7256EFD26BA7CF91EB3D165FA48BC96`**）。`Article Num="1"` は pinned 内に **1 ノードのみ**。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-45 エントリ（line 1741–1745, `kind="file"`, `art=None`）から実文字列 2 本を直接読み出し、CI の正規化と同一の `[\s\u3000]+` 除去を**自前で平坦化した pinned 原文**に適用して包含判定した（CI コードをそのまま呼ぶのではなく自前実装で再検証）。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AQ-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `Article` ノードを再帰走査し、対象条文の string leaf を連結（flat/normalized）。

| 項目 | 独立抽出 | doc-comment 申告 | 照合 |
|---|---:|---:|:---:|
| flat 長 | 155 | 155 chars | ✅ |
| U+3000 数 | 0 | 0 | ✅ |
| 自前正規化後長 | 155（変化なし） | — | ✅ |
| `Article Num="1"` ノード数 | 1 | — | ✅ |

原文逐語（独立抽出・flat、省略なし、155 文字）:

`（法第二条第一項の総務省令で定める道路）第一条石油ガス譲与税法（昭和四十年法律第百五十七号。以下「法」という。）第二条第一項に規定する総務省令で定める道路は、渡船施設、路面幅員が二・五メートル未満である道路（橋梁を除く。）及び道路整備特別措置法（昭和三十一年法律第七号）の規定によつて料金を徴収する道路とする。`

幅員スライス（原文逐語）: `路面幅員が二・五メートル未満である道路（橋梁を除く。）`

**数値リテラルの独立換算と桁違いの明示除外**:

| 原文リテラル | 出現 | 自前パース | 1/10 m 単位 | Lean 定式 | 除外した誤読 |
|---|---:|---|---:|---|---|
| `二・五メートル` | 1 | 二=2, ・=小数点, 五=5 → 2.5 m | **25** | `widthThresholdDm = 25` | `〇・二五メートル`（0.25 m＝25 cm）、`二五メートル`（25 m）、`二・五センチメートル` / `二・五ミリメートル` を**明示除外** |

- 桁違い候補（`〇・二五メートル` / `〇・二五` / `二五メートル` / `二・五〇メートル` / `二・五センチメートル` / `二・五ミリメートル`）は、自前正規化原文（全文 3,641 文字）に対する検索で**いずれも NOT FOUND**。2.5 m = 25 dm は原文から強制される一意の解釈。
- 1 m = 10 dm として 2.5 × 10 = 25。単位は 1/10 m（dm）であり cm（1/100 m）でも mm でもない。原文の「メートル」表記と doc-comment の単位申告（1/10 m 単位）が整合。

### AQ-2. needle 健全性（CI `checks()` 実文字列 2 本を自前正規化原文で検証）

偏移量は self-normalized 文字列上の 0-based index。

| # | CI needle（実文字列） | 長 | U+3000 | 条文 offset | 全文 offset | FOUND（条文/全文） |
|---|---|---:|---:|---:|---:|:---:|
| W-N1 | `路面幅員が二・五メートル未満である道路` | 19 | 0 | 84 | 183 | ✅ / ✅ |
| W-N2 | `法第二条第一項の総務省令で定める道路` | 18 | 0 | 1 | 100 | ✅ / ✅ |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、条文スライス自体の U+3000 も 0（自前正規化前後で同一＝冪等）。
- 2 本は同一 `Article` 内で異なる位置（offset 1 / 84）にあり、非重複・非オーバーラップ。W-N2 は条見出し（caption）直後の offset 1、W-N1 は幅員句を直接抑えている。全文（自前正規化 3,641 文字）でも 2/2 FOUND。

### AQ-3. 反例探索（「未満」= 厳密不等式）

一時 Python スクリプトで Lean と同一の整数比較を再実装し、境界・格子を走査（独立参照式 `w < 25` との全点比較）。

| 攻撃対象 | 独立計算 / 期待値 | 結果 | 反例 |
|---|---|---:|---:|
| `isNarrowRoad(24)` | `24 < 25` → true | true | 0 |
| `isNarrowRoad(25)` | `25 < 25` → false（境界は不含） | false | 0 |
| `isNarrowRoad(26)` | `26 < 25` → false | false | 0 |
| `isNarrowRoad(0)` / `isNarrowRoad(100)` | true / false | 一致 | 0 |
| `agreeRoadWidthThreshold`（[0,1,24,25,26,100]） | impl == spec 全点一致 | true | 0 |

- **反例検出数: ゼロ（0）。** 原文「未満」は厳密不等式 `<` であり、`≦`（25 を含める）でも `>` でもない点を確認。境界 25 を true と誤る実装なら直ちに detected されるが、実装は `widthDm < widthThresholdDm` で正しい。独立定式 `specNarrow(w) = w < 25` との `agree` フラグも `by decide` で成立（テキスト上も別定義である点を確認）。

### AQ-4. 公理監査

- 一時 Lean ファイル（外部 temp）で 3 モジュール（impl / Spec / Tests）を import し、**4 個の named def**（`widthThresholdDm` / `isNarrowRoad` / `specNarrow` / `agreeRoadWidthThreshold`）と、**`by decide` 証明スタイルを再構成した 1 本の probe theorem**（`aq_boundary`: `isNarrowRoad 24 = true ∧ isNarrowRoad 25 = false ∧ isNarrowRoad 26 = false`）に対し `#print axioms` を実行（`lake env lean`、exit code **0**）。
- 結果: **5/5 すべて `"does not depend on any axioms"`**。`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` 依存は**いずれも 0 件**。
- 監査後、一時ファイル（`.py` / `.lean` / `.txt`）は**すべて削除済み**。

### AQ-5. 未形式化の確認（渡船施設・橋梁除外・料金徴収道路の認定）

| 項目 | pinned 原文（art.1） | モジュール `Scope / NOT MODELLED` | 独立確認 |
|---|---|---|---|
| 渡船施設 | 「道路は、**渡船施設**、…とする。」（offset 79） | 「『渡船施設』…の認定は NOT MODELLED」と明記 | ✅ 未形式化を確認 |
| 橋梁を除く | 「…（**橋梁を除く。**）…」（offset 104） | 「『橋梁を除く』の認定は NOT MODELLED」と明記 | ✅ 未形式化を確認 |
| 料金を徴収する道路 | 「…道路整備特別措置法…の規定によつて**料金を徴収する道路**とする。」（offset 142） | 「『料金を徴収する道路』の認定は NOT MODELLED」と明記 | ✅ 未形式化を確認 |

- 本スライスは幅員 2.5 m 未満の**数値判定のみ**を扱い、上記 3 つの認定（どの道路が渡船施設／橋梁／有料道路に該当するか）は RTL に存在しない。doc-comment の申告と一致。**未形式化であることを確認**した（欠落ではなく明示されたスライス境界）。

### AQ-6. 分類・件数

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（数値・needle・境界・公理の意味的発見）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **意味的な発見はゼロ（CONFIRMED = 0）を明示する。** 桁違い・needle 不整合・境界反例・禁止公理はすべて検出されなかった。

#### CONFIRMED — 0 件

- 数値: `二・五メートル` → 2.5 m → 25 dm。原文から強制される一意の解釈と一致。桁違い候補 6 種はすべて NOT FOUND。
- needle: 2/2 FOUND、U+3000 = 0、非重複位置。
- 境界: `isNarrowRoad(24)=true` / `(25)=false` / `(26)=false`（厳密 `<`）、`agree` 全点一致。反例 0。
- 公理: 5/5 axiom-free、禁止公理 0、exit code 0。
- **発見ゼロを手柄にしない。**

#### BY-DESIGN — 4 件

- **B-1 渡船施設・橋梁除外・料金徴収道路の認定の未形式化（明示済みスライス境界）**: art.1 はこれらを列挙するが判定手順は本文にない。doc-comment の NOT MODELLED 宣言と一致（AQ-5）。
- **B-2 幅員の 1/10 m 整数表現**: 小数を避け 2.5 m を 25 dm として比較。桁違い（0.25 m / 25 m）を構造的に排除する設計選択。
- **B-3 「未満」= 厳密 `<` の定式化**: 原文「未満」から一意に導かれる境界（25 を不含）。`Nat` 入力は負の幅を扱わないが、スライスは幅員閾値の数値判定に限定されている。
- **B-4 単一 bounded L4 モデルのスコープ**: 幅員閾値のみをモデル化し、法第二条第一項の委任関係・他号との適用関係は扱わない（doc-comment に明記）。

#### UNRESOLVED — 2 件

- **U-1 渡船施設・橋梁・料金徴収道路の認定の法的取扱い**: 未形式化自体は B-1 のとおり明示済みだが、それぞれの定義・認定方法、および「橋梁を除く」が幅員判定の前段か後段か（橋梁は幅員に関わらず対象外か）は、pinned art.1 のみからは決定不能。**人間の法律専門家による確認を要する。** 数値一致（CONFIRMED = 0）には影響しない。
- **U-2 「路面幅員」の測定方法と委任範囲**: 「路面幅員」の測り方（車道部か全幅か）、および石油ガス譲与税法第二条第一項の総務省令への委任が本スライスにどのように及ぶかは、pinned 原文のみでは決定不能。**人間の法律専門家を要する。** 閾値 25 と境界の一致（CONFIRMED = 0）には影響しない。

### AQ-7. 総合判定・最終報告

- pinned 原文（art.1 の「路面幅員が二・五メートル未満である道路（橋梁を除く。）」）を独立抽出し、Lean 実装と照合。**桁違いゼロ**（0.25 m / 25 m を明示除外）。needle 2/2 FOUND（U+3000 ゼロ、非重複位置）、反例ゼロ、公理依存ゼロ。
- **CONFIRMED: 0 件（ゼロ）／BY-DESIGN: 4 件／UNRESOLVED: 2 件。意味的発見ゼロを明示する。**
- **渡船施設・橋梁除外・料金徴収道路の認定の未形式化を確認**（B-1: doc-comment に明示、U-1 / U-2: 法的取扱いは人間の法律専門家を要する）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` とも **0 件**、5/5 axiom-free、exit code 0。監査用一時ファイルは削除済み。
- 既存レビュー履歴（Batch G〜AP ほか全 40 件）は**すべて保持**し、本セクションを末尾に追記したのみ。追記後レビュー件数は **41 件**（coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review`: 40 → 41）。
- 残る U-1 / U-2 は pinned 原文のみでは解けない判断であり、**人間の法律専門家によるレビューを要する**。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。


## Batch AR review (2026-11-22)

- **レビュー日**: 2026-11-22
- **レビュア**: Adversarial Review Agent（形式化担当と独立、cycle-46 の 1 モデル）
- **対象（読み取り専用・変更せず）**: `JapanTaxLaw/LandValuePerSquareMeter.lean` / `JapanTaxLaw/LandValuePerSquareMeterSpec.lean` / `JapanTaxLaw/LandValuePerSquareMeterTests.lean`
- **pinned 一次資料（読み取り専用）**: `data/raw/403CO0000000174_20250722_507CO0000000249.law.json`（law_id `403CO0000000174` / revision `403CO0000000174_20250722_507CO0000000249`、地価税法施行令）
- **CI needle 出所**: `scripts/ci/transcription_audit.py:1764-1768`（`checks()` の cycle-46 エントリ）
- **手法**: 形式化担当の doc-comment / Spec / テストを根拠にせず、pinned raw JSON の `Article`（`attr.Num == "8"`）ノードから text-leaf のみを独立抽出し、自前正規化原文に対して照合した。

### AR-1. 独立原文抽出・照合（pinned 原文からの除算の直接抽出）

raw JSON の `law_full_text` を走査し `Num: "8"` の `Article` を 1 件同定。文字リーフ 3 個のみを連結（タグ名・属性値は混入させない）した正規化原文は 100 字、U+3000 = 0 個。

> （一平方メートル当たりの更地の価額）第八条法第六条第六項に規定する政令で定めるところにより計算した金額は、当該土地等に係る更地の価額を当該土地等の面積で除して計算した一平方メートル当たりの価額とする。

独立抽出（原文の語句のみを根拠とする）:

| 原文の語句 | 抽出された意味 | 対応する実装 |
|---|---|---|
| 「更地の価額を」 | 被除数（分子）= 更地の価額 | `bareLandValue` |
| 「面積で除して」 | 演算子 = 除算、除数 = 面積 | `/ area` |
| 「計算した一平方メートル当たりの価額とする」 | 結果 = 一平方メートル当たりの価額 | `valuePerSqm` の戻り値 |

したがって原文から直接導かれる定式は `valuePerSqm(bareLandValue, area) = bareLandValue / area` であり、実装の除算枝 `bareLandValue / area` と一致。**原文との不一致は認められない（CONFIRMED = 0）**。

実装の `if area = 0 then 0 else ...` の `area = 0` 枝は原文に存在しない防御的センチネルである。doc-comment も「面積ゼロの土地は存在しない」と明記しており、原文との矛盾ではなく **BY-DESIGN (B-1)** と分類する。

### AR-2. needle 健全性（CI 実文字列 2 本の独立検証）

`checks()` の当該エントリに埋め込まれた 2 本を、上記の自前正規化原文（pinned art.8 の text-leaf 連結、U+3000 除去）に対して照合した。CI の `_norm` は `re.sub(r"[\s　]+", "", s)` であり、自前正規化とは独立に同一結論となる。

| # | CI needle（実文字列） | needle 内 U+3000 | 自前正規化原文 | CI `_norm` 適用後（全法文） | 判定 |
|---|---|---:|---|---|---|
| 1 | `一平方メートル当たりの更地の価額）第八条` | 0 | FOUND | 1 hit | OK |
| 2 | `当該土地等に係る更地の価額を当該土地等の面積で除して計算した一平方メートル当たりの価額とする` | 0 | FOUND | 1 hit | OK |

- U+3000: needle 2 本とも 0 個、正規化原文も 0 個。
- **needle 健全性: 2/2 FOUND**。転記乖離・needle 腐敗は検出されず。

### AR-3. 反例探索

`Money` は `JapanTaxLaw/TaxFinance.lean:29` の `abbrev Money := Nat` であり、`/` は自然数除算（切捨て）。独立に構成した反例を `lake env lean` 上で `by decide` 実行した。

| 反例 | 期待値 | 実行結果 | 判定 |
|---|---:|---:|---|
| `valuePerSqm 1000 10` | 100 | 100 | PASS |
| `valuePerSqm 1000 3` | 333 | 333 | PASS |
| `valuePerSqm 9999 7` | 1428 | 1428 | PASS（9999/7 = 1428.57… の切捨て） |
| `valuePerSqm 1000 0` | 0 | 0 | PASS（BY-DESIGN センチネル） |
| `valuePerSqm 7 2` | 3 | 3 | PASS |
| `valuePerSqm 1 2` | 0 | 0 | PASS |
| `specPerSqm 9999 7` | 1428 | 1428 | PASS |
| `agreeLandValuePerSquareMeter` | true | true | PASS（独立定式と一致） |

反例による実装の反証は失敗（すなわち実装は反例に耐えた）。**反例件数: 0（ゼロ）**。なお「端数を切捨てるのが法的に正しいか」は pinned art.8 の文言のみからは決定できず UNRESOLVED (U-1)。

### AR-4. 公理監査

一時 Lean ファイルを作成し `lake env lean`（toolchain `leanprover/lean4:v4.35.0`）で実行。exit code 0。

| 宣言 | `#print axioms` 結果 |
|---|---|
| `valuePerSqm` | does not depend on any axioms |
| `specPerSqm` | does not depend on any axioms |
| `agreeLandValuePerSquareMeter` | does not depend on any axioms |
| `ar_ce1`（1000/10） | does not depend on any axioms |
| `ar_ce3`（9999/7） | does not depend on any axioms |
| `ar_ce4`（area=0） | does not depend on any axioms |
| `ar_agree` | does not depend on any axioms |

`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` への依存 **0 件**。7/7 axiom-free。一時 Lean ファイルは削除済み。

### AR-5. 未形式化範囲の確認

- 「更地の価額」の算定方法（原文が参照する法第六条第六項の「政令で定めるところにより計算した金額」）は NOT MODELLED。pinned art.8 は算出済みの更地価額を入力として受け取る定式のみを規定する。→ BY-DESIGN (B-3) / 法的妥当性は UNRESOLVED (U-2)。
- 面積の単位・測定方法および端数処理の法的取扱いは NOT MODELLED（doc-comment にも明記）。→ BY-DESIGN (B-4) / 法的妥当性は UNRESOLVED (U-1)。
- 本スライスは除算 1 操作の bounded L4 モデルであり、課税標準・評価額算出・適用関係は対象外。→ BY-DESIGN (B-5)。

### AR-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・誤転記・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、needle 不良、反例、公理依存はいずれも検出されなかった。

#### BY-DESIGN — 5 件

- **B-1** `area = 0 → 0` は原文にない防御的センチネル（面積ゼロの土地は存在しない旨を doc-comment が明記）。
- **B-2** 自然数除算（切捨て）を採用。原文は「除して計算した」のみで端数方式を指定しない。
- **B-3** 更地価額の算定方法（法6条6項）を caller-established として外部化。
- **B-4** 面積の単位・測定を外部化。
- **B-5** 単一除算操作の bounded L4 スライス（評価・課税標準の算定は対象外）。

#### UNRESOLVED — 2 件

- **U-1** 端数処理（切捨て / 四捨五入 / 切り上げ）の法的取扱いは pinned art.8 の文言からは決定不可。**人間の法律専門家による確認が必要**。機械的照合の結論（CONFIRMED = 0）には影響しない。
- **U-2** 更地価額の算定方法（法6条6項）および面積測定の法的定義は本 pinned 条文の範囲外。**人間の法律専門家による確認が必要**。機械的照合の結論には影響しない。

### AR-7. 結論・履歴保全

- pinned 原文（art.8 の「…更地の価額を当該土地等の面積で除して計算した…」）から除算を独立抽出し、実装と一致。**発見ゼロ（CONFIRMED = 0）**。
- needle 2/2 FOUND（U+3000 = 0）。反例 0 件。公理依存 0 件（7/7 axiom-free、exit code 0）。
- 既存レビュー履歴 41 件（Batch G〜AQ および `国税徴収法 104の2` セクションを含む）は**すべて保持**。本セクションのみを末尾に連結した。
- 追記後レビュー件数: **`^## .*review` ベースで 42 件**（= 41 + 1、要求の 42 以上を満たす）。coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|独自検証@|Article-pinned)[^\n]*review` ベースでは **41 件**（= 40 + 1、AR を含む）。差 1 件は既存の `国税徴収法 104の2 review` 見出しが ledger regex に一致しないためであり、当該見出しは変更していない。
- 一時ファイル（Windows temp 配下の probe / verify Python 3 本・axioms Lean 1 本・本スクリプト）は削除済み。

> **本レビューは機械的独立照合であり、人間の法律専門家によるレビューではない。** 法的妥当性・適用関係の最終判断は人間に委ねる。本レビューをもって法的レビューが完了したとみなしてはならない。一時ファイルは削除済み。
## Batch AS review (2026-11-22)

- **レビュー日**: 2026-11-22
- **レビュア**: Adversarial Review Agent（形式化担当と独立、cycle-47 の 1 モデル）。担当 STAGING / doc-comment / テストの申告は**根拠にせず**、pinned 原文 JSON から自前で再抽出・再計算して照合した。
- **対象（読み取り専用・変更せず）**: `JapanTaxLaw/PassengerCapacity.lean` / `JapanTaxLaw/PassengerCapacitySpec.lean` / `JapanTaxLaw/PassengerCapacityTests.lean`
- **pinned 一次資料（読み取り専用）**: `data/raw/346CO0000000275_20230101_504CO0000000195.law.json`（law_id `346CO0000000275` / revision `346CO0000000275_20230101_504CO0000000195`、自動車重量税法施行令）。`data/INVENTORY.json` の `raw_snapshot.source_file` も同パスを指すことを確認。
- **CI needle 出所**: `scripts/ci/transcription_audit.py:1779-1783`（`checks()` の cycle-47 エントリ、`kind="file"` / `art=None`、needle 2 本）。
- **手法**: `law_full_text` を CI `text()` と同一ロジックで再帰平坦化し、自前正規化 `re.sub(r"[\s\u3000]+", "", s)` を適用。`MainProvision` 配下で `attr.Num == "4"` の `Article` を 1 件同定し、text-leaf のみを連結して逐語取得。日本語数字は自前パーサで Arabic 変換し、境界は Python / Lean `by decide` で再計算。`#print axioms` は `lake env lean`（v4.35.0）。

### AS-1. 独立原文抽出・照合（「十人以下」= 10 の直接抽出）

pinned art.4 の text-leaf 連結（生・正規化とも 55 文字、U+3000 = 0 個）は次のとおり。

> （乗用自動車の範囲）第四条法第七条第二項第一号に規定する政令で定める自動車は、乗車定員十人以下の自動車とする。

自前抽出（`十人以下` 直前の漢数字を捕獲し自前パーサで変換）:

| 原文の語句 | 捕獲した漢数字 | 独立変換値 | Lean 実装 | 照合 |
|---|---|---:|---|---|
| 「乗車定員**十人以下**の自動車」 | `十` | **10** | `maxPassengers : Nat := 10` | ✅ 一致 |
| 「十人以下」= 境界を含む | `十` | `<= 10`（10 を含む） | `isPassengerCar c = c <= maxPassengers` | ✅ 一致 |

桁違いの明示除外:

- `一`（= 1 人）: 原文の当該位置の文字は「十」であり「一」ではない。自前変換値 1 とは一致しない（`EXCLUDE_ONE = true`）。→ **1 人閾値を明示除外**。
- `百`（= 100 人）: 当該位置に「百」は存在せず、変換値 100 とも一致しない（`EXCLUDE_HUNDRED = true`）。→ **100 人閾値を明示除外**。
- 抽出値は **10 のみ**（`EXACT_TEN = true`）。原文文字列「乗車定員十人以下の自動車」は art.4 正規化テキストに **1 回**出現（count = 1）。

→ 原文から独立に導かれる定員閾値は 10 人・境界 inclusively（`<= 10`）であり、実装と完全一致。**原文との不一致は認められない（CONFIRMED = 0）**。

### AS-2. needle 健全性（CI `checks()` 実文字列 2 本を自前正規化原文で検証）

`checks()` の当該エントリに埋め込まれた 2 本を手打ちせず import で取得し、自前で平坦化・正規化した pinned 原文（全文 5,187 文字、生 5,196 文字・生の U+3000 = 9 個を正規化で除去）に対して `.find()` / `.count()` を実行した。art.4 正規化テキスト（55 文字）に対しても併せて照合した。

| # | CI needle（実文字列） | needle 内 U+3000 | 自前正規化全文 | 全文 count | art.4 正規化 | 判定 |
|---|---|---:|---|---:|---|---|
| 1 | `乗車定員十人以下の自動車` | 0 | FOUND | 1 | FOUND | OK |
| 2 | `乗用自動車の範囲）第四条` | 0 | FOUND | 1 | FOUND | OK |

- U+3000: needle 2 本とも **0 個**。正規化原文も 0 個。
- **needle 健全性: 2/2 FOUND（MISS 0、いずれも count = 1 で一意）**。転記乖離・needle 腐敗は検出されず。

### AS-3. 反例探索

`isPassengerCar` は `capacity <= maxPassengers`（`maxPassengers = 10`）で、境界 10 を含む。指定の 3 点を独立に構成し `lake env lean` 上で `by decide`（kernel reduction）実行した。

| 反例 | 期待値 | 独立判定 | Lean 実行結果 | 判定 |
|---|---:|---|---:|---|
| `isPassengerCar 9` | true | 9 <= 10 → true | true | PASS |
| `isPassengerCar 10`（境界） | true | 10 <= 10 → true | true | PASS |
| `isPassengerCar 11` | false | 11 <= 10 → false | false | PASS |
| `isPassengerCar 0` | true | 0 <= 10 → true | true | PASS（Smoke） |
| `isPassengerCar 100` | false | 100 <= 10 → false | false | PASS（桁違い側のガード） |
| `agreePassengerCapacity` | true | [0,1,9,10,11,100] で impl ≡ spec | true | PASS |

反例による実装の反証は失敗（実装は反例に耐えた）。**反例件数: 0（ゼロ）**。なお「定員 10 人以下」という数値判定だけで法的な該当性が決まるかは AS-6 の U-1 / U-2 で保留する。

### AS-4. 公理監査

一時 Lean ファイル（`C:\Users\junny\AppData\Local\Temp\opencode\as_axioms.lean`）を作成し、3 モジュールの名前付き宣言および自己構成の境界定理計 **8 件**に `#print axioms` を実行（`lake env lean`、toolchain `leanprover/lean4:v4.35.0`、exit code **0**）。

| 宣言 | `#print axioms` 結果 |
|---|---|
| `JapanTaxLaw.PassengerCapacity.maxPassengers` | does not depend on any axioms |
| `JapanTaxLaw.PassengerCapacity.isPassengerCar` | does not depend on any axioms |
| `JapanTaxLaw.PassengerCapacity.specPassenger` | does not depend on any axioms |
| `JapanTaxLaw.PassengerCapacity.agreePassengerCapacity` | does not depend on any axioms |
| `as_ce9` / `as_ce10` / `as_ce11` / `as_agree` | いずれも does not depend on any axioms |

`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` への依存 **0 件**、8/8 axiom-free。監査用一時ファイルは削除済み。

### AS-5. 未形式化範囲の確認

- doc-comment は「法7条2項1号の他の要件、自動車の用途・構造の認定は NOT MODELLED」「本スライスは乗車定員 10 人以下の数値判定のみを扱う」と明記。→ **用途・構造認定の未形式化を確認**（BY-DESIGN B-3 / B-4）。
- 本モデルは法的レビューを提供しない旨も doc-comment に明記。
- 車両の実際の定員如何・認定方法・法7条2項1号側の要件との適用関係は本 pinned art.4 の文言だけでは確定できない（UNRESOLVED U-1 / U-2）。

### AS-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 4 件

- **B-1** 「十人以下」の境界 10 を含む `<=`（`maxPassengers = 10`）は原文どおりの Nat 定式。0 人も全関数として受理するが、原文は人数で負は概念外（防御的正当化）。
- **B-2** CI needle の正規化（U+3000 除去）は転記監査の仕様であり、モデル値・原文忠実性に影響しない。
- **B-3** 乗車定員 10 人以下の数値判定のみの bounded L4 スライス。課税標準・税額・適用関係は対象外（doc-comment 明記）。
- **B-4** 法7条2項1号の他の要件・自動車の用途／構造の認定は caller-established / NOT MODELLED（doc-comment 明記）。

#### UNRESOLVED — 2 件

- **U-1** 「自動車の用途・構造の認定」および「乗用自動車」の法的定義・認定方法は、pinned art.4 の文言のみからは決定不能。**人間の法律専門家による確認が必要**。数値一致（CONFIRMED = 0）には影響しない。
- **U-2** 法第七条第二項第一号の他の要件との適用関係（「政令で定める自動車」の範囲全体）は本スライスの射程外。pinned 原文のみでは決定不能で、**人間の法律専門家による確認が必要**。機械的照合の結論には影響しない。

### AS-7. 結論・履歴保全

- pinned 原文（art.4 の「乗車定員十人以下の自動車」）から「十人以下」= 10 を独立抽出し、桁違い（1 人 / 100 人）を明示除外のうえ実装と照合。**発見ゼロ（CONFIRMED = 0）**。
- needle 2/2 FOUND（U+3000 = 0、count 各 1）。反例 0 件。公理依存 0 件（8/8 axiom-free、exit code 0）。
- 用途・構造認定の未形式化を確認（B-3 / B-4、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 42 件（Batch G〜AR 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数: **`^## .*review` で 43 件**（要求の 43 以上を満たす）。coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|Article-pinned)[^\n]*review` ベースでは **42 件**（差 1 件は既存の `国税徴収法 104の2 review` が当該 regex に一致しないためで、当該見出しは変更していない）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / Spec / Tests / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。一時ファイル（検証 Python 3 本・出力 1 本・axioms Lean 1 本）は削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・漢数字の独立抽出・needle `.find()` 検証・境界値の kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。
## Batch AT review (2026-11-22)

- **レビュー日**: 2026-11-22
- **レビュア**: Adversarial Review Agent（形式化担当と独立、cycle-49 の 1 モデル）。担当 STAGING / doc-comment / テストの申告は**根拠にせず**、pinned 原文 JSON から自前で再抽出・再計算して照合した。
- **対象（読み取り専用・変更せず）**: `JapanTaxLaw/PowerDevelopmentTaxRate.lean`
- **pinned 一次資料（読み取り専用）**: `data/raw/349AC0000000079_20250601_504AC0000000068.law.json`（law_id `349AC0000000079` / revision `349AC0000000079_20250601_504AC0000000068`、電源開発促進税法）。`data/INVENTORY.json` の `raw_snapshot.source_file` が同パスを指すことも独立確認。
- **CI needle 出所**: `scripts/ci/transcription_audit.py:1785-1789`（`checks()` の cycle-49 エントリ、`kind="file"` / `art=None`、needle 2 本）。
- **手法**: `law_full_text` を CI `text()` と同一ロジックで自前再帰平坦化し、自前正規化 `re.sub(r"[\s\u3000]+", "", s)` を適用。`MainProvision` 配下で `attr.Num == "6"` の `Article` を 1 件同定し、text-leaf のみを連結して逐語取得。日本語数字は自前パーサ（百/十/一 の位取り）で Arabic 変換し、境界・桁違い除外は自前判定した。税額の 4 点は `lake env lean` 上で `by decide`（kernel reduction）実行。`#print axioms` は同 v4.35.0。

### AT-1. 独立原文抽出・照合（「三百七十五円」= 375 / 単位「千キロワット時」）

pinned art.6 の text-leaf 連結（生・正規化とも 44 文字、U+3000 = 0 個）は次のとおり。

> （税率）第六条電源開発促進税の税率は、販売電気千キロワット時につき、三百七十五円とする。

自前抽出（`につき、` と `円とする` の間を捕獲し自前パーサで変換）:

| 原文の語句 | 捕獲した漢数字 | 独立変換値 | Lean 実装 | 照合 |
|---|---|---:|---|---|
| 「販売電気**千キロワット時**につき」 | （単位トークン） | 千キロワット時 = 1,000 kWh/区分 | `ratePerThousandKWh : Money := 375` の区分名 | ✅ 一致 |
| 「**三百七十五円**とする」 | `三百七十五` | **375** | `ratePerThousandKWh = 375` | ✅ 一致 |
| 税額の算定形 | 375 円 × 千キロワット時数 | `375 * thousandKWh` | `taxYen (thousandKWh) = ratePerThousandKWh * thousandKWh` | ✅ 一致 |

桁違いの明示除外:

- **37.5 円（小数点ずらし）**: 原文当該位置は漢数字「三百七十五」であり「三十七・五」は存在せず、自前変換値 375 ≠ 37.5（`EXCLUDE_37_5 = true`）。→ **37.5 を明示除外**。
- **3,750 円（10 倍）**: 当該位置に「三千七百五十」は存在せず、変換値 375 ≠ 3,750（`EXCLUDE_3750 = true`）。→ **3,750 を明示除外**。
- 抽出値は **375 のみ**（`EXACT_375 = true`）。原文フレーズ「販売電気千キロワット時につき、三百七十五円とする」は art.6 正規化テキストに **1 回**、自前正規化全文（9,436 文字）にも **1 回**出現（count = 1、一意）。
- 単位「千キロワット時」は原文に逐語存在し、`ratePerThousandKWh` / `taxYen` の引数 `thousandKWh`（千キロワット時数）と対応。kWh 単位の取り違え（例: 1 kWh あたり 375 円）は原文「千キロワット時につき」と矛盾するため除外。

→ 原文から独立に導かれる税率は **375 円/千キロワット時**、税額は **375 × 千キロワット時数**であり、実装と完全一致。**原文との不一致は認められない（CONFIRMED = 0）**。

### AT-2. needle 健全性（CI `checks()` 実文字列 2 本を自前正規化原文で検証）

`checks()` の当該エントリに埋め込まれた 2 本を手打ちせず import で取得し、自前で平坦化・正規化した pinned 原文（自前正規化全文 9,436 文字、生 9,464 文字・生の U+3000 = 28 個を正規化で除去）に対して `.find()` / `.count()` を実行した。art.6 正規化テキスト（44 文字）に対しても併せて照合した。

| # | CI needle（実文字列） | needle 内 U+3000 | 自前正規化全文 | 全文 count | art.6 正規化 | art.6 count | 判定 |
|---|---|---:|---|---:|---|---:|---|
| 1 | `販売電気千キロワット時につき、三百七十五円とする` | 0 | FOUND | 1 | FOUND | 1 | OK |
| 2 | `電源開発促進税の税率は` | 0 | FOUND | 2 | FOUND | 1 | OK |

- U+3000: needle 2 本とも **0 個**。自前正規化原文も 0 個（生 28 個は正規化で除去）。
- **needle 健全性: 2/2 FOUND（MISS 0）**。needle 2 は全文で count = 2（校正表記の重複）だが art.6 内では count = 1 で一意。needle 1 は全文・art.6 いずれも count = 1。転記乖離・needle 腐敗は検出されず。

### AT-3. 反例探索

`taxYen k = ratePerThousandKWh * k = 375 * k`（`ratePerThousandKWh = 375`）。指定の 4 点を独立に構成し `lake env lean` 上で `by decide`（kernel reduction）実行した。

| 反例 | 期待値 | 独立判定 | Lean 実行結果 | 判定 |
|---|---:|---|---:|---|
| `taxYen 0` | 0 | 375 × 0 = 0 | 0 | PASS |
| `taxYen 1` | 375 | 375 × 1 = 375 | 375 | PASS |
| `taxYen 2` | 750 | 375 × 2 = 750 | 750 | PASS |
| `taxYen 100` | 37,500 | 375 × 100 = 37,500 | 37,500 | PASS |
| `ratePerThousandKWh` | 375 | 原文 375 と一致 | 375 | PASS |

反例による実装の反証は失敗（実装は反例に耐えた）。**反例件数: 0（ゼロ）**。なお販売電気の範囲・課税標準の確定は AT-5 の U-1 / U-2 で保留する。

### AT-4. 公理監査

一時 Lean ファイル（`C:\Users\junny\AppData\Local\Temp\opencode\at_axioms.lean`）を作成し、2 つの名前付き宣言および自己構成の反例定理 5 件（計 **7 件**）に `#print axioms` を実行（`lake env lean`、toolchain `leanprover/lean4:v4.35.0`、exit code **0**）。

| 宣言 | `#print axioms` 結果 |
|---|---|
| `JapanTaxLaw.PowerDevelopmentTaxRate.ratePerThousandKWh` | does not depend on any axioms |
| `JapanTaxLaw.PowerDevelopmentTaxRate.taxYen` | does not depend on any axioms |
| `at_ce0` / `at_ce1` / `at_ce2` / `at_ce100` / `at_rate` | いずれも does not depend on any axioms |

`Classical.choice` / `sorryAx` / `Quot.sound` / `propext` への依存 **0 件**、7/7 axiom-free。監査用一時ファイルは削除済み。

### AT-5. 未形式化範囲の確認

- doc-comment は「販売電気の定義、課税標準、申告・納付手続は NOT MODELLED」「本スライスは税率定数のみを扱う」と明記。→ **販売電気の定義・課税標準の未形式化を確認**（BY-DESIGN B-3 / B-4）。
- 本モデルは法的レビューを提供しない旨も doc-comment に明記。
- 「販売電気」の定義・範囲、課税標準の算定、art.5（課税標準）との適用関係は本 pinned art.6 の文言だけでは確定できない（UNRESOLVED U-1 / U-2）。

### AT-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、桁違い、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 4 件

- **B-1** 「三百七十五円 / 千キロワット時」を `Money`（Nat）の定数 `ratePerThousandKWh = 375` として定式し、桁違い（37.5 / 3,750）を明示除外した原文忠実な定数化。
- **B-2** CI needle の正規化（U+3000 除去）は転記監査の仕様であり、モデル値・原文忠実性に影響しない（全文生 28 個の U+3000 は正規化で除去）。
- **B-3** 税率定数と `taxYen = 375 × 千キロワット時数` のみの bounded L4 スライス。販売電気の定義・課税標準・申告納付手続は対象外（doc-comment 明記）。
- **B-4** `taxYen 0 = 0` も全関数として受理するが、千キロワット時数は負を概念外とする防御的正当化（原文は販売電力量を想定）。

#### UNRESOLVED — 2 件

- **U-1** 「販売電気」の定義・範囲は、pinned art.6 の文言のみからは決定不能。**人間の法律専門家による確認が必要**。数値一致（CONFIRMED = 0）には影響しない。
- **U-2** 課税標準の算定および申告・納付手続、art.5 との適用関係は本スライスの射程外。pinned 原文のみでは決定不能で、**人間の法律専門家による確認が必要**。機械的照合の結論には影響しない。

### AT-7. 結論・履歴保全

- pinned 原文（art.6 の「販売電気千キロワット時につき、三百七十五円とする」）から「三百七十五」= 375 と単位「千キロワット時」を独立抽出し、桁違い（37.5 / 3,750）を明示除外のうえ実装と照合。**発見ゼロ（CONFIRMED = 0）**。
- needle 2/2 FOUND（U+3000 = 0、needle 1 は全文/art.6 とも count 1、needle 2 は全文 count 2・art.6 count 1）。反例 0 件。公理依存 0 件（7/7 axiom-free、exit code 0）。
- 販売電気の定義・課税標準の未形式化を確認（B-3 / B-4、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 43 件（Batch G〜AS 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数: **`^## .*review` で 44 件**（要求の 44 以上を満たす）。coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|Article-pinned)[^\n]*review` ベースでは **43 件**（差 1 件は既存の `国税徴収法 104の2 review` が当該 regex に一致しないためで、当該見出しは変更していない）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。一時ファイル（検証 Python 3 本・出力 2 本・axioms Lean 1 本・本セクション 1 本）は削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・漢数字の独立抽出・needle `.find()` 検証・税額の kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

---

## Batch AU review (2026-11-22)

- **レビュー日**: 2026-11-22
- **レビュア**: Adversarial Review Agent（形式化担当と独立、cycle-50 の 1 モデル）。担当 STAGING / doc-comment / Spec / Tests の申告は**根拠にせず**、pinned 原文 JSON から自前で再抽出・再計算して照合した。
- **対象（読み取り専用・変更せず）**: `JapanTaxLaw/ForestAreaRounding.lean`（参照のみで `ForestAreaRoundingSpec.lean` / `ForestAreaRoundingTests.lean` も確認）。
- **pinned 一次資料（読み取り専用）**: `data/raw/431M60000008040_20261021_508M60000008119.law.json`（law_id `431M60000008040` / revision `431M60000008040_20261021_508M60000008119`、森林環境税施行規則）。`data/INVENTORY.json` の `raw_snapshot.source_file` および `current_revision` が同値であることを独立確認。
- **CI needle 出所**: `scripts/ci/transcription_audit.py:1791-1795`（`checks()` の cycle-50 エントリ、`kind="file"` / `art=None`、needle 2 本）。
- **手法**: `law_full_text` を CI `text()` と同一の再帰ロジックで自前平坦化し、自前正規化 `re.sub(r"[\s\u3000]+", "", s)` を適用。`MainProvision` 配下の `Article` 7 件を走査し、`ArticleTitle == "第四条"` の 1 件を同定して text-leaf を連結。桁違い・恒等関数・境界誤りは `lake env lean` 上で自前構成の反例定理（`by decide` / kernel reduction）により攻撃した。

### AU-1. 独立原文抽出（「一ヘクタール未満の端数を四捨五入」の直接抽出）

pinned art.4 の正規化テキスト（88 文字、U+3000 = 0 個。モジュール doc-comment の「88 chars」とも一致）は次のとおり。

> （端数計算）第四条第一条の三の規定により私有林人工林の面積を補正する場合において、同条の規定により補正された後の数に一ヘクタール未満の端数があるときは、その端数を四捨五入する。

自前抽出の結果:

| 項目 | 独立抽出結果 |
|---|---|
| 対象条 | `MainProvision` 配下 `Article` 7 件中、`ArticleTitle == "第四条"` の 1 件（見出し「（端数計算）」） |
| 原文フレーズ | 「補正された後の数に**一ヘクタール未満の端数があるときは、その端数を四捨五入する**。」 |
| 生テキスト長 / 正規化長 | 5,238 / 5,230 文字（生の U+3000 = 8 個を正規化で除去 → 0 個） |
| フレーズ出现回数 | art.4 正規化テキスト内 **1 回**、自前正規化全文内 **1 回**（一意） |
| タスク引用文との照合 | タスク提示の「…補正された後の数に一ヘクタール未満の端数があるときは、その端数を四捨五入する。」は art.4 の連続部分文字列として**逐語一致** |

→ 原文から「一ヘクタール未満の端数」を **0.5ha（= 5/10ha）を境界とする四捨五入（端数 5 以上を繰上、4 以下を切捨て）** と独立に読み取れる。1/10ha 単位整数 `t` に対する定式は `roundHa(t) = (t + 5) / 10`（`+5` が 0.5ha の半端境界、`/10` が tenths→ha の単位変換）であり、これは担当実装の定義本文 `(tenths + 5) / 10` と**逐語一致**する（桁違い / 境界定数の誤りなし）。

### AU-2. 恒等関数でないことの厳格検証（最重要攻撃）

実装が `roundHa(t) = t`（恒等関数）に退化していないかを、モジュール / Spec / Tests の例を**一切使わず**自前構成の定理で攻撃した（いずれも `by decide`、kernel reduction）。

| 攻撃 | 期待 | 自立計算 | Lean 結果 | 判定 |
|---|---|---|---|---|
| `roundHa 4` | 0.4ha → 0 | (4+5)/10 = 0 | 0 | PASS |
| `roundHa 5` | 0.5ha → 1（繰上） | (5+5)/10 = 1 | 1 | PASS |
| `roundHa 4 ≠ roundHa 5` | 境界で値が変わる | 0 ≠ 1 | 成立 | PASS |
| `roundHa 4 ≠ 4` | 恒等なら 4 だが 0 | 成立 | 成立 | PASS |
| `roundHa 5 ≠ 5` | 恒等なら 5 だが 1 | 成立 | 成立 | PASS |
| `¬ (∀ t : Nat, roundHa t = t)` | 全域で恒等でない | t=4 で反証 | 成立 | PASS |

→ **`roundHa(4) = 0` と `roundHa(5) = 1` は異なる**。実装は恒等関数ではなく、0.5ha 境界で実際に丸めが発生している（**恒等関数化という最も危険な退化を明示的に除外**）。桁違いも除外: 定数は `+5`（0.5ha）と `/10`（1/10ha→1ha）であり、`+50` / `/100` 等の 10 倍誤りは存在しない。

### AU-3. needle 健全性（CI `checks()` 実文字列 2 本を自前正規化原文で検証）

`checks()` の cycle-50 エントリの 2 本を**手打ちせず import で取得**し、自前で平坦化・正規化した pinned 原文（正規化 5,230 文字）に対して `.find()` / `.count()` を実行した。

| # | CI needle（実文字列） | 長 | needle 内 U+3000 | 自前正規化原文 | count | 位置 | 判定 |
|---|---|---:|---:|---|---:|---:|---|
| 1 | `一ヘクタール未満の端数があるときは、その端数を四捨五入する` | 29 | 0 | FOUND | 1 | 1956 | OK |
| 2 | `端数計算）第四条` | 8 | 0 | FOUND | 1 | 1899 | OK |

- **U+3000**: needle 2 本とも **0 個**。原文は生で 8 個だが自前正規化で 0 個（needle は正規化済み文字列として埋め込まれている）。
- **needle 健全性: 2/2 FOUND（MISS 0）**。両 needle は正規化全文で一意（count = 1）。転記乖離・needle 腐敗は検出されず。needle 2 は条の見出し断片でありモデル値ではない（位置的誤配置ではない）。

### AU-4. 反例探索

指定の 7 点に加え、自前で境界点を構成して `lake env lean` / `by decide` で実行した。

| 反例 | 期待値（独立計算） | Lean 実行結果 | 判定 |
|---|---:|---:|---|
| `roundHa 0` | (0+5)/10 = 0 | 0 | PASS |
| `roundHa 4` | (4+5)/10 = 0 | 0 | PASS |
| `roundHa 5` | (5+5)/10 = 1 | 1 | PASS |
| `roundHa 14` | (14+5)/10 = 1 | 1 | PASS |
| `roundHa 15` | (15+5)/10 = 2 | 2 | PASS |
| `roundHa 25` | (25+5)/10 = 3 | 3 | PASS |
| `roundHa 100` | (100+5)/10 = 10 | 10 | PASS |
| `roundHa 9`（自前追加） | 0.9ha → 1 | 1 | PASS |
| `roundHa 10`（自前追加） | 1.0ha → 1 | 1 | PASS |
| `roundHa 49`（自前追加） | 4.9ha → 5 | 5 | PASS |
| `roundHa 50`（自前追加） | 5.0ha → 5 | 5 | PASS |

- 自前反例の 1 つで `roundHa 9 = 0` という予想を立てたが kernel に棄却され、`0.9ha → 1ha` として `roundHa 9 = 1` が正しいことを確認した（**これは実装バグではなく自前予想の誤り**。半端 5 以上の繰上という定式と整合）。
- **反例による実装の反証は失敗（実装は全反例に耐えた）。反例件数: 0（ゼロ）。**

### AU-5. 公理監査

一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\au_axioms.lean` を作成し、`roundHa` および AU-2 / AU-4 の自前構成反例定理 15 件（計 **16 宣言**）に `#print axioms` を実行（`lake env lean`、exit code **0**）。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 16（`roundHa` + `au_ce0/4/5/14/15/25/100`、`au_not_id4/5`、`au_boundary`、`au_not_identity`、`au_9/10/49/50`） |
| `does not depend on any axioms` | **16/16** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

→ **禁止公理（choice / sorryAx / Quot.sound）および propext への依存はいずれも 0 件。公理監査は合格。** 監査用一時ファイルは削除済み。

### AU-6. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` を原文 art.4 と突き合わせ、以下を確認した。

- **補正係数・算定式の未形式化**: 第1条の3の面積補正そのもの（係数・算定式）は NOT MODELLED と明記。art.4 は「第一条の三の規定により…補正された後の数に…端数があるときは」と**補正後の値を caller-established の入力として受け取る**構造であり、補正係数自体は本条の文言に含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-1）。
- **0.1ha 未在の厳密取扱いの未形式化**: art.4 は「一ヘクタール未満の端数」としか述べず、1/10ha より細かい端数（例 0.05ha）の取扱いは NOT MODELLED と明記。本モデルは 1/10ha 単位整数を前提とし、それ未満の精度での丸め順序・補正後数値の桁数を形式化しない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- 本モデルは法的レビューを提供しない旨も明記。

### AU-7. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・恒等関数化・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、恒等関数化、桁違い、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 4 件

- **B-1** 「一ヘクタール未満の端数を四捨五入」を 1/10ha 単位整数に対する `(t+5)/10`（0.5ha 以上繰上）として定式化し、恒等関数化・桁違い（10 倍誤り）・境界誤りを明示除外した原文忠実な定数化。
- **B-2** CI needle の正規化（U+3000 除去）は転記監査の仕様であり、モデル値・原文忠実性に影響しない（原文生 8 個の U+3000 は正規化で除去、needle 内は 0 個）。
- **B-3** bounded L4 スライスとして端数計算関数のみを提供。第1条の3の補正係数・算定式、および 0.1ha より細かい端数の厳密取扱いは NOT MODELLED（doc-comment 明記）。法的取扱いは U-1 / U-2 に委ねる。
- **B-4** `Nat` 上の全関数として `roundHa 0 = 0` も受理するが、面積は負を概念外とする防御的正当化（原文は私有林人工林の面積を想定）。

#### UNRESOLVED — 2 件

- **U-1** 第1条の3の面積補正（係数・算定式）と art.4 との適用関係は、pinned art.4 の文言のみからは決定不能。補正係数の未形式化は doc-comment で申告済みだが、その法的妥当性・算定方法は**人間の法律専門家による確認が必要**。数値一致（CONFIRMED = 0）には影響しない。
- **U-2** 0.1ha より細かい端数（例 0.05ha）の厳密な取扱い、および補正後数値の精度・丸め順序は、原文「一ヘクタール未満の端数」のみでは決定不能。**人間の法律専門家による確認が必要**。機械的照合の結論には影響しない。

### AU-8. 結論・履歴保全

- pinned art.4 の「補正された後の数に一ヘクタール未満の端数があるときは、その端数を四捨五入する。」を独立抽出し、1/10ha 単位の `(t+5)/10` 定式と照合。**発見ゼロ（CONFIRMED = 0）**。
- 恒等関数攻撃（`roundHa 4 = 0` ≠ `roundHa 5 = 1`、`¬∀t. roundHa t = t`）により退化を明示除外。needle 2/2 FOUND（U+3000 = 0、いずれも count 1）。反例 0 件。公理依存 0 件（16/16 axiom-free、exit code 0）。
- 補正係数・0.1ha 未在の厳密取扱いの未形式化を確認（B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 44 件（Batch G〜AT 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数: `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review`（coverage ledger regex）で **45 件**、広義 `^## .*review` でも **45 件**（要求の 45 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。一時ファイル（検証 Python 3 本・出力 1 本・axioms Lean 1 本・本セクション 1 本）は削除済み。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・needle `.find()` 検証・恒等関数攻撃・境界値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch AV review (2026-11-22) — 不当廉売関税率政令 art.2 / AntiDumpingRate308.lean（cycle-51 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、日本語数字を自前パーサで Arabic 変換し、needle は自前正規化原文で検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/AntiDumpingRate308.lean`、`AntiDumpingRate308Spec.lean`、`AntiDumpingRate308Tests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため `.lake/build` にビルド成果物（git 無視）が生成されたが、ソース・データは未変更。
- **一次資料（pinned・改変禁止）**: law_id `503CO0000000065` / revision `503CO0000000065_20260709_508CO0000000223`（改正法 `508CO0000000223`、施行 2026-07-09、`current_revision_status = CurrentEnforced`）。実ファイル `data/raw/503CO0000000065_20260709_508CO0000000223.law.json`、size **10,664 bytes**、SHA-256 **`1545BE35FE52B629C7336B1F4A55D01BBA8FD544332315B89812DB75424C3320`**。`INVENTORY.json` の `raw_snapshot.source_file` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-51 エントリ（line 1806-1810、`kind="file"`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AV-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`ArticleTitle == "第二条"` の string leaf を平坦化して抽出した（`MainProvision` 配下の `Article Num="2"` は 1 ノードのみ）。

 | 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
 |---|---|---|:---:|
 | law_id / revision | `503CO0000000065` / `503CO0000000065_20260709_508CO0000000223` | 同一 | OK |
 | 原文逐語（leaf） | 46 文字 | （引用は末尾一致） | OK |
 | Article 2 flat 長 | **53** | 53 chars | OK |
 | U+3000 数（Article 2） | **0** | 0 | OK |

原文逐語（独立抽出・leaf）:

`特定貨物又は暫定不当廉売関税賦課貨物に課する不当廉売関税の税率は、三十・八パーセントとする。`

→ モジュール doc-comment の引用「…不当廉売関税の税率は、三十・八パーセントとする。」は、先頭の主体句を `…` で略したものであり、**率リテラル部分は一字違わず一致**（AV-5 で主体句の取扱いを記録）。

**率の独立換算と桁違いの明示除外**:

| 原文リテラル | 出現数 | 自前パーサ変換 | 千分率 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|---|
| `三十・八パーセント` | 1 | 三十 = 30, 八 = 8 → **30.8%** | 30.8 × 10 = **308/1000** | `ratePerMille = 308` | **3.08%（= 308/10000）を明示除外**／**308%（= 308000/1000）を明示除外** |

- 桁違い候補の原文リテラル `三・〇八パーセント`（3.08%）および `三百八パーセント`（308%）は pinned 原文に**いずれも存在しない**ことを確認。
- `dutyYen(value) = value * ratePerMille / 1000 = value * 308 / 1000`（Nat 整数除算・切捨て）は、千分率 308/1000 をそのまま適用する定式であり、率の表現と整合。**恒等関数化（`ratePerMille = 1000` 等）でもない。**

### AV-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

 | # | CI needle（実文字列） | 長 | U+3000 | count | 正規化前後 | leaf offset | FOUND |
 |---|---|---:|---:|---:|:---:|---:|:---:|
 | N1 | `三十・八パーセント` | 9 | 0 | 1 | 同一（冪等） | 33 | **FOUND** |
 | N2 | `不当廉売関税の税率は` | 10 | 0 | 1 | 同一（冪等） | 22 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、正規化前後で同一。Article 2 leaf 自体の U+3000 も **0**。
- CI の `kind="file"` に倣い、pinned 原文全体を平坦化・正規化した haystack でも **2/2 FOUND**。原文全体の生 U+3000 は 3 個だが、CI 正規化 `[\s　]+` 除去により needle 照合には影響しない。
- N1 は率リテラルそのもの、N2 は「不当廉売関税の税率は」という税率節の導入部を直接抑えており、needle 2 本は同一条文内の異なる位置を指す（非重複）。

### AV-3. 反例探索

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で `JapanTaxLaw.AntiDumpingRate308` / `AntiDumpingRate308Spec` を import し、公称値を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**）。

| 公称反例候補 | 独立計算 | Lean 結果 (`by decide`) | 反例 |
|---|---:|---:|:---:|
| `dutyYen 0` | 0 | 0 | なし |
| `dutyYen 1000` | 308 | 308 | なし |
| `dutyYen 2000` | 616 | 616 | なし |
| `dutyYen 10000` | 3080 | 3080 | なし |

- 補助的に独立参照式 `specDuty(v) = v * 308 / 1000` との一致（`agreeAntiDumpingRate308 = true`）も `by decide` で確認。
- 恒等関数攻撃（例: `dutyYen 1000 = 1000` となるはず、という予想）は `308 ≠ 1000` として棄却され、率定数 308 が実際に適用されていることを確認。
- **反例検出数: ゼロ（0）。** 率・定数・計算式の一致は完全。

### AV-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **8 宣言**に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- モデル側 named def 4 件: `JapanTaxLaw.AntiDumpingRate308.ratePerMille` / `dutyYen` / `specDuty` / `agreeAntiDumpingRate308`
- 自前構成の端点定理 4 件: `av_duty_0` / `av_duty_1000` / `av_duty_2000` / `av_duty_10000`

 | 監査項目 | 結果 |
 |---|---|
 | 走査宣言数 | 8 |
 | `does not depend on any axioms` | **8/8** |
 | `Classical.choice` | **0 件** |
 | `sorryAx` | **0 件** |
 | `Quot.sound` | **0 件** |
 | `propext` | **0 件** |

- さらに `AntiDumpingRate308.lean` の静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**。
- → **禁止公理（choice / sorryAx / Quot.sound）および propext への依存はいずれも 0 件。公理監査は合格。**

### AV-5. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **特定貨物認定・課税価格算定・原産地判定の未形式化**: doc-comment に「特定貨物の認定、課税価格の算定、原産地判定は NOT MODELLED。本スライスは税率定数のみを扱う。」と明記。pinned 第一条は「第一号に掲げる貨物であって、第二号に掲げる国を原産地とするもののうち、第三号に掲げる期間内に輸入されるもの（以下「特定貨物」という。）には、関税定率法第八条第一項の規定により、不当廉売関税を課する。」と対象を外部法令 reference で定義しており、当該認定ロジックは本スライスに含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- **主体句の省略について**: doc-comment の原文引用は先頭に `…` を付け、主体「特定貨物又は暫定不当廉売関税賦課貨物に課する」を略している。pinned 第二条の主体は「特定貨物**又は暫定不当廉売関税賦課貨物**」の両方であり、税率 30.8% は両者に共通のリテラルである。したがって率定数 308/1000 自体に影響はないが、**両主体の区分・認定も本スライスでは未形式化**であることを記録する（U-2）。
- 本モデルは法的レビューを提供しない旨も明記されている。

### AV-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・恒等関数化・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、恒等関数化、桁違い、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 4 件

- **B-1 率リテラルの原文忠実な定数化**: `三十・八` → 30.8% → 308/1000 を自前パーサで抽出し、`ratePerMille = 308` および `dutyYen = value * 308 / 1000` と一致。3.08%（308/10000）・308%（308000/1000）の桁違いを明示除外した設計。
- **B-2 CI needle の正規化**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 2 leaf も 0、原文全体の生 3 個は正規化で除去）。2/2 FOUND。
- **B-3 bounded L4 スライス**: 税率定数と `dutyYen` のみを提供し、特定貨物認定・課税価格算定・原産地判定・暫定不当廉売関税賦課貨物の区分は NOT MODELLED（doc-comment 明記、AV-5 で独立確認）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 53 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。先頭の `…` は主体句の省略であり率リテラルの不一致ではない。

#### UNRESOLVED — 2 件

- **U-1 端数処理（floor）の法的正当性**: pinned 第二条は税率 30.8% のみを定め、課税価格が 1000 で割り切れない場合の端数（例: 1 円 × 308/1000 → 0 円）の取扱いを明示しない。`dutyYen` の Nat 切捨てはモデル上の選択として透明だが、**不当廉売関税の端数処理が本当に切捨てであるかは pinned 原文からは決定不能**。**人間の法律専門家による確認を要する**。率・定数の一致（CONFIRMED = 0）には影響しない。
- **U-2 適用対象の認定・課税価格算定の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、第一条が参照する関税定率法第八条第一項による特定貨物の認定手続、第二条の「特定貨物又は暫定不当廉売関税賦課貨物」の区分、および課税価格の算定方法は、pinned 原文のみでは決定不能。**人間の法律専門家を要する**。率リテラルと価格グリッドの一致（CONFIRMED = 0）には影響しない。

### AV-7. 結論・履歴保全

- pinned 第二条の「三十・八パーセント = 308/1000」を独立抽出し、Lean 実装と照合。**桁違いゼロ**（3.08% / 3080/1000 を明示除外）。needle 2/2 FOUND（needle 内 U+3000 = 0、Article 2 leaf も 0）、反例 0 件、公理依存 0 件（8/8 axiom-free、exit code 0）。
- 特定貨物認定・課税価格算定・原産地判定の未形式化を確認（B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **45 件**（Batch G〜AU 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **46 件**（45 → 46、要求の 46 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前日本語数字パーサ・needle 自前正規化検証・端点値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。
## Batch AW review (2026-11-22) — 不当廉売関税率政令 art.2 / AntiDumpingRate694.lean（cycle-52 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、日本語数字を自前パーサで Arabic 変換し、needle は自前正規化原文で検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/AntiDumpingRate694.lean`、`JapanTaxLaw/AntiDumpingRate694Spec.lean`、`JapanTaxLaw/AntiDumpingRate694Tests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため `.lake/build` にビルド成果物（git 無視）が生成されたが、ソース・データは未変更。
- **一次資料（pinned・改変禁止）**: law_id `426CO0000000415` / revision `426CO0000000415_20150425_427CO0000000215`（改正法 `427CO0000000215`、施行 2015-04-25、`current_revision_status = CurrentEnforced`、法名「トルエンジイソシアナートに対して課する不当廉売関税に関する政令」）。実ファイル `data/raw/426CO0000000415_20150425_427CO0000000215.law.json`、size **9,845 bytes**、SHA-256 **`6F21739583F062C6C0F27E26C0B7504D74DF2E5843D93BD17D2CE1A36FB31C19`**。`data/INVENTORY.json` の `current_revision.law_revision_id` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-52 エントリ（line 1830-1834、`kind="file"`、law_id `426CO0000000415`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AW-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査した（`MainProvision` 配下の `Article` は Num 1〜5 の計 5 ノード、うち `Num="2"` は **1 ノードのみ**）。Article 2 の string leaf は 3 枚:

| leaf | 長 | 内容 |
|---|---:|---|
| `ArticleCaption` | 4 | `（税率）` |
| `ArticleTitle` | 3 | `第二条` |
| `Sentence` | 47 | `特定貨物又は暫定不当廉売関税賦課貨物に課する不当廉売関税の税率は、六十九・四パーセントとする。` |

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `426CO0000000415` / `426CO0000000415_20150425_427CO0000000215` | 同一 | OK |
| 原文逐語（Sentence leaf） | **47 文字** | （引用は末尾一致） | OK |
| Article 2 flat 長（3 leaf 連結） | **54** | 54 chars | OK |
| U+3000 数（Article 2 flat） | **0** | 0 | OK |

原文逐語（独立抽出・leaf）:

`特定貨物又は暫定不当廉売関税賦課貨物に課する不当廉売関税の税率は、六十九・四パーセントとする。`

→ モジュール doc-comment の引用「…不当廉売関税の税率は、六十九・四パーセントとする。」は、先頭の主体句を `…` で略したものであり、**率リテラル部分は一字違わず一致**（主体句の取扱いは AW-5 で記録）。

**率の独立換算と桁違いの明示除外**:

| 原文リテラル | 出現数（原文全体） | 自前パーサ変換 | 千分率 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|---|
| `六十九・四パーセント` | **1** | 六十九 = 6×10+9 = 69, ・ = 小数点, 四 = 4 → **69.4%** | 69.4 × 10 = **694/1000** | `ratePerMille = 694` | **6.94%（= 694/10000 = 69.4/1000）を明示除外**／**694%（= 6940/1000）を明示除外** |

- 自前日本語数字パーサの独立結果: `六十九` → **69**（十の位 6 と一の位 9）、小数部 `四` → **4** → **69.4%** → **694/1000**。
- 桁違い候補の原文リテラル `六・九四パーセント`（6.94%）、`六百九十四パーセント`（694%）、および `六十九パーセント`（69%）は pinned 原文に**いずれも 0 回**であることを確認（除外の根拠）。
- `dutyYen(value) = value * ratePerMille / 1000 = value * 694 / 1000`（`Money = Nat` 整数除算・切捨て）は、千分率 694/1000 をそのまま適用する定式であり、率の表現と整合。**恒等関数化（`ratePerMille = 1000` 等）でもない**（AW-3 で数値的に棄却）。

### AW-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列） | 長 | U+3000 | 正規化前後 | 54 文字 flat 内 offset | count | FOUND |
|---|---|---:|---:|:---:|---:|---:|:---:|
| N1 | `六十九・四パーセント` | 10 | 0 | 同一（冪等） | 40 | 1 | **FOUND** |
| N2 | `不当廉売関税の税率は` | 10 | 0 | 同一（冪等） | 29 | 1 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、CI 正規化前後で同一（冪等）。Article 2 flat 自体の U+3000 も **0**。
- CI の `kind="file"` に倣い、pinned 原文全体（`law_full_text` の全 string leaf 連結、1,499 文字）を平坦化・正規化した haystack でも **N1 / N2 とも count = 1、2/2 FOUND**。原文全体の生 U+3000 は 2 個だが、CI 正規化 `[\s　]+` 除去により needle 照合には影響しない。
- N1 は率リテラルそのもの、N2 は「不当廉売関税の税率は」という税率節の導入部を直接抑えており、needle 2 本は同一条文内の異なる位置（offset 40 と 29）を指す（非重複）。

### AW-3. 反例探索

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で `JapanTaxLaw.AntiDumpingRate694` / `AntiDumpingRate694Spec` / `AntiDumpingRate694Tests` を import し、公称値を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**）。

| 公称反例候補 | 独立計算 `v * 694 / 1000` | Lean 結果 (`by decide`) | 反例 |
|---|---:|---:|:---:|
| `dutyYen 0` | 0 | 0 | なし |
| `dutyYen 1000` | 694 | 694 | なし |
| `dutyYen 2000` | 1388 | 1388 | なし |
| `dutyYen 10000` | 6940 | 6940 | なし |

- 補助的に独立参照式 `specDuty(v) = v * 694 / 1000` との一致（`agreeAntiDumpingRate694 = true`、`[0,1,100,1000,10000]` のグリッド）も `by decide` で確認。
- 恒等関数攻撃（例: `dutyYen 1000 = 1000` となるはず、という予想）は `694 ≠ 1000` として棄却され、率定数 694 が実際に適用されていることを確認。
- **反例検出数: ゼロ（0）。** 率・定数・計算式の一致は完全。

### AW-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **8 宣言**に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- モデル側 named def 4 件: `JapanTaxLaw.AntiDumpingRate694.ratePerMille` / `dutyYen` / `specDuty` / `agreeAntiDumpingRate694`
- 自前構成の端点定理 4 件: `aw_duty_0` / `aw_duty_1000` / `aw_duty_2000` / `aw_duty_10000`

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 8 |
| `does not depend on any axioms` | **8/8** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- さらに 3 モジュール（`AntiDumpingRate694.lean` / `AntiDumpingRate694Spec.lean` / `AntiDumpingRate694Tests.lean`）の静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**（3 モジュールとも）。
- → **禁止公理（choice / sorryAx / Quot.sound）および propext への依存はいずれも 0 件。公理監査は合格。**

### AW-5. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **特定貨物認定・課税価格算定・原産地判定の未形式化**: doc-comment に「特定貨物の認定、課税価格の算定、原産地判定は NOT MODELLED。本スライスは税率定数のみを扱う。」と明記。pinned 第一条は「第一号に掲げる貨物であって、第二号に掲げる国を原産地とするもののうち、第三号に掲げる期間内に輸入されるもの（以下「特定貨物」という。）には、関税定率法（以下「法」という。）第八条第一項の規定により、不当廉売関税を課する。」と対象を外部法令 reference で定義しており、当該認定ロジックは本スライスに含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- **主体句の省略について**: doc-comment の原文引用は先頭に `…` を付け、主体「特定貨物又は暫定不当廉売関税賦課貨物に課する」を略している。pinned 第二条の主体は「特定貨物**又は暫定不当廉売関税賦課貨物**」の両方であり、税率 69.4% は両者に共通のリテラルである。したがって率定数 694/1000 自体に影響はないが、**両主体の区分・認定も本スライスでは未形式化**であることを記録する（U-2）。
- 本モデルは法的レビューを提供しない旨も明記されている。

### AW-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・恒等関数化・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、恒等関数化、桁違い、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 4 件

- **B-1 率リテラルの原文忠実な定数化**: `六十九・四` → 69.4% → 694/1000 を自前パーサで抽出し、`ratePerMille = 694` および `dutyYen = value * 694 / 1000` と一致。6.94%（694/10000）・694%（6940/1000）の桁違いを明示除外した設計。
- **B-2 CI needle の正規化**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 2 flat も 0、原文全体の生 2 個は正規化で除去）。2/2 FOUND。
- **B-3 bounded L4 スライス**: 税率定数と `dutyYen` のみを提供し、特定貨物認定・課税価格算定・原産地判定・暫定不当廉売関税賦課貨物の区分は NOT MODELLED（doc-comment 明記、AW-5 で独立確認）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 54 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。先頭の `…` は主体句の省略であり率リテラルの不一致ではない。

#### UNRESOLVED — 2 件

- **U-1 端数処理（floor）の法的正当性**: pinned 第二条は税率 69.4% のみを定め、課税価格が 1000 で割り切れない場合の端数（例: 1 円 × 694/1000 → 0 円）の取扱いを明示しない。`dutyYen` の Nat 切捨てはモデル上の選択として透明だが、**不当廉売関税の端数処理が本当に切捨てであるかは pinned 原文からは決定不能**。**人間の法律専門家による確認を要する**。率・定数の一致（CONFIRMED = 0）には影響しない。
- **U-2 適用対象の認定・課税価格算定の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、第一条が参照する関税定率法第八条第一項による特定貨物の認定手続、第二条の「特定貨物又は暫定不当廉売関税賦課貨物」の区分、および課税価格の算定方法は、pinned 原文のみでは決定不能。**人間の法律専門家を要する**。率リテラルと価格グリッドの一致（CONFIRMED = 0）には影響しない。

### AW-7. 結論・履歴保全

- pinned 第二条の「六十九・四パーセント = 694/1000」を独立抽出し、Lean 実装と照合。**桁違いゼロ**（6.94% / 6940/1000 を明示除外）。needle 2/2 FOUND（needle 内 U+3000 = 0、Article 2 flat も 0）、反例 0 件、公理依存 0 件（8/8 axiom-free、exit code 0）。
- 特定貨物認定・課税価格算定・原産地判定の未形式化を確認（B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **46 件**（Batch G〜AV 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **47 件**（46 → 47、要求の 47 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない（既存の他エージェントによる無関係な変更は触れていない）。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前日本語数字パーサ・needle 自前正規化検証・端点値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。


## Batch AX review (2026-11-22) — 関税割当数量省令 art.5 / TariffQuotaAmount.lean（cycle-53 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、漢字数字を自前の桁位置パーサで Arabic 変換し、needle は CI と同一の正規化を自前適用して検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/TariffQuotaAmount.lean`、`JapanTaxLaw/TariffQuotaAmountSpec.lean`、`JapanTaxLaw/TariffQuotaAmountTests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため一時 Lean ファイルをプロジェクト外 temp に置き `lake env lean` を実行した（git 無視のビルド成果物が生成された可能性があるが、ソース・データは未変更）。
- **一次資料（pinned・改変禁止）**: law_id `417M60000200012` / revision `417M60000200012_20260401_507M60000200056`（省令「経済連携協定に基づく農林水産省の所掌事務に係る物資の関税割当制度に関する省令」、改正法 `507M60000200056`、施行 **2026-04-01**、`current_revision_status = CurrentEnforced`）。実ファイル `data/raw/417M60000200012_20260401_507M60000200056.law.json`、size **18,591 bytes**、SHA-256 **`650A31721A8AFE75B0490391BDDD2A424410E36A0E3BAF796A41C31049C5588C`**。`data/INVENTORY.json` の `current_revision.law_revision_id` および `raw_snapshot.source_sha256` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-53 エントリ（line 1854-1858、`kind="file"`、law_id `417M60000200012`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AX-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`Num="5"` の 1 ノードを特定して全 string leaf を連結した（計 12 Article を走査）。原文逐語（独立抽出）:

`（関税割当数量）第五条令第二条第十一項の規定により読み替えて適用する同条第五項の農林水産省令で定める数量は、令和八年四月一日から令和九年三月三十一日までの間は八千トンとする。`

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `417M60000200012` / `417M60000200012_20260401_507M60000200056` | 同一 | OK |
| Article 5 flat 長 | **87 文字** | 87 chars | OK |
| U+3000 数（Article 5 flat） | **0** | 0 | OK |

**数量の独立換算と桁違いの明示除外**:

| 原文リテラル | 出現 | 自前桁位置パーサ変換 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|
| `八千` | 1 | 八 = 8 × 千 = 1000 → **8000** | `quotaTons = 8_000`、`specQuota = 8000` | **八百 = 800（下1桁ずらし）を明示除外**／**八万 = 80,000（上1桁ずらし）を明示除外** |

- 自前パーサの独立結果: `八千 → 8000`、`八百 → 800`、`八万 → 80000`。pinned 原文に `"800"` も `"80000"` も**いずれも 0 回**であり、桁違い候補は原文リテラルとして存在しない（除外の根拠）。
- **適用期間の独立抽出**: 原文に `令和八年四月一日` および `令和九年三月三十一日`（いずれも漢字表記）が **FOUND**。doc-comment は「令和8年4月1日〜令和9年3月31日」と**年号文字列（Arabic 数字混入）で保持**しており、原文の漢字表記を逐語引用したものではない。これは doc が明記する「denominated は年号文字列として保持」および「年号→西暦換算・日付算術は NOT MODELLED」に整合する設計であり、数量 8000 の照合に影響しない（AX-5 / B-5）。

### AX-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列, line 1858） | 長 | U+3000 | 正規化前後 | 87 文字 flat 内 offset | count | FOUND |
|---|---|---:|---:|:---:|---:|---:|:---:|
| N1 | `間は八千トンとする` | 9 | 0 | 同一（冪等） | 77 | 1 | **FOUND** |
| N2 | `関税割当数量）第五条` | 10 | 0 | 同一（冪等） | 1 | 1 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、CI 正規化前後で同一（冪等）。Article 5 flat 自体の U+3000 も **0**。
- N1 は数量リテラル「八千」を含む結節句、N2 は条名「関税割当数量）第五条」を直接抑えており、needle 2 本は同一条文内の異なる位置（offset 77 と 1）を指す（非重複）。片方が欠落・改変されていれば即座に 1/2 に落ちる構成であり、needle 健全性は合格。

### AX-3. 反例探索

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で 3 モジュールを import し、公称値を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**、エラー 0 件）。走査した 11 命題:

| 検証命題 | 結果 | 反例 |
|---|---|:---:|
| `quotaTons = 8_000` | true | なし |
| `quotaTons > 0` | true | なし |
| `specQuota = 8_000` | true | なし |
| `agreeTariffQuotaAmount = true` | true | なし |
| `quotaTons ≠ 800` | true | なし（下桁ずらしを棄却） |
| `quotaTons ≠ 80_000` | true | なし（上桁ずらしを棄却） |
| `specQuota ≠ 800` / `specQuota ≠ 80_000` | true | なし |
| `(quotaTons == (8000 : Nat)) = true` | true | なし |

- 独立定式 `specQuota : Nat = 8000` との一致（`agreeTariffQuotaAmount = true`）もカーネル還元で確認。
- **反例検出数: ゼロ（0）。** 数量定数 8000 とその照合は完全。

### AX-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **3 named def** に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- `JapanTaxLaw.TariffQuotaAmount.quotaTons`
- `JapanTaxLaw.TariffQuotaAmount.specQuota`
- `JapanTaxLaw.TariffQuotaAmount.agreeTariffQuotaAmount`

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 3 |
| `does not depend on any axioms` | **3/3** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- さらに 3 モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**（3 モジュールとも）。
- → **禁止公理（choice / sorryAx / Quot.sound）および propext への依存はいずれも 0 件。公理監査は合格。**

### AX-5. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **割当手続・品目特定の未形式化**: doc-comment に「割当の申請・配分手続、品目の特定は NOT MODELLED」と明記。pinned 第五条は「令第二条第十一項の規定により読み替えて適用する同条第五項の農林水産省令で定める数量は…」と数量のみを定め、申請・配分の手続や対象品目の特定は本条文（および本スライス）に含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-1）。
- **年号換算・日付算術の未形式化**: doc-comment に「年号→西暦の換算・日付算術は NOT MODELLED（期間は原文文字列を定数として保持）」と明記。原文は `令和八年四月一日` 〜 `令和九年三月三十一日` と和暦漢字で期間を指定するが、doc は年号文字列として保持するのみで西暦換算・日付計算は行わない。→ 未形式化を確認（BY-DESIGN B-5 / UNRESOLVED U-2）。
- 本モデルは法的レビューを提供しない旨も明記されている。

### AX-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・恒等関数化・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、桁違い（800 / 80000）、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 5 件

- **B-1 数量リテラルの原文忠実な定数化**: `八千` → 8000 を自前桁位置パーサで抽出し、`quotaTons = 8_000` / `specQuota = 8000` と一致。八百（800）・八万（80,000）の桁違いを明示除外した設計。
- **B-2 CI needle の正規化**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 5 flat も 0）。2/2 FOUND。
- **B-3 bounded L4 スライス**: 数量定数とその照合のみを提供し、割当の申請・配分手続、品目の特定は NOT MODELLED（doc-comment 明記、AX-5 で独立確認）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 87 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。原文逐語は数量節全体を引用しており省略による不一致なし。
- **B-5 適用期間の年号文字列保持**: doc は「令和8年4月1日〜令和9年3月31日」と年号文字列（Arabic 数字混入）で記録し、原文の漢字表記（令和八年四月一日〜令和九年三月三十一日）を逐語引用していない。これは「denominated は年号文字列として保持」の設計どおりであり、年号換算・日付算術は NOT MODELLED（要件「適用期間は doc に年号文字列で記録」に整合）。

#### UNRESOLVED — 2 件

- **U-1 割当手続・品目特定の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、第五条が参照する「令第二条第十一項の規定により読み替えて適用する同条第五項」の具体的な割当申請・配分手続および対象品目の特定方法は、pinned 第五条のみでは決定不能。**人間の法律専門家による確認を要する**。数量 8000 の一致（CONFIRMED = 0）には影響しない。
- **U-2 年号→西暦換算・適用期間の日付算術の法的取扱い**: 原文は和暦漢字で期間を指定するが、pinned 原文のみでは令和八年四月一日〜令和九年三月三十一日の西暦換算・期間計算の定義を確定できない（doc は年号文字列保持のみで換算は NOT MODELLED）。**人間の法律専門家を要する**。数量リテラルの一致（CONFIRMED = 0）には影響しない。

### AX-7. 結論・履歴保全

- pinned 第五条の「八千トン = 8000 トン」を独立抽出し、Lean 実装と照合。**桁違いゼロ**（八百 = 800 / 八万 = 80,000 を明示除外、原文に該当リテラル 0 回）。needle 2/2 FOUND（needle 内 U+3000 = 0、Article 5 flat も 0）、反例 0 件、公理依存 0 件（3/3 axiom-free、exit code 0）。適用期間は年号文字列として doc に記録され、年号換算は NOT MODELLED を確認。
- 割当手続・品目特定・年号換算の未形式化を確認（B-3 / B-5、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **47 件**（Batch G〜AW 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **48 件**（47 → 48、要求の 48 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない（既存の他エージェントによる無関係な変更は触れていない）。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前漢字数字パーサ・needle 自前正規化検証・端点値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch AY review (2026-11-22) — 国税審判官等の定数政令 art.2 / TaxJudgeCount.lean（cycle-54 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、漢字数字を自前の桁位置パーサで Arabic 変換し、needle は CI と同一の正規化を自前適用して検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/TaxJudgeCount.lean`、`JapanTaxLaw/TaxJudgeCountSpec.lean`、`JapanTaxLaw/TaxJudgeCountTests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため一時ファイルをプロジェクト外 temp に置き `lake env lean` を実行した（git 無視のビルド成果物が生成された可能性があるが、ソース・データは未変更）。
- **一次資料（pinned・改変禁止）**: law_id `345M50000040017` / revision `345M50000040017_20260710_508M60000040048`（政令「国税不服審判所組織規則」、改正法 `508M60000040048`、施行 **2026-07-10**、`current_revision_status = CurrentEnforced`）。実ファイル `data/raw/345M50000040017_20260710_508M60000040048.law.json`、size **44,771 bytes**、SHA-256 **`6B4D77C1F3A0D232FE64D6A171E0B30DCAAC7EDDE25C0D910227F559C2A4B221`**。`data/INVENTORY.json` の `current_revision.law_revision_id` および `raw_snapshot.source_sha256` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-54 エントリ（line 1869-1873、`kind="file"`、law_id `345M50000040017`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s　]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AY-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`Num="2"` の 1 ノードを特定して text-child のみを連結した（タグ名・属性値は除外）。原文逐語（独立抽出、全 62 文字）:

`（国税審判官等の定数）第二条国税審判官及び国税副審判官の定数は、次のとおりとする。一国税審判官百八十人二国税副審判官八十九人`

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `345M50000040017` / `345M50000040017_20260710_508M60000040048` | 同一 | OK |
| Article 2 flat 長 | **62 文字** | 62 chars | OK |
| U+3000 数（Article 2 flat） | **0** | 0 | OK |

- 課題提示の原文「国税審判官及び国税副審判官の定数は、次のとおりとする。一国税審判官百八十人二国税副審判官八十九人」は、上記 flat の後半に**完全一致**する（差は caption「（国税審判官等の定数）」と条名「第二条」の接頭のみ）。doc-comment が原文逐語中表示する改行／「人 二」間の空白は**可読性のための表示であり pinned バイト列の一部ではない**。pinned flat は空白・U+3000 を一切含まない 62 文字である（AY-2 の needle 検証は pinned 原文に対して実施）。

**定数の独立換算と桁違いの明示除外**:

| 原文リテラル | 出現 | 自前桁位置パーサ変換 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|
| `百八十` | 1 | 百 = 100 + 八 = 8 × 十 = 10 → **180** | `judgeCount = 180`、`specJudge = 180` | **十八 = 18（下1桁ずらし）を明示除外**／**千八百 = 1,800（上1桁ずらし）を明示除外** |
| `八十九` | 1 | 八 = 8 × 十 = 10 + 九 = 9 → **89** | `deputyJudgeCount = 89`、`specDeputy = 89` | **8.9（小数ずらし）を明示除外**／**八百九十 = 890（上1桁ずらし）を明示除外** |

- 自前パーサの独立結果: `百八十 → 180`、`十八 → 18`、`千八百 → 1800`、`八十九 → 89`、`八百九十 → 890`。pinned Article 2 に `"十八"` / `"千八百"` / `"八百九十"` / `"八・九"` / `"一八〇"` は**いずれも 0 回**であり、桁違い候補は原文リテラルとして存在しない（除外の根拠）。小数表記 `8.9` は漢字数字列では表現されず、原文に対応リテラルが存在しない。
- `judgeCount = 180` / `deputyJudgeCount = 89` はともに独立抽出値と一致。桁違い（18 / 1,800 / 8.9 / 890）はすべて棄却。

### AY-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列, line 1873） | 長 | U+3000 | 正規化前後 | 62 文字 flat 内 offset | count | FOUND |
|---|---|---:|---:|:---:|---:|---:|:---:|
| N1 | `一国税審判官百八十人` | 10 | 0 | 同一（冪等） | 41 | 1 | **FOUND** |
| N2 | `二国税副審判官八十九人` | 11 | 0 | 同一（冪等） | 51 | 1 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、CI 正規化前後で同一（冪等）。Article 2 flat 自体の U+3000 も **0**。
- N1 は「一 + 国税審判官 + 百八十人」、N2 は「二 + 国税副審判官 + 八十九人」を直接抑え、同一条文内の異なる位置（offset 41 と 51、非重複）を指す。片方が欠落・改変されれば即座に 1/2 に落ちる構成であり、needle 健全性は合格。

### AY-3. 反例探索

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で 3 モジュールを import し、公称値・桁違い棄却を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**、エラー 0 件）。走査した 14 命題のうち主要項目:

| 検証命題 | 結果 | 反例 |
|---|---|:---:|
| `judgeCount = 180` | true | なし |
| `deputyJudgeCount = 89` | true | なし |
| `judgeCount > deputyJudgeCount` | true | なし |
| `specJudge = 180` / `specDeputy = 89` | true | なし |
| `agreeTaxJudgeCount = true` | true | なし |
| `judgeCount ≠ 18` / `judgeCount ≠ 1800` | true | なし（下桁・上桁ずらしを棄却） |
| `deputyJudgeCount ≠ 8` / `≠ 9` / `≠ 890` | true | なし（桁分割・小数・上桁ずらしを棄却） |
| `judgeCount ≠ deputyJudgeCount`、否 `judgeCount < deputyJudgeCount` | true | なし（順序逆転なし） |
| `judgeCount + deputyJudgeCount = 269` | true | なし |

- 独立定式 `specJudge = 180` / `specDeputy = 89` との一致（`agreeTaxJudgeCount = true`）もカーネル還元で確認。
- **反例検出数: ゼロ（0）。** 定数 180 / 89、大小関係、および全桁違い棄却はすべて成立。

### AY-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **5 named def** に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- `JapanTaxLaw.TaxJudgeCount.judgeCount`
- `JapanTaxLaw.TaxJudgeCount.deputyJudgeCount`
- `JapanTaxLaw.TaxJudgeCount.specJudge`
- `JapanTaxLaw.TaxJudgeCount.specDeputy`
- `JapanTaxLaw.TaxJudgeCount.agreeTaxJudgeCount`

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 5 |
| `does not depend on any axioms` | **5/5** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- さらに 3 モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**（3 モジュールとも）。
- 参考（スコープ外の横断確認）: 全 tracked Lean 2,927 定理に対する CI 同一 probe は exit code **0** で、`sorryAx` **0 件** / `Classical.choice` **0 件**（CI ゲート条件を満たす）。ただし他モジュールの既存 698 宣言が `propext` および／または `Quot.sound` に依存する（いずれも Lean 標準論理公理で当該モデルとは無関係）。**本レビュー対象の TaxJudgeCount 宣言はそのような依存を 1 件も持たない。**
- → **禁止公理（choice / sorryAx）および Quot.sound / propext への依存はいずれも 0 件。公理監査は合格。**

### AY-5. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **実際の任命数・欠員の未形式化**: doc-comment に「実際の任命数、欠員、定数の改正手続は NOT MODELLED」と明記。pinned 第2条は「国税審判官百八十人」「国税副審判官八十九人」と**定員定数**のみを定め、実任命数や欠員数は本条文（および本スライス）に含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-1）。
- **定数改正手続の未形式化**: 同じく doc-comment に明記。pinned 第2条には改正の発議・閣議・公布・施行等の手続は記載されず、本スライスは法定定員の数値定数のみを扱う。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- 同一政令の第3条以降（職務・長・給与等）は pinned 原文に存在するが、本スライスの対象外であり、定数 180 / 89 の照合に影響しない。
- 本モデルは法的レビューを提供しない旨も明記されている。

### AY-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・恒等関数化・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、桁違い（18 / 1,800 / 8.9 / 890）、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 5 件

- **B-1 定数リテラルの原文忠実な定数化**: `百八十 → 180` / `八十九 → 89` を自前桁位置パーサで抽出し、`judgeCount = 180` / `deputyJudgeCount = 89`（および独立 spec 180 / 89）と一致。十八（18）・千八百（1,800）・8.9・八百九十（890）の桁違いを明示除外した設計。
- **B-2 CI needle の正規化**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 2 flat も 0）。2/2 FOUND。
- **B-3 bounded L4 スライス**: 法定定員の数値定数とその照合のみを提供し、実際の任命数・欠員・定数の改正手続は NOT MODELLED（doc-comment 明記、AY-5 で独立確認）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 62 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。原文逐語中の改行・空白は表示上の可読性のためのもので、pinned flat は空白なし（pinned バイト列との不一致ではない）。
- **B-5 自然数定数としての保持**: 定数は `Nat` で 180 / 89 として保持され、小数表記（8.9 等）は原文に存在しない。桁位置パーサの整数結果と型・値の双方で整合する。

#### UNRESOLVED — 2 件

- **U-1 実際の任命数・欠員の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、政令第2条のみでは実際の任命数・欠員を確定できない。**人間の法律専門家による確認を要する**。定数 180 / 89 の一致（CONFIRMED = 0）には影響しない。
- **U-2 定数改正手続の法的取扱い**: 改正手続は NOT MODELLED であり、pinned 原文のみでは改正の発議・公布・施行の有効性判定を確定できない。**人間の法律専門家を要する**。数値リテラルの一致（CONFIRMED = 0）には影響しない。

### AY-7. 結論・履歴保全

- pinned 第2条の「国税審判官 百八十人 = 180 人」「国税副審判官 八十九人 = 89 人」を独立抽出し、Lean 実装と照合。**桁違いゼロ**（18 / 1,800 / 8.9 / 890 を明示除外、該当リテラル pinned 内 0 回）。needle 2/2 FOUND（needle 内 U+3000 = 0、Article 2 flat も 0）、反例 0 件、公理依存 0 件（5/5 axiom-free、exit code 0）。
- 実任命数・欠員・定数改正手続の未形式化を確認（B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **48 件**（Batch G〜AX 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **49 件**（48 → 49、要求の 49 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない（既存の他エージェントによる無関係な変更は触れていない）。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前漢字数字パーサ・needle 自前正規化検証・端点値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch AZ review (2026-11-22) — 国税審判官等の定数政令 art.3 / TaxExaminerCount.lean（cycle-55 独立原文照合）

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、漢字数字を自前の桁位置パーサで Arabic 変換し、needle は CI と同一の正規化を自前適用して検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/TaxExaminerCount.lean`、`JapanTaxLaw/TaxExaminerCountSpec.lean`、`JapanTaxLaw/TaxExaminerCountTests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため一時ファイルをプロジェクト外 temp に置き `lake env lean` を実行した（exit code 0）。
- **一次資料（pinned・改変禁止）**: law_id `345M50000040017` / revision `345M50000040017_20260710_508M60000040048`（政令「国税不服審判所組織規則」、改正法 `508M60000040048`、施行 **2026-07-10**）。実ファイル `data/raw/345M50000040017_20260710_508M60000040048.law.json`、size **44,771 bytes**、SHA-256 **`6B4D77C1F3A0D232FE64D6A171E0B30DCAAC7EDDE25C0D910227F559C2A4B221`**。`data/INVENTORY.json` の `current_revision.law_revision_id` / `raw_snapshot.source_sha256` / `size_bytes` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-55 エントリ（line 1884-1888、`kind="file"`、law_id `345M50000040017`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s\u3000]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### AZ-1. pin 完全性と原文独立抽出（桁違いの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`Num="3"` の 1 ノードを特定（原文の条番号は 1〜8、art.3 は一意）して text-child のみを連結した（タグ名・属性値は除外）。原文逐語（独立抽出、全 65 文字、U+3000 = 0）:

`（国税審査官）第三条国税不服審判所に、国税審査官百七十四人以内を置く。２国税審査官は、国税審判官の命を受けて、その事務を整理する。`

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `345M50000040017` / `345M50000040017_20260710_508M60000040048` | 同一 | OK |
| Article 3 flat 長 | **65 文字** | 65 chars | OK |
| U+3000 数（Article 3 flat） | **0** | 0 | OK |

- 課題提示の原文「国税不服審判所に、国税審査官百七十四人以内を置く。」は、上記 flat の第1段落に**完全一致**する（差は caption「（国税審査官）」と条名「第三条」の接頭のみ）。flat 中の全角 `２`（U+FF12）は第2段落の段落番号であり定数 174 とは無関係。doc-comment が原文逐語中表示する改行／空白は可読性のための表示であり pinned バイト列の一部ではない（pinned flat は空白・U+3000 を一切含まない 65 文字）。

**定数の独立換算と桁違いの明示除外**:

| 原文リテラル | 出現 | 自前桁位置パーサ変換 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|
| `百七十四` | 1 | 百 = 100 + (七 = 7 × 十 = 10) + 四 = 4 → **174** | `maxExaminers = 174`（`specCap` も 174） | **十七 = 17（下1桁ずらし）**／**十七・四 = 17.4（小数ずらし）**／**千七百四十 = 1,740（上1桁ずらし）**を明示除外 |

- 自前パーサの独立結果: `百七十四 → 174`、`十七 → 17`、`千七百四十 → 1740`、`百八十 → 180`、`八十九 → 89`、`八百九十 → 890`。pinned Article 3 に `"十七"` / `"百七十七"` / `"千七百四十"` / `"十七・四"` / `"一七四"` / `"174"` は**いずれも 0 回**（`"十七"` は `百七十四` の部分列にも存在しない）であり、桁違い候補は原文リテラルとして存在しない（除外の根拠）。小数表記 17.4 は漢字数字列では表現されず、原文に対応リテラルが存在しない。
- `maxExaminers = 174` は独立抽出値と一致。桁違い（17 / 17.4 / 1,740）はすべて棄却。
- **art.2 とは異なる条文であることを独立確認**: pinned Article 2（62 文字）は `一国税審判官百八十人二国税副審判官八十九人` を含み、`百八十 → 180` / `八十九 → 89`（Batch AY の対象）。同 flat に `百七十四` は **0 回**。したがって本モデル art.3 の 174 は art.2 の 180 / 89 と混同すべきではない（両者は同一政令の別条）。

### AZ-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列, line 1888） | 長 | U+3000 | 正規化前後 | 65 文字 flat 内 offset | count | FOUND |
|---|---|---:|---:|:---:|---:|---:|:---:|
| N1 | `国税審査官百七十四人以内を置く` | 15 | 0 | 同一（冪等） | 19 | 1 | **FOUND** |
| N2 | `国税審査官）第三条` | 9 | 0 | 同一（冪等） | 1 | 1 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、CI 正規化前後で同一（冪等）。Article 3 flat 自体の U+3000 も **0**、正規化による変化なし（65 → 65 文字）。
- N2 の `）` は全角右括弧 U+FF09、flat の段落番号 `２` は全角数字 U+FF12 であり、いずれも U+3000（全角スペース）ではない。N1 は「国税審査官 + 百七十四人以内を置く」、N2 は「国税審査官 + ）第三条」を直接抑え、同一条文内の異なる位置（offset 19 と 1、非重複）を指す。片方が欠落・改変されれば即座に 1/2 に落ちる構成であり、needle 健全性は合格。

### AZ-3. 反例探索

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で 3 モジュールを import し、公称値・桁違い棄却・境界を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**、エラー 0 件）。走査した 12 命題のうち主要項目:

| 検証命題 | 結果 | 反例 |
|---|:---:|:---:|
| `maxExaminers = 174` | true | なし |
| `isWithinCap 0 = true` | true | なし |
| `isWithinCap 173 = true` | true | なし |
| `isWithinCap 174 = true` | true | なし |
| `isWithinCap 175 = false` | true | なし |
| `specCap 174 = true` / `specCap 175 = false` | true | なし |
| `agreeTaxExaminerCount = true` | true | なし |
| `maxExaminers ≠ 17` / `≠ 1740` / `≠ 17400` | true | なし（下桁・上桁ずらしを棄却） |
| `isWithinCap 173 = true ∧ isWithinCap 174 = true ∧ isWithinCap 175 = false` | true | なし（境界の包含を確認） |

- 「以内」は `<=`（境界 174 含む）として実装され、173/174 が true、175 が false。独立 spec `specCap`（`n <= 174`）との一致も `agreeTaxExaminerCount = true` としてカーネル還元で確認。
- **反例検出数: ゼロ（0）。** 定数 174、境界包含、および全桁違い棄却はすべて成立。

### AZ-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **4 named def** に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- `JapanTaxLaw.TaxExaminerCount.maxExaminers`
- `JapanTaxLaw.TaxExaminerCount.isWithinCap`
- `JapanTaxLaw.TaxExaminerCount.specCap`
- `JapanTaxLaw.TaxExaminerCount.agreeTaxExaminerCount`

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 4 |
| `does not depend on any axioms` | **4/4** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- さらに 3 モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**（3 モジュールとも）。
- → **禁止公理（choice / sorryAx）および Quot.sound / propext への依存はいずれも 0 件。公理監査は合格。**

### AZ-5. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **実際の任命数・欠員の未形式化**: doc-comment に「実際の任命数、欠員、定数の改正手続は NOT MODELLED」と明記。pinned 第3条第1段落は「国税不服審判所に、国税審査官百七十四人以内を置く。」と**定員上限**のみを定め、実任命数や欠員数は本条文（および本スライス）に含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-1）。
- **職務内容の未形式化**: pinned 第3条第2段落は「国税審査官は、国税審判官の命を受けて、その事務を整理する。」と職務を定めるが、モデルは定員上限の数値定数のみを提供し職務内容は NOT MODELLED（doc-comment 明記）。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- **定数改正手続の未形式化**: doc-comment に明記。pinned 第3条には改正の発議・公布・施行等の手続は記載されず、本スライスは法定定員の数値定数のみを扱う。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- 同一政令の第1条（支部）、第2条（審判官 180 / 副審判官 89）、第4条以降は pinned 原文に存在するが本スライスの対象外であり、定数 174 の照合に影響しない。
- 本モデルは法的レビューを提供しない旨も明記されている。

### AZ-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・恒等関数化・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、桁違い（17 / 17.4 / 1,740）、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 5 件

- **B-1 定数リテラルの原文忠実な定数化**: `百七十四 → 174` を自前桁位置パーサで抽出し、`maxExaminers = 174`（および独立 spec 174）と一致。十七（17）・十七・四（17.4）・千七百四十（1,740）の桁違いを明示除外した設計。
- **B-2 CI needle の正規化**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 3 flat も 0）。2/2 FOUND。
- **B-3 bounded L4 スライス**: 定員上限の数値定数とその照合のみを提供し、実際の任命数・欠員・職務内容・定数の改正手続は NOT MODELLED（doc-comment 明記、AZ-5 で独立確認）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 65 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。原文逐語中の改行・空白は表示上の可読性のためのもので、pinned flat は空白なし（pinned バイト列との不一致ではない）。
- **B-5 自然数定数としての保持**: 定数は `Nat` で 174 として保持され、小数表記（17.4 等）は原文に存在しない。桁位置パーサの整数結果と型・値の双方で整合。「以内」を `<=`（境界含む）とする実装も端点走査で確認。

#### UNRESOLVED — 2 件

- **U-1 実際の任命数・欠員の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、政令第3条のみでは実際の任命数・欠員を確定できない。**人間の法律専門家による確認を要する**。定数 174 の一致（CONFIRMED = 0）には影響しない。
- **U-2 職務内容・定数改正手続の法的取扱い**: 第3条第2段落の職務記述はモデル化されず、改正手続も NOT MODELLED である。pinned 原文のみでは職務の法的効果や改正の発議・公布・施行の有効性判定を確定できない。**人間の法律専門家を要する**。数値リテラルの一致（CONFIRMED = 0）には影響しない。

### AZ-7. 結論・履歴保全

- pinned 第3条の「国税審査官 百七十四人以内 = 174 人」を独立抽出し、Lean 実装と照合。**桁違いゼロ**（17 / 17.4 / 1,740 を明示除外、該当リテラル pinned 内 0 回）。needle 2/2 FOUND（needle 内 U+3000 = 0、Article 3 flat も 0）、反例 0 件、公理依存 0 件（4/4 axiom-free、exit code 0）。art.2（180 / 89）とは異なる条文であることを独立確認。
- 実際の任命数・欠員・職務内容・定数改正手続の未形式化を確認（B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **49 件**（Batch G〜AY 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **50 件**（49 → 50、要求の 50 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない（既存の他エージェントによる無関係な変更は触れていない）。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前漢字数字パーサ・needle 自前正規化検証・端点値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

## Batch BA review (2026-11-22)

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、元号換算を自前で行い、needle は CI と同一の正規化を自前適用して検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/ConsumptionTaxSpecialDate.lean`、`JapanTaxLaw/ConsumptionTaxSpecialDateSpec.lean`、`JapanTaxLaw/ConsumptionTaxSpecialDateTests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため一時ファイルをプロジェクト外 temp に置き `lake env lean` を実行した（exit code 0）、実行後に一時ファイルは削除した。
- **一次資料（pinned・改変禁止）**: law_id `502CO0000000160` / revision `502CO0000000160_20260401_508CO0000000104`（政令「新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律施行令」、改正法 `508CO0000000104`、施行 **2026-04-01**）。実ファイル `data/raw/502CO0000000160_20260401_508CO0000000104.law.json`、size **94,464 bytes**、SHA-256 **`ce638183530ab1eea2490db17f76959636bb0443d9fe42f2c931d0d11aff1bc0`**。`data/INVENTORY.json` の `current_revision.law_revision_id` / `raw_snapshot.source_sha256`（大文字表記 `CE6381...BC0`）/ `size_bytes = 94464` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-56 エントリ（line 1908-1912、`kind="file"`、law_id `502CO0000000160`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s\u3000]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### BA-1. pin 完全性と原文独立抽出（元号換算・桁違いの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`Num="7"` の 1 ノードを特定して text-child のみを連結した（タグ名・属性値は除外）。原文逐語（独立抽出、正規化後 56 文字、U+3000 = 0）:

`（消費税の特例に係る政令で定める日）第七条法第十条第一項に規定する政令で定める日は、令和三年一月三十一日とする。`

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `502CO0000000160` / `502CO0000000160_20260401_508CO0000000104` | 同一 | OK |
| Article 7 flat 長 | **56 文字** | 56 chars | OK |
| U+3000 数（Article 7 flat） | **0** | 0 | OK |
| 原文逐語 | 上記のとおり | 「法第十条第一項に規定する政令で定める日は、令和三年一月三十一日とする。」 | OK（caption「（消費税の特例に係る政令で定める日）」と条名「第七条」の接頭のみ差） |

- 課題提示の原文「法第十条第一項に規定する政令で定める日は、令和三年一月三十一日とする。」は、上記 flat の本文部分に**完全一致**する。doc-comment が原文逐語中表示する改行／空白は可読性のための表示であり、pinned バイト列の一部ではない（pinned flat は空白・U+3000 を一切含まない 56 文字）。
- 自前正規表現 `令和[一二三四五六七八九十百]+年[一二三四五六七八九十]+月[一二三四五六七八九十]+日` による独立抽出結果は **令和三年一月三十一日**（1 件）。リテラル `令和三年一月三十一日` も pinned Article 7 に 1 回存在する。

**元号換算と元年=2019 の根拠、および桁違いの明示除外**:

| 原文リテラル | 出現 | 自前換算 | Lean 定数 | 除外した誤読 |
|---|---:|---|---|---|
| `令和三年` | 1 | 2019 + 3 − 1 = **2021** | `westernYear = 2021` | **令和三十年 → 2048（上1桁ずらし）**／**2031（西暦下桁取り違え）**／**2019（元年そのもの）** を明示除外 |

- 元年 = 2019 の根拠: 令和は 2019-05-01 改元（令和元年 = 2019）。pinned データ自体もこれに整合する — `law_full_text.attr` が `Era="Reiwa"` / `Year="02"` で公布日 `2020-04-30`（令和二年 = 2020 → 令和元年 = 2019）、同 law の revisions では `令和七年 = 2025` / `令和八年 = 2026` であり、`西暦 = 2019 + 元号年 − 1` の式と一致する。
- 桁違い候補の pinned 内出現: `令和三十年` **0 回**、`令和30年` **0 回**。原文は `令和三年`（3）であり 30 ではない。`令和30年` と誤読した場合の換算値は 2019 + 30 − 1 = **2048** で、原文にも実装にも存在しない。また西暦を **2031** と取り違える可能性も、実装値 2021 と一致しないため棄却（`westernYear ≠ 2031` をカーネル還元で確認、BA-3）。
- `westernYear = 2021` / `month = 1` / `day = 31` は独立抽出値（2021-01-31）と一致。桁違い（2048 / 2031 / 2019、月 2、日 30）はすべて棄却。

### BA-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列, line 1912） | 長 | U+3000 | 正規化前後 | Article 7 flat 内 offset | count | raw | 正規化 | FOUND |
|---|---|---:|---:|:---:|---:|---:|:---:|:---:|:---:|
| N1 | `政令で定める日は、令和三年一月三十一日とする` | 22 | 0 | 同一（冪等） | 33 | 1 | FOUND | FOUND | **FOUND** |
| N2 | `消費税の特例に係る政令で定める日` | 16 | 0 | 同一（冪等） | 1 | 1 | FOUND | FOUND | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、CI 正規化前後で同一（冪等）。Article 7 flat 自体の U+3000 も **0**、正規化による変化なし（56 → 56 文字）。（pinned ファイル全体には U+3000 が 9 個存在するが、これらは目次ラベル等であり Article 7 leaf には含まれない。）
- N1 は本文の日付文を、N2 は条見出し「（消費税の特例に係る政令で定める日）」を直接抑える。両者は同一 Article 7 内の異なる位置（offset 33 と 1、非重複、各 count = 1）を指し、片方が欠落・改変されれば即座に 1/2 に落ちる構成であり、needle 健全性は合格。
- FINDING: なし。

### BA-3. 反例探索

一時 Lean ファイル（外部 temp ディレクトリ、プロジェクト外）で 3 モジュールを import し、公称値・桁違い棄却を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**、エラー 0 件）。走査した 13 命題のうち主要項目:

| 検証命題 | 結果 | 反例 |
|---|:---:|:---:|
| `westernYear = 2021` | true | なし |
| `westernYear = 2019 + 3 - 1` | true | なし |
| `month = 1` / `day = 31` | true | なし |
| `specYear = 2021` / `specMonth = 1` / `specDay = 31` | true | なし |
| `agreeConsumptionTaxSpecialDate = true` | true | なし |
| `westernYear ≠ 2031` | true | なし（西暦下桁取り違えを棄却） |
| `westernYear ≠ 2048` | true | なし（`令和30年` 誤読を棄却） |
| `westernYear ≠ 2019` | true | なし（元年そのものを棄却） |
| `month ≠ 2` / `day ≠ 30` | true | なし（月日の取り違えを棄却） |

- **反例検出数: ゼロ（0）。** 定数 2021 / 1 / 31、独立 spec との一致、および全桁違い棄却はすべて成立。

### BA-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **7 named def** に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- `JapanTaxLaw.ConsumptionTaxSpecialDate.westernYear`
- `JapanTaxLaw.ConsumptionTaxSpecialDate.month`
- `JapanTaxLaw.ConsumptionTaxSpecialDate.day`
- `JapanTaxLaw.ConsumptionTaxSpecialDate.specYear`
- `JapanTaxLaw.ConsumptionTaxSpecialDate.specMonth`
- `JapanTaxLaw.ConsumptionTaxSpecialDate.specDay`
- `JapanTaxLaw.ConsumptionTaxSpecialDate.agreeConsumptionTaxSpecialDate`

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 7 |
| `does not depend on any axioms` | **7/7** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- さらに 3 モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `by_contra` / `Quot.sound` / `propext` / `choice` / `noncomputable` / `unsafe` の一致 **0 件**（3 モジュールとも）。
- → **禁止公理（choice / sorryAx）および Quot.sound / propext への依存はいずれも 0 件。公理監査は合格。**

### BA-5. 未形式化範囲の確認

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **法第十条第一項の特例の内容・適用条件の未形式化**: doc-comment に「法10条1項の特例の内容・適用条件は NOT MODELLED」と明記。pinned 第7条は「法第十条第一項に規定する政令で定める日は、令和三年一月三十一日とする。」と**日付のみ**を定め、特例の内容・適用条件は本条文（および本スライス）に含まれない。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-1）。
- **日付の曜日判定・期間算術の未形式化**: doc-comment に「日付の曜日判定・期間算術は NOT MODELLED」と明記。pinned 第7条の flat に曜日・期間を示すリテラルは存在せず、モデルも `westernYear` / `month` / `day` の数値定数のみを提供する。→ 未形式化を確認（BY-DESIGN B-3 / UNRESOLVED U-2）。
- 同一政令の他条（第1条〜第6条、第8条以降）は pinned 原文に存在するが本スライスの対象外であり、日付定数 2021-01-31 の照合に影響しない。
- 本モデルは法的レビューを提供しない旨も明記されている。

### BA-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・元号換算誤り・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、元号換算誤り、桁違い（令和30年/2048、2031、2019）、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 5 件

- **B-1 元号換算の原文忠実な定数化**: `令和三年 → 2019 + 3 − 1 = 2021` を自前換算で抽出し、`westernYear = 2021`（`specYear` も 2021）と一致。元年=2019 は pinned メタデータ（Era/Year=02、公布 2020-04-30、revisions の令和七年=2025/令和八年=2026）にも整合。令和30年（2048）・2031・2019 の桁違いを明示除外した設計。
- **B-2 CI needle の正規化**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 7 flat も 0）。2/2 FOUND。
- **B-3 bounded L4 スライス**: 日付定数のみを提供し、法10条1項の特例内容・適用条件、曜日判定、期間算術は NOT MODELLED（doc-comment 明記、BA-5 で独立確認）。
- **B-4 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 56 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。原文逐語中の改行・空白は表示上の可読性のためのもので、pinned flat は空白なし（pinned バイト列との不一致ではない）。
- **B-5 自然数定数としての保持**: 日付は `Nat` で 2021 / 1 / 31 として保持され、`by decide` のカーネル還元で公称値・独立 spec 一致・桁違い棄却を検証。法律上的日付型・カレンダー型ではなく整数定数に留める設計。

#### UNRESOLVED — 2 件

- **U-1 法第十条第一項の特例の内容・適用条件の法的取扱い**: 未形式化自体は B-3 のとおり明示済みだが、pinned 第7条は日付のみを定め、特例の内容・適用条件を確定できない。**人間の法律専門家による確認を要する**。日付リテラルの一致（CONFIRMED = 0）には影響しない。
- **U-2 曜日判定・期間算術の法的取扱い**: pinned 原文に曜日・期間のリテラルは存在せず、モデルも提供しない。pinned 原文のみでは当該日付の曜日や期間計算の法的効果を確定できない。**人間の法律専門家を要する**。数値リテラルの一致（CONFIRMED = 0）には影響しない。

### BA-7. 結論・履歴保全

- pinned 第7条の「令和三年一月三十一日 = 西暦 2021-01-31」を独立抽出し、元号換算（元年=2019 は pinned メタデータにも整合）を自前で行って Lean 実装と照合。**桁違いゼロ**（令和30年/2048、2031、2019、月 2、日 30 を明示除外、該当リテラル pinned 内 0 回）。needle 2/2 FOUND（needle 内 U+3000 = 0、Article 7 flat も 0）、反例 0 件、公理依存 0 件（7/7 axiom-free、exit code 0）。
- 法10条1項の特例内容・適用条件、曜日判定・期間算術の未形式化を確認（B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **50 件**（Batch G〜AZ 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **51 件**（50 → 51、要求の 51 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない（既存の他エージェントによる無関係な変更は触れていない）。一時ファイルはすべて削除した。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・自前元号換算・needle 自前正規化検証・端点値 kernel-decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Batch BB review (2026-11-22)

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・STAGING・CI 監査結果は信じず、pinned 原文 JSON を直接再 parse し、曜日列挙・曜日トークンを自前で照合し、needle は CI と同一の正規化を自前適用して検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/PeriodEndDayException.lean`、`JapanTaxLaw/PeriodEndDayExceptionSpec.lean`、`JapanTaxLaw/PeriodEndDayExceptionTests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため一時ファイルをプロジェクト外 temp に置き `lake env lean` を実行した（exit code 0）、実行後に一時ファイルはすべて削除した。
- **一次資料（pinned・改変禁止）**: law_id `329CO0000000051` / revision `329CO0000000051_20260401_508CO0000000085`（政令「国税収納金整理資金に関する法律施行令」、改正法 `508CO0000000085`、施行 **2026-04-01**）。実ファイル `data/raw/329CO0000000051_20260401_508CO0000000085.law.json`、size **304,971 bytes**、SHA-256 **`fff3c8a427069a3671749a9058ce571842ddbca91ebb5cf5babe6b70593f412f`**。`data/INVENTORY.json` の `current_revision.law_revision_id` / `raw_snapshot.source_sha256`（大文字表記 `FFF3C8...412F`）/ `size_bytes = 304971` も同一 pinned を指すことを独立確認。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-57 エントリ（line 1923-1927、`kind="file"`、law_id `329CO0000000051`）から実文字列2本を直接読み出し、CI と同一の正規化 `re.sub(r"[\s\u3000]+", "", s)` を**自前で平坦化した pinned 原文**に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### BB-1. pin 完全性と原文独立抽出（曜日取り違えの直接除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`Num="21_2"` の **1 ノード**（path `[1,3,3,2]`、第四章「歳入への組入等」内）を特定して text-child のみを連結した（タグ名・属性値は除外）。原文逐語（独立抽出・正規化後 **46 文字**、U+3000 = **0**）:

`（期間の末日の特例）第二十一条の二法第十四条第一項に規定する政令で定める日は、土曜日とする。`

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `329CO0000000051` / `329CO0000000051_20260401_508CO0000000085` | 同一 | OK |
| Article 21_2 flat 長 | **46 文字** | 46 chars | OK |
| U+3000 数（Article 21_2 flat） | **0** | 0 | OK |
| 原文逐語（本文） | `法第十四条第一項に規定する政令で定める日は、土曜日とする。`（完全一致、1 件） | 同一 | OK |

- **「土曜日」の独立抽出**: caption「（期間の末日の特例）」＋条名「第二十一条の二」＋本文 1 文。本文の曜日トークンは **`土曜日` のみ 1 回**。`月曜日` / `火曜日` / `水曜日` / `木曜日` / `金曜日` / `日曜日` は当該条に **0 回**（pinned 法令全体でも `土曜日` = 1 回、他 6 曜日 = 0 回、`休日` = 0 回）。→ 他曜日との取り違えは原文バイトレベルで除外。
- **曜日列挙の照合**: doc-comment の列挙 `月=0, 火=1, 水=2, 木=3, 金=4, 土=5, 日=6` を自前で添字確認し、`saturday = 5` が「土」の添字 **5** と一致することを確認。取り違え候補 `4`（＝金曜日）は原文に `金曜日` が存在せず、**6**（＝日曜日、または `日=0..土=6` の星期日基底）は doc が明示的に `月=0..日=6` を採用しているため、いずれも棄却。

### BB-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列, line 1927） | 長 | U+3000 | 正規化前後 | 法令全体 count | Article 21_2 内 count | 判定 |
|---|---|---:|---:|:---:|---:|---:|:---:|
| N1 | `政令で定める日は、土曜日とする` | 15 | 0 | 同一（冪等） | 1 | 1 | **FOUND** |
| N2 | `期間の末日の特例）第二十一条の二` | 16 | 0 | 同一（冪等） | 1 | 1 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**、CI 正規化前後で同一（冪等）。Article 21_2 flat 自体の U+3000 も **0**。（pinned ファイル全体には U+3000 が **182** 個存在するが、目次ラベル等であり正規化で除去される。needle 自身は U+3000 を含まない。）
- N1 は本文の日付文（曜日指定）を、N2 は caption「（期間の末日の特例）」＋条名「第二十一条の二」を直接抑える。両者は同一 Article 21_2 内の異なる位置を指し、片方が欠落・改変されれば即座に 1/2 に落ちる構成であり、needle 健全性は合格。
- **方法論的観察（不具合ではない）**: 自前平坦化の初期実装でタグ名（`ArticleCaption` / `ArticleTitle` 等）を text に混入させたところ N2 が 1/2 に落ちた。これは caption と条名の間にタグ名が入るためであり、CI の `text()`（`node.get("children")` のみを連結）が正しい平坦化である。タグ名を含めない自前 children-only 平坦化で **2/2 FOUND** を再確認した。needle の健全性は CI の平坦化規約に依存するが、その規約どおりに検証した限り問題なし。

### BB-3. 反例探索（`saturday = 5`）

3 モジュールを外部 temp の Lean ファイルで import し、公称値と独立 spec 一致を `by decide`（カーネル還元）で直接検証（`lake env lean`、3 ファイルとも exit code **0**、エラー 0 件）。

| 検証命題 / 攻撃 | 結果 | 反例 |
|---|:---:|---|
| `saturday = 5` | true | なし |
| `specSaturday = 5` | true | なし |
| `agreePeriodEndDayException = true` | true | なし |
| 取り違え `saturday = 4`（金曜日） | 棄却 | `金曜日` トークン原文 0 回、添字 4 は「金」 |
| 取り違え `saturday = 6`（日曜日／日=0 基底） | 棄却 | `日曜日` トークン原文 0 回、doc は `月=0..日=6` を明示 |
| その他の値（0〜3, 7 以上） | 棄却 | 列挙添字 5 と矛盾 |

- **反例検出数: ゼロ（0）。** 定数 5、独立 spec との一致、および全曜日取り違え候補の棄却はすべて成立。

### BB-4. 公理監査

一時 Lean ファイル（外部 temp）で以下の **3 named def** に `#print axioms` を実行（`lake env lean`、exit code **0**）:

- `JapanTaxLaw.PeriodEndDayException.saturday`
- `JapanTaxLaw.PeriodEndDayException.specSaturday`
- `JapanTaxLaw.PeriodEndDayException.agreePeriodEndDayException`

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 3 |
| `does not depend on any axioms` | **3/3** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- → **禁止公理（choice / sorryAx）および Quot.sound / propext への依存はいずれも 0 件。公理監査は合格。**

### BB-5. 未形式化範囲の確認（末日算術・他の特例）

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **法第十四条第一項の期間・末日算術の未形式化**: doc-comment に「法14条1項の期間・末日算術 … NOT MODELLED」と明記。pinned 第21条の二は「政令で定める日を土曜日とする」と**曜日を指定するのみ**で、期間の起算・末日そのものの算術は本条文（および本スライス）に含まれない。→ 未形式化を確認（BY-DESIGN B-4 / UNRESOLVED U-1）。
- **他の特例（日曜・休日等）の未形式化**: doc-comment に「他の特例（日曜・休日等）は NOT MODELLED」と明記。pinned 法令全体で `日曜日` = 0 回、`休日` = 0 回、`土曜日` = 1 回のみであり、本政令中に MODELLED 対象外の競合曜日指定は存在しない。→ 未形式化を確認（BY-DESIGN B-4 / UNRESOLVED U-2）。
- 本スライスは「政令で定める日 = 土曜日」の**曜日定数のみ**を扱い、本モデルは法的レビューを提供しない旨も明記されている。

### BB-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・曜日取り違え・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 5 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文矛盾、他曜日との取り違え、needle 不良、反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 5 件

- **B-1 曜日列挙は明示された model convention**: `月=0..日=6` は doc-comment が明示する列挙であり、`saturday = 5` はその帰結。原文は添字基底を定めないため、明示した基底に従う限り正しい（星期日基底 `日=0..土=6` なら土=6 だが、本モデルは採用していない）。
- **B-2 doc-comment の pin 申告が pinned と完全一致**: law_id / revision / flat 46 文字 / U+3000 = 0 / 原文逐語がいずれも独立抽出と一致。原文逐語中の改行・空白は可読性のための表示であり、pinned flat は空白なし（pinned バイト列との不一致ではない）。
- **B-3 CI needle の正規化と 2/2 FOUND**: U+3000 除去は転記監査の仕様であり、モデル値・原文忠実性に影響しない（needle 内 U+3000 = 0、Article 21_2 flat も 0）。children-only 平坦化の規約どおりに検証し 2/2 FOUND。
- **B-4 bounded L4 スライス**: 曜日定数のみを提供し、法14条1項の期間・末日算術、他の特例（日曜・休日等）は NOT MODELLED（doc-comment 明記、BB-5 で独立確認）。
- **B-5 自然数定数としての保持**: 曜日は `Nat` で 5 として保持され、`by decide` のカーネル還元で公称値・独立 spec 一致を検証。曜日型・カレンダー型ではなく整数定数に留める設計。

#### UNRESOLVED — 2 件

- **U-1 「政令で定める日 = 土曜日」が法14条1項の末日算術にどう効くか**: 未形式化自体は B-4 のとおり明示済みだが、pinned 政令 art.21の2 は曜日を指定するのみで、末日が土曜日のときの取扱い（前日／翌営業日への繰り替え等）は確定できない。法14条1項本文・通則法の解釈を要し、**人間の法律専門家による確認を要する**。値 `saturday = 5` の一致（CONFIRMED = 0）には影響しない。
- **U-2 他法令・通則における日曜・休日等の特例の有無・適用関係**: pinned 政令の範囲外で判断不能（本政令中に当該曜日トークンは 0 回）。**人間の法律専門家を要する**。数値一致（CONFIRMED = 0）には影響しない。

### BB-7. 結論・履歴保全

- pinned 第21条の二の「政令で定める日 = 土曜日」を独立抽出し、曜日列挙 `月=0..日=6` のもとで `saturday = 5` が正しいことを確認。**他曜日との取り違えゼロ**、needle 2/2 FOUND（needle 内 U+3000 = 0、Article 21_2 flat も 0）、反例 0 件、公理依存 0 件（3/3 axiom-free、exit code 0）。
- 末日算術・他の特例（日曜・休日等）の未形式化を確認（B-4、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **51 件**（Batch G〜BA 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **52 件**（51 → 52、要求の 52 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。一時ファイルはすべて削除した。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・曜日トークン照合・needle 自前正規化検証・カーネル decide 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。

---

## Batch BC review (2026-11-22)

- **レビュア役割**: Adversarial Review Agent（形式化担当から完全に独立）。coordinator 要約・`docs/STAGING_PAYMENTDEADLINE.md`・CI 監査結果は信じず、pinned 原文 JSON を自前で再 parse し、「二十日以内」の漢数字を自前パーサ（十=10 等の位取り）で Arabic 変換して照合し、needle は自前正規化原文で検証した。
- **対象（読み取り専用・変更していない）**: `JapanTaxLaw/PaymentDeadline.lean`、`JapanTaxLaw/PaymentDeadlineSpec.lean`、`JapanTaxLaw/PaymentDeadlineTests.lean`。Lean モジュール / `data/*` / `scripts/*` は一切変更せず、commit / push / merge / ブランチ切替も行っていない。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾追記）。※ 監査実行のため一時ファイルをプロジェクト外 temp に置き `lake env lean` を実行（exit code 0）、実行後に一時ファイルはすべて削除した。
- **一次資料（pinned・改変禁止）**: law_id `329M50000040039` / revision `329M50000040039_20260924_508M60000040059`（pinned law_title `国税収納金整理資金事務取扱規則`＝タスク文言の「国税収納事務処理省令」、改正法 `508M60000040059`、施行 **2026-09-24**）。実ファイル `data/raw/329M50000040039_20260924_508M60000040059.law.json`、size **323,001 bytes**、SHA-256 **`B781497137BC1B026F06A18FC973D3CC6E48E315DC432D99DD84F1F1B08058DF`**。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-58 エントリ（line 1946-1950、`kind="file"`、law_id `329M50000040039`）から実文字列2本を直接読み出し、自前で平坦化・正規化した pinned 原文に適用して包含判定した。
- **本レビューは機械的独立照合であり、人間の法律専門家によるレビューを称するものではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。

### BC-1. 独立抽出（pinned 原文からの「二十日以内」= 20 直接抽出と桁違い除外）

自前スクリプトで `law_full_text` の `Article` ノードを再帰走査し、`Num="18"` の **1 ノード**（path `/Law/LawBody/MainProvision/Chapter/Section/Article`）を特定して text-child のみを連結（タグ名・属性値は除外）。原文逐語（独立抽出・正規化後 **89 文字**、U+3000 = **0**）:

`（納付期限）第十八条国税収納命令官等は、国税等の納付期限を指定する場合には、法令その他の定がある場合を除く外、調査決定の日から二十日以内において適宜の納付期限を定めるものとする。`

| 項目 | 独立抽出結果 | モジュール doc-comment 申告 | 照合 |
|---|---|---|:---:|
| law_id / revision | `329M50000040039` / `329M50000040039_20260924_508M60000040059` | 同一 | OK |
| Article 18 flat 長 | **89 文字** | 89 chars | OK |
| U+3000 数（Article 18 flat） | **0** | 0 | OK |
| 漢数字トークン | `二十`（正規化原文に **1 回**） | — | OK |
| 自前 Arabic 変換 | `kanji_to_int("二十") = 20` | `maxDaysAfterDecision = 20` | OK |

- **「二十日以内」の直接抽出**: 正規化原文中に `二十日以内` は **1 回**（offset 7215）。直接直前の漢数字列 `二十` を自前パーサ（一〜九 + 十/百/千の位取り）で変換して **20** を得た。桁違い候補は明示的に除外: `二日以内`（=2）は原文に **0 回**、`二百日以内`（=200）は原文に **0 回**。したがって **2 / 200 日の取り違えは原文バイトレベルで除外**され、20 が一意に確定する。
- doc-comment の原文逐語（改行・インデント入り）と pinned flat（空白なし）は表示上の差のみで、文字列は同一。

### BC-2. needle 健全性（CI `checks()` 実文字列2本を自前正規化原文で検証）

| # | CI needle（実文字列, line 1950） | U+3000 | 自前正規化原文 count | 判定 |
|---|---|---:|---:|:---:|
| N1 | `調査決定の日から二十日以内` | 0 | 1 | **FOUND** |
| N2 | `納付期限）第十八条` | 0 | 1 | **FOUND** |

- **2/2 FOUND**。needle 内の U+3000 含有 **0 件**。自前正規化 `re.sub(r"[\s\u3000]+", "", s)` は冪等で、needle は正規化前後で同一。
- pinned ファイル全体には U+3000 が **159 個**存在する（目次ラベル等）が、Article 18 flat では **0**、正規化後は **0**。needle 自身も U+3000 を含まないため、CI の照合は正規化に依存しても健全。
- N1 は本文の日数上限句、N2 は caption「（納付期限）」＋条名「第十八条」を直接抑える。両者は同一 Article 18 内の異なる位置を指し、片方が欠落・改変されれば即座に 1/2 に落ちる構成であり、needle 健全性は合格。

### BC-3. 反例探索（「以内」= <= の境界含む）

3 モジュールを外部 temp の Lean ファイルで import し、境界値を `by decide`（カーネル還元）で直接検証（`lake env lean`、exit code **0**、エラー 0 件）。

| 検証命題 / 攻撃 | 結果 | 反例 |
|---|:---:|---|
| `isWithinDeadline 18 = true` | true | なし |
| `isWithinDeadline 19 = true` | true | なし |
| `isWithinDeadline 20 = true`（境界） | true | なし |
| `isWithinDeadline 21 = false` | false | なし |
| `isWithinDeadline 22 = false` | false | なし |
| `maxDaysAfterDecision = 20` | true | なし |
| `agreePaymentDeadline = true`（Spec 独立定式との一致） | true | なし |

- **境界の判定**: 「二十日以内」の `以内` は上限を含むため `days <= 20` が正しい。19→true / 20→true / 21→false をカーネル還元で直接確認し、**境界を 20 で含むこと／21 で除外すること**を独立検証した。
- **反例検出数: ゼロ（0）。** 桁違い（2/200）は BC-1 で除外済み。`< 20`（20 を除外）や `<= 21` といった別解釈は原文の「以内」と矛盾するため棄却。

### BC-4. 公理監査

一時 Lean ファイル（外部 temp `bc_axiom_probe.lean`）で、実装の named def 2 本と BC-3 の境界検証定理 5 本、計 **7 宣言**に `#print axioms` を実行（`lake env lean` v4.35.0、exit code **0**）:

- `JapanTaxLaw.PaymentDeadline.maxDaysAfterDecision`
- `JapanTaxLaw.PaymentDeadline.isWithinDeadline`
- `bc_t18` / `bc_t19` / `bc_t20` / `bc_t21` / `bc_t22`（全て `by decide`）

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 7 |
| `does not depend on any axioms` | **7/7** |
| `Classical.choice` | **0 件** |
| `sorryAx` | **0 件** |
| `Quot.sound` | **0 件** |
| `propext` | **0 件** |

- → **choice / sorryAx / Quot.sound / propext への依存はいずれも 0 件。公理監査は合格。**（モジュール内の 4 本の匿名 `example` も同一の `by decide` であり、公理依存なし。）

### BC-5. 未形式化範囲の確認（例外・日付算術・裁量）

doc-comment の `Scope / NOT MODELLED` と pinned 原文を突き合わせ、以下を独立確認した。

- **例外（法令その他の定がある場合を除く外）の未形式化**: doc-comment に明記。pinned 第18条は「法令その他の定がある場合を除く外、…」と例外を文言上持つが、モデルは日数上限 `<= 20` のみで例外判定を実装しない。→ 未形式化を確認（BY-DESIGN B-1 / UNRESOLVED U-1）。
- **日付算術の未形式化**: doc-comment に「実際の納付期限の指定・日付算術 … NOT MODELLED」と明記。原文は「調査決定の日から二十日以内」と上限日数を定めるのみで、起算日・カレンダー換算・土日祝日の繰り下げ等は本条文に含まれない。モデルは `days : Nat` を caller-established な整数として受け取るのみ。→ 未形式化を確認（BY-DESIGN B-2 / UNRESOLVED U-2）。
- **「適宜」の裁量の未形式化**: doc-comment に「『適宜』の裁量は NOT MODELLED」と明記。原文「適宜の納付期限を定めるものとする」は当局の裁量を含むが、モデルは上限チェックのみで具体的期限の選択を提供しない。→ 未形式化を確認（BY-DESIGN B-3）。
- 本スライスは上限日数 20 と境界判定のみを扱い、本モデルは法的レビューを提供しない旨も明記されている。

### BC-6. 分類

| 分類 | 件数 |
|---|---:|
| **CONFIRMED（原文矛盾・桁違い・needle 不良・反例・公理汚染）** | **0（ゼロ）** |
| BY-DESIGN | 4 |
| UNRESOLVED | 2 |

> **発見された問題はゼロ（CONFIRMED = 0）である。** 原文との矛盾、2/200 日の桁違い、needle 不良、境界反例、公理依存はいずれも検出されなかった。件数を手柄にしない。

#### BY-DESIGN — 4 件

- **B-1 例外（法令その他の定がある場合）は NOT MODELLED**: doc-comment が明示。上限日数のみを提供し例外判定は caller-established（BC-5）。
- **B-2 日付算術は NOT MODELLED / days は caller-established**: 起算日・暦計算・繰り下げは扱わず、`days : Nat` を入力として `<= 20` を判定する設計（BC-5）。
- **B-3 「適宜」の裁量は NOT MODELLED**: 具体的な納付期限の選択は扱わず、上限チェックのみ（BC-5）。
- **B-4 境界は `<=`（「以内」は含む）**: 自前抽出の「二十日以内」= 20 と、doc-comment / Spec の `days <= 20` が一致。19/20/21 のカーネル還元結果（BC-3）と矛盾しない。

#### UNRESOLVED — 2 件

- **U-1 例外条項の射程（「法令その他の定」の定義・適用関係）**: 未形式化自体は B-1 のとおり明示済みだが、pinned 第18条は例外を文言上持つだけで、何が「法令その他の定」に該当し上限 20 日を上書きし得るかは本原文のみでは確定できない。他要目・通則法の解釈を要し、**人間の法律専門家による確認を要する**。数値 20 の一致（CONFIRMED = 0）には影響しない。
- **U-2 日数起算の慣行（初日算入／不算入等）と暦上の取扱い**: 未形式化自体は B-2 のとおり明示済みだが、「調査決定の日から二十日以内」の起算日算入方法・土日祝日等の繰り下げは他の法令（民法・通則法等の期間計算規則）に依存し、pinned 本条のみでは確定できない。**人間の法律専門家を要する**。モデル値 20 と境界判定（CONFIRMED = 0）には影響しない。

### BC-7. 結論・履歴保全

- pinned 第18条の「二十日以内」を自前パーサで **20** と直接抽出し、2/200 の桁違いを明示除外。`maxDaysAfterDecision = 20` / `isWithinDeadline = days <= 20` と一致。**CONFIRMED = 0**、needle 2/2 FOUND（needle 内 U+3000 = 0、Article 18 flat も 0）、境界反例 0 件、公理依存 0 件（7/7 axiom-free、exit code 0）。
- 例外・日付算術・「適宜」の裁量の未形式化を確認（B-1〜B-3、法的取扱いは U-1 / U-2 として人間の法律専門家に委ねる）。
- 既存レビュー履歴 **52 件**（Batch G〜BB 含む）は**すべて保持**。本セクションのみを末尾に連結した。追記後レビュー件数は coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` で **53 件**（52 → 53、要求の 53 以上を満たす）。
- 書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。Lean モジュール / `data/*` は読み取り専用。commit / push / merge / ブランチ切替は行っていない。一時ファイルはすべて削除した。

> **本レビューは機械的独立照合（pinned 原文の直接 parse・漢数字の自前 Arabic 変換・needle 自前正規化検証・カーネル `by decide` 走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。


## Batch BD review (2026-11-22) — 不当廉売関税率政令 art.2 / AntiDumpingRate952.lean (95.2%) · cycle-59 独立照合

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。担当の STAGING（`STAGING_ANTIDUMP952.md`）／doc-comment／coordinator 要約は**信じず**、pinned 原文から直接・独立に再抽出して照合した。
- **対象（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/AntiDumpingRate952.lean`（`namespace JapanTaxLaw.AntiDumpingRate952`、名前付き宣言 `ratePerMille` / `dutyYen` と各 `example`）。
- **一次資料（pinned・改変禁止）**: `data/raw/507CO0000000095_20250703_507CO0000000240.law.json`（law_id `507CO0000000095` / revision `507CO0000000095_20250703_507CO0000000240`、政令「黒鉛電極に対して課する不当廉売関税に関する政令」）。
- **操作制約の遵守**: commit / push / merge / ブランチ切替は一切行っていない。Lean モジュール・`data/*` は読み取りのみ。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾に本セクションを追記）。

### BD-1. pinned 原文からの独立抽出（九十五・二 = 95.2% → 952/1000）

- `law_full_text` の `MainProvision` 配下で `tag="Article"` かつ `attr.Num="2"` を直接走査し、リーフ文字列を文書順に連結。得られた art.2 逐語（生・正規化とも **54 文字、U+3000 = 0**）:
  - `（税率）第二条特定貨物又は暫定不当廉売関税賦課貨物に課する不当廉売関税の税率は、九十五・二パーセントとする。`
- この逐語文字列から自前の漢数字パーサで `([〇一二三四五六七八九十百千]+)・([〇一二三四五六七八九])パーセント` を抽出: 整数部 `九十五` = **95**、小数部 `二` = **2** → **95.2 パーセント**（厳密分数 `476/5`）。百分率を率に直すと `476/500 = 119/125 = 0.952`、千分率で **952/1000**。したがって `ratePerMille = 952` は原文から独立に導かれる（EXTRACT_MATCH = True）。
- 照合: `def ratePerMille : Nat := 952`、`def dutyYen (value : Money) : Money := value * ratePerMille / 1000`（`Money = Nat`、自然数除算＝切捨て）。税率定数・算術式とも原文から導いた値と一致。
- **桁違いの明示除外**: `九・五二` / `九・五二パーセント`（9.52%＝0.0952＝95.2/1000 相当の誤読）、`九百五十二` / `九百五十二パーセント`（952%＝9520/1000 相当の 10 倍誤読）は art.2 正規化テキストにも全文にも **0 回**。原文は `九十五・二パーセント` のみ（art.2 に 1 回、全文に 1 回）。よって **9.52% および 9520/1000 は明示的に除外**され、952/1000 が唯一の抽出値。

### BD-2. needle 健全性（CI `checks()` の実文字列 2 本を自前正規化原文で検証）

- needle は手打ちせず `scripts/ci/transcription_audit.py::checks()` を Python で import し、cycle-59 エントリ（`name="AntiDumpingRate952.lean"` / `law_id="507CO0000000095"` / `kind="file"` / `art=None`）に組み込まれた**実文字列 2 本**を取得（STAGING の記載は未使用）。
- 自前で `law_full_text` を平坦化し `re.sub(r"[\s\u3000]+", "", s)` で正規化（生 1,527 文字・U+3000 = 2 → 正規化 1,525 文字・U+3000 = 0）。CI の `contains()` / `_norm()` と同一条件。

| needle（CI 実文字列） | U+3000 | 全文（正規化） | art.2（正規化・54 文字） |
|---|---:|---|---|
| `九十五・二パーセント` | 0 | FOUND（1 回） | FOUND（1 回） |
| `不当廉売関税の税率は` | 0 | FOUND（1 回） | FOUND（1 回） |

- **結果: 2/2 FOUND、needle の U+3000 = 0**。art.2 逐語（U+3000 = 0）にも 2 本とも包含在。needle の健全性に問題なし。

### BD-3. 反例探索（Python 整数演算と Lean kernel `by decide` の二重確認）

| 入力 value | 期待 `value×952÷1000`（切捨て） | Python 独立計算 | Lean |
|---:|---:|---:|---|
| 0 | 0 | 0 | `example : dutyYen 0 = 0 := by decide`（モジュール内）✓ |
| 1000 | 952 | 952 | `example : dutyYen 1000 = 952 := by decide`（モジュール内）✓ |
| 2000 | 1904 | 1904 | `theorem bd_duty_2000 : dutyYen 2000 = 1904 := by decide`（監査用一時ファイル）✓ |
| 10000 | 9520 | 9520 | `example : dutyYen 10000 = 9520 := by decide`（モジュール内）／`bd_duty_10000` ✓ |

- すべて整合。**反例 0 件**。境界 `value = 1000` で 952 が得られ、誤読値（95 や 9520）が出ないことを確認。6000 その他の入力も `value*952//1000` の単調性・整合性に反例なし。

### BD-4. 公理監査

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\bd_axiom_probe.lean` を作成し、対象モジュールの全名前付き宣言（`ratePerMille`, `dutyYen`）および kernel-decide 反例 2（`bd_duty_2000`, `bd_duty_10000`）に `#print axioms` を実行（`lake env lean`、**exit code 0**）。監査後、一時ファイルは削除済み。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 4（すべて `"does not depend on any axioms"`） |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |

- → 禁止公理は一切検出されず、**propext も 0**。公理監査は合格。

### BD-5. 分類（CONFIRMED / BY-DESIGN / UNRESOLVED）

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **5** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

**CONFIRMED（0 件）**: 税率定数 952/1000、税額算術 `value*952/1000`、needle 2/2、反例 4/4、公理監査のいずれも pinned 原文との食い違い・不整合なし。モデル値の誤りは検出されなかった。

**BY-DESIGN（5 件）**:

- **B-1 税率定数のみを扱うスライス**: doc-comment の「本スライスは税率定数のみを扱う」どおり、`ratePerMille` と `dutyYen` は与えられた `value` への税率適用のみ。原文 art.2 の税率（95.2%）に忠実であり、境界として明示済み。
- **B-2 特定貨物の認定は NOT MODELLED**: doc-comment に明記。art.1 の「特定貨物」定義・別表の生産者別税率等は含めない。未形式化を**確認**（＝スコープ宣言どおりで欠陥ではない）。
- **B-3 課税価格の算定は NOT MODELLED**: `dutyYen` の `value : Money` は caller-established（呼び出し側で確定させる）入力。原文の課税価格算定 rule は本スライスに含まれない。未形式化を**確認**。
- **B-4 原産地判定は NOT MODELLED**: doc-comment に明記。art.3 の原産地証明書の提出等は扱わない。未形式化を**確認**。
- **B-5 自然数除算（切捨て）の採用は明示済み**: `dutyYen` は `value * 952 / 1000`（Nat 除算・切捨て）と doc-comment に明記。pinned art.2 は税率のみを定め端数規定を持たないため、モデル上の選択は透明。法的正当性は U-1 で保留。

**UNRESOLVED（2 件）**:

- **U-1 端数処理（切り捨て）の法的正当性**: pinned art.2 は「九十五・二パーセント」とのみ定め、端数処理の規定を持たない。不当廉売関税の税額計算で切り捨てが正しいかは pinned 原文のみでは決定不能。**人間の法律専門家による確認を要する**。税率定数 952/1000 の一致（CONFIRMED = 0）には影響しない。
- **U-2 未形式化要素の実務上の完全性**: B-2〜B-4 のとおり特定貨物認定・課税価格算定・原産地判定は未形式化（スコープ宣言済み）。本モデルは税率定数スライスであり、実際の関税額の法的確定に単独では使用できない。実務上どこまでを形式化すべきかは pinned 原文のみでは判断できず、**人間の法律専門家によるレビューを要する**。既存の税額モデル値（発見ゼロ）には影響しない。

### BD-6. 最終報告・総合判定

- pinned revision `507CO0000000095_20250703_507CO0000000240` の art.2 から独立抽出した税率は **95.2% = 952/1000**。`ratePerMille = 952` / `dutyYen(value) = value*952/1000` と完全一致し、**CONFIRMED = 0（発見ゼロ）**。9.52%・9520/1000 は明示的に除外した。
- **CONFIRMED: 0 件 / BY-DESIGN: 5 件 / UNRESOLVED: 2 件**。
- **needle 健全性: 2/2 FOUND、U+3000 = 0**（CI `checks()` 実文字列を自前正規化原文で検証）。
- **反例: 0〜0 / 1000→952 / 2000→1904 / 10000→9520、反例 0 件**。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` いずれも **0 件**（4 宣言すべて axiom-free、exit code 0）。監査用一時ファイルは削除済み。
- **特定貨物認定・課税価格算定（および原産地判定）の未形式化を確認**（B-2〜B-4／スコープ宣言どおり）。
- **追記後レビュー件数: 54 件**（既存 53 件＝Batch G〜BC をすべて保持 + 本 BD 1 件）。既存セクションは一切改変していない。
- Lean モジュール / `data/*` は読み取り専用を遵守。commit / push / merge / ブランチ切替なし。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。

> **本レビューは機械的独立照合（pinned 原文 parse・漢数字抽出・needle 実文字列照合・境界値走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。
## Batch BE review (2026-11-22) — 不当廉売関税率政令 art.2 / AntiDumpingRate372.lean (37.2%) · cycle-60 独立照合

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。担当の STAGING／doc-comment／coordinator 要約は**信じず**、pinned 原文から直接・独立に再抽出して照合した。
- **対象（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/AntiDumpingRate372.lean`（`namespace JapanTaxLaw.AntiDumpingRate372`、名前付き宣言 `ratePerMille` / `dutyYen` と各 `example`）。
- **一次資料（pinned・改変禁止）**: `data/raw/502CO0000000208_20200917_502CO0000000279.law.json`（law_id `502CO0000000208` / revision `502CO0000000208_20200917_502CO0000000279`、政令 art.2）。実ファイル size **10,511 bytes**。
- **操作制約の遵守**: commit / push / merge / ブランチ切替は一切行っていない。Lean モジュール・`data/*`・`scripts/*` は読み取りのみ。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾に本セクションを追記）。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` を Python で import し、cycle-60 エントリ（`name="AntiDumpingRate372.lean"` / `law_id="502CO0000000208"` / `kind="file"` / `art=None`）に実際に組み込まれた実文字列 2 本を取得（STAGING 記載は未使用）。

### BE-1. pinned 原文からの独立抽出（三十七・二 = 37.2% → 372/1000）

- `law_full_text` の `MainProvision` 配下で `tag="Article"` かつ `attr.Num="2"` を直接走査（pinned 内に **1 ノードのみ**、path `children[1].children[2].children[1]`）。`children` の string leaf のみを文書順に連結した art.2 逐語（生・正規化とも **54 文字、U+3000 = 0**）:
  - `（税率）第二条特定貨物又は暫定不当廉売関税賦課貨物に課する不当廉売関税の税率は、三十七・二パーセントとする。`
- 自前の漢数字パーサで `([〇一二三四五六七八九十百千]+)・([〇一二三四五六七八九])パーセント` を抽出: 整数部 `三十七` = **37**（三十=30＋七=7）、小数部 `二` = **2** → **37.2 パーセント**（厳密分数 186/5%）。百分率を率に直すと 186/500 = **93/250 = 0.372**、千分率で **372/1000**。したがって `ratePerMille = 372` は原文から独立に導かれる（**EXTRACT_MATCH = True**）。
- 照合: `def ratePerMille : Nat := 372`、`def dutyYen (value : Money) : Money := value * ratePerMille / 1000`（`Money = Nat`、自然数除算＝切捨て）。税率定数・算術式とも原文から導いた値と一致。
- **桁違いの明示除外**: `三・七二` / `三・七二パーセント`（3.72%＝372/10000 相当の誤読）、`三百七十二` / `三百七十二パーセント`（372%＝3720/1000 相当の 10 倍誤読）は art.2 正規化テキストにも全文（正規化 1,518 文字）にも **0 回**。原文は `三十七・二パーセント` のみ（art.2 に 1 回、全文に 1 回）。よって **3.72% および 3720/1000 は明示的に除外**され、372/1000 が唯一の抽出値。

### BE-2. needle 健全性（CI `checks()` の実文字列 2 本を自前正規化原文で検証）

- needle は手打ちせず `checks()` を import して cycle-60 エントリから取得。自前で `law_full_text` を平坦化し `re.sub(r"[\s\u3000]+", "", s)` で正規化（全文 1,518 文字・U+3000 = 0）。CI の `contains()` / `_norm()` と同一条件。

| needle（CI 実文字列） | 長 | U+3000 | 全文（正規化） | art.2（正規化・54 文字） |
|---|---:|---:|---|---|
| `三十七・二パーセント` | 10 | 0 | FOUND（1 回、offset 576） | FOUND（1 回、offset 40） |
| `不当廉売関税の税率は` | 10 | 0 | FOUND（1 回、offset 565） | FOUND（1 回、offset 29） |

- **結果: 2/2 FOUND、needle の U+3000 = 0**。art.2 逐語（U+3000 = 0）にも 2 本とも包含在。needle の健全性に問題なし。

### BE-3. 反例探索（Python 整数演算と Lean kernel `by decide` の二重確認）

| 入力 value | 期待 `value×372÷1000`（切捨て） | Python 独立計算 | Lean |
|---:|---:|---:|---|
| 0 | 0 | 0 | `example : dutyYen 0 = 0 := by decide`（モジュール内）✓ |
| 1000 | 372 | 372 | `example : dutyYen 1000 = 372 := by decide`（モジュール内）✓ |
| 2000 | 744 | 744 | `theorem be_duty_2000 : dutyYen 2000 = 744 := by decide`（監査用一時ファイル）✓ |
| 10000 | 3720 | 3720 | `example : dutyYen 10000 = 3720 := by decide`（モジュール内）✓ |

- すべて整合。**反例 0 件**。境界 `value = 1000` で 372 が得られ、誤読値（37 / 3720）が出ないことを確認。`value ∈ 0..100000` で単調性違反 **0 件**（Python）。

### BE-4. 公理監査

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\be_axiom_probe.lean` を作成し、対象モジュールの全名前付き宣言（`ratePerMille`, `dutyYen`）および kernel-decide 反例 5（`be_duty_0`, `be_duty_1000`, `be_duty_2000`, `be_duty_10000`, `be_rate`）に `#print axioms` を実行（`lake env lean`、**exit code 0**）。監査後、一時ファイルは削除済み。モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `noncomputable` / `unsafe` / `Quot.sound` / `propext` / `choice` の一致 **0 件**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 7（すべて `"does not depend on any axioms"`） |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |

- → 禁止公理は一切検出されず、**propext も 0**。公理監査は合格。

### BE-5. 分類（CONFIRMED / BY-DESIGN / UNRESOLVED）

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **5** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

**CONFIRMED（0 件）**: 税率定数 372/1000、税額算術 `value*372/1000`、needle 2/2、反例 4/4、公理監査のいずれも pinned 原文との食い違い・不整合なし。モデル値の誤りは検出されなかった。

**BY-DESIGN（5 件）**:

- **B-1 税率定数のみを扱うスライス**: doc-comment の「本スライスは税率定数のみを扱う」どおり、`ratePerMille` と `dutyYen` は与えられた `value` への税率適用のみ。原文 art.2 の税率（37.2%）に忠実であり、境界として明示済み。
- **B-2 特定貨物の認定は NOT MODELLED**: doc-comment に明記。art.1 の「特定貨物」定義・別表の生産者別税率等は含めない。未形式化を**確認**（＝スコープ宣言どおりで欠陥ではない）。
- **B-3 課税価格の算定は NOT MODELLED**: `dutyYen` の `value : Money` は caller-established（呼び出し側で確定させる）入力。原文の課税価格算定 rule は本スライスに含まれない。未形式化を**確認**。
- **B-4 原産地判定は NOT MODELLED**: doc-comment に明記。art.3 の原産地証明書の提出等は扱わない。未形式化を**確認**。
- **B-5 自然数除算（切捨て）の採用は明示済み**: `dutyYen` は `value * 372 / 1000`（Nat 除算・切捨て）と doc-comment に明記。pinned art.2 は税率のみを定め端数規定を持たないため、モデル上の選択は透明。法的正当性は U-1 で保留。

**UNRESOLVED（2 件）**:

- **U-1 端数処理（切り捨て）の法的正当性**: pinned art.2 は「三十七・二パーセント」とのみ定め、端数処理の規定を持たない。不当廉売関税の税額計算で切り捨てが正しいかは pinned 原文のみでは決定不能。**人間の法律専門家による確認を要する**。税率定数 372/1000 の一致（CONFIRMED = 0）には影響しない。
- **U-2 未形式化要素の実務上の完全性**: B-2〜B-4 のとおり特定貨物認定・課税価格算定・原産地判定は未形式化（スコープ宣言済み）。本モデルは税率定数スライスであり、実際の関税額の法的確定に単独では使用できない。実務上どこまでを形式化すべきかは pinned 原文のみでは判断できず、**人間の法律専門家によるレビューを要する**。既存の税額モデル値（発見ゼロ）には影響しない。

### BE-6. 最終報告・総合判定

- pinned revision `502CO0000000208_20200917_502CO0000000279` の art.2 から独立抽出した税率は **37.2% = 372/1000**。`ratePerMille = 372` / `dutyYen(value) = value*372/1000` と完全一致し、**CONFIRMED = 0（発見ゼロ）**。3.72%・3720/1000 は明示的に除外した。
- **CONFIRMED: 0 件 / BY-DESIGN: 5 件 / UNRESOLVED: 2 件**。
- **needle 健全性: 2/2 FOUND、U+3000 = 0**（CI `checks()` 実文字列を自前正規化原文で検証）。
- **反例: 0→0 / 1000→372 / 2000→744 / 10000→3720、反例 0 件**（単調性違反 0）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` いずれも **0 件**（7 宣言すべて axiom-free、exit code 0）。監査用一時ファイルは削除済み。
- **特定貨物認定・課税価格算定（および原産地判定）の未形式化を確認**（B-2〜B-4／スコープ宣言どおり）。
- **追記後レビュー件数: 55 件**（既存 54 件＝coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` に一致する Batch G〜BD ほかをすべて保持 + 本 BE 1 件）。既存セクションは一切改変していない。
- Lean モジュール / `data/*` / `scripts/*` は読み取り専用を遵守。commit / push / merge / ブランチ切替なし。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。

> **本レビューは機械的独立照合（pinned 原文 parse・漢数字抽出・needle 実文字列照合・境界値走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

---

## Batch BF review (2026-11-22)

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。担当の STAGING／doc-comment／coordinator 要約は**信じず**、pinned 原文から直接・独立に再抽出して照合した。
- **対象（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/SpecialUseExemption.lean`（`namespace JapanTaxLaw.SpecialUseExemption`、名前付き宣言 `rawMaterialUse` / `heatSourceUse` / `otherUse` / `isSpecifiedUse` と各 `example`）。
- **一次資料（pinned・改変禁止）**: `data/raw/341CO0000000005_20250401_507CO0000000006.law.json`（law_id `341CO0000000005` / revision `341CO0000000005_20250401_507CO0000000006`、石油ガス税法施行令 art.7）。
- **操作制約の遵守**: commit / push / merge / ブランチ切替は一切行っていない。Lean モジュール・`data/*`・`scripts/*` は読み取りのみ。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾に本セクションを追記）。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` を Python で読み出し、cycle-61 エントリ（`name="SpecialUseExemption.lean"` / `law_id="341CO0000000005"` / `kind="file"` / `art=None`）に実際に組み込まれた実文字列 2 本を取得（STAGING 記載は未使用）。

### BF-1. pinned 原文からの独立抽出（「原料用又は熱源用」の 2 用途）

- `law_full_text` を再帰走査し `tag="Article"` かつ `attr.Num="7"` のノードを直接抽出（pinned 内に **1 ノードのみ**、path `children[1].children[2].children[6]`）。当該ノードの子の文字列 leaf のみを文書順に連結した art.7 逐語（生・正規化とも **49 文字、U+3000 = 0**）:
  - `（特定用途免税の範囲）第七条法第十二条第一項に規定する政令で定める用途は、原料用又は熱源用とする。`
- 自前で用途トークンを列挙した結果、唯一の指定用途は `原料用`（offset 37）と `熱源用`（offset 42）の **2 つのみ**。`その他` は art.7 正規化テキストに **0 回**（原文は 2 用途のみを列挙し、第 3 の用途を含まない）。
  - **取り違えチェック**: 原文は `原料用 … 熱源用とする` の順（`原料用` の出現が `熱源用` より前、pos 37 < 42）。「原料用→熱源用の混入」すなわち熱源用が原料用の位置へ来る置換・入れ替えは **0 件**。逐語一致 `VERBATIM_MATCH = True`。
- 照合: 実装は `rawMaterialUse=0` / `heatSourceUse=1` / `otherUse=2` / `isSpecifiedUse(u) = (u==0 || u==1)`。原文の 2 用途が `rawMaterialUse` → `原料用`、`heatSourceUse` → `熱源用` へ正対応し、`otherUse=2` は「指定用途でない」ことを表す内部番兵であって第 3 の指定用途ではない。→ **EXTRACT_MATCH = True（発見ゼロ）**。

### BF-2. needle 健全性（CI `checks()` の実文字列 2 本を自前正規化原文で検証）

- needle は手打ちせず `checks()` の cycle-61 エントリから取得。自前で `law_full_text` の文字列 leaf を平坦化し `re.sub(r"[\s\u3000]+", "", s)` で正規化（全文 13,483 文字）して含有を数えた。CI の `contains()` / `_norm()` と同一条件。

| needle（CI 実文字列） | 長 | U+3000 | 全文（正規化） | art.7（正規化・49 文字） |
|---|---:|---:|---|---|
| `政令で定める用途は、原料用又は熱源用とする` | 21 | 0 | FOUND（1 回） | FOUND（1 回） |
| `特定用途免税の範囲）第七条` | 13 | 0 | FOUND（1 回） | FOUND（1 回） |

- **結果: 2/2 FOUND、needle の U+3000 = 0**。art.7 逐語（U+3000 = 0）にも 2 本とも包含在。needle の健全性に問題なし。

### BF-3. 反例探索（`by decide` による kernel 計算）

| 入力 u | 意味 | 期待 | Lean | 判定 |
|---:|---|---|---|---|
| 0 | 原料用 | true | `isSpecifiedUse 0 = true` ✓ | 一致 |
| 1 | 熱源用 | true | `isSpecifiedUse 1 = true` ✓ | 一致 |
| 2 | その他（番兵） | false | `isSpecifiedUse 2 = false` ✓ | 一致 |
| 3 | 未定義の値 | false | `isSpecifiedUse 3 = false` ✓ | 一致 |

- すべて `by decide` で kernel 計算確認（exit code 0）。**反例 0 件**。特に `u=2`（その他）および `u=3`（列挙外）が `true` とならないことを確認し、原文「2 用途のみ」と整合。

### BF-4. 公理監査

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\bf_axiom_probe.lean` を作成し、対象モジュールの全名前付き宣言（`rawMaterialUse`, `heatSourceUse`, `otherUse`, `isSpecifiedUse`）および kernel-decide 反例 7（`bf_spec_0`〜`bf_spec_3`, `bf_rm_0`, `bf_hs_1`, `bf_ot_2`）に `#print axioms` を実行（`lake env lean`、**exit code 0**）。監査後、一時ファイルは削除済み。モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `noncomputable` / `unsafe` / `choice` / `propext` / `Quot.sound` の一致 **0 件**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 11（すべて `"does not depend on any axioms"`） |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |

- → 禁止公理は一切検出されず、**propext も 0**。公理監査は合格。

### BF-5. 分類（CONFIRMED / BY-DESIGN / UNRESOLVED）

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **4** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

**CONFIRMED（0 件）**: 用途列挙（原料用・熱源用の 2 用途）、`isSpecifiedUse` の真偽、needle 2/2、反例 4/4、公理監査のいずれも pinned 原文との食い違い・不整合なし。モデル値の誤りは検出されなかった。

**BY-DESIGN（4 件）**:

- **B-1 用途列挙のみの bounded L4 モデル**: doc-comment どおり本モデルは原文 art.7 の「政令で定める用途」の列挙のみを扱う。税率・免税額・手続は扱わない。原文の 2 用途に忠実であり、境界として明示済み。
- **B-2 用途の Nat 列挙は内部エンコーディング**: `rawMaterialUse=0` / `heatSourceUse=1` / `otherUse=2` は原文に現れる数字ではなくモデル内部の表現。`otherUse=2` は「指定用途でない」ことを表す番兵であり、原文に存在する第 3 の用途ではない（BF-1 で確認）。→ スコープ宣言どおりで欠陥ではない。
- **B-3 石油ガスの種類・免税の適用要件（法12条1項）は NOT MODELLED**: doc-comment に明記。**未形式化を確認**（＝スコープ宣言どおりで欠陥ではない）。
- **B-4 原料用・熱源用の具体的認定手続は NOT MODELLED**: doc-comment に明記。**未形式化を確認**（同上）。

**UNRESOLVED（2 件）**:

- **U-1 「原料用」「熱源用」の認定基準の法的妥当性**: pinned art.7 は用途名を列挙するのみで、何をもって原料用／熱源用とするかの判定基準を持たない。本モデルの Bool 判定（`isSpecifiedUse`）は与えられた用途番号に対する写像であり、実務上の該当性判定ではない。認定基準の解釈は pinned 原文のみでは決定不能。**人間の法律専門家による確認を要する**。用途列挙の一致（CONFIRMED = 0）には影響しない。
- **U-2 未形式化要素（ガス種別・認定手続）の実務上の完全性**: B-3・B-4 のとおり石油ガスの種類・免税適用要件・具体的認定手続は未形式化（スコープ宣言済み）。本モデルは用途列挙スライスであり、実際の免税適用の法的確定に単独では使用できない。実務上どこまでを形式化すべきかは pinned 原文のみでは判断できず、**人間の法律専門家によるレビューを要する**。既存の用途列挙（発見ゼロ）には影響しない。

### BF-6. 最終報告・総合判定

- pinned revision `341CO0000000005_20250401_507CO0000000006` の art.7 から独立抽出した指定用途は **原料用・熱源用の 2 用途のみ**。`rawMaterialUse=0` / `heatSourceUse=1` / `otherUse=2` / `isSpecifiedUse(u)=u==0||u==1` と完全一致し、**CONFIRMED = 0（発見ゼロ）**。原文に「その他」は存在せず、用途の取り違えも 0 件。
- **CONFIRMED: 0 件 / BY-DESIGN: 4 件 / UNRESOLVED: 2 件**。
- **needle 健全性: 2/2 FOUND、U+3000 = 0**（CI `checks()` 実文字列を自前正規化原文で検証）。
- **反例: 0→true / 1→true / 2→false / 3→false、反例 0 件**（`by decide`）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` いずれも **0 件**（11 宣言すべて axiom-free、exit code 0）。監査用一時ファイルは削除済み。
- **ガス種別・認定手続の未形式化を確認**（B-3／B-4／スコープ宣言どおり）。
- **追記後レビュー件数: 56 件**（既存 55 件＝coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` に一致する Batch G〜BE ほかをすべて保持 + 本 BF 1 件）。既存セクションは一切改変していない。
- Lean モジュール / `data/*` / `scripts/*` は読み取り専用を遵守。commit / push / merge / ブランチ切替なし。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。

> **本レビューは機械的独立照合（pinned 原文 parse・用途トークン抽出・needle 実文字列照合・境界値走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。

---

## Batch BG review (2026-11-22)

- **レビュア役割**: Adversarial Review Agent（形式化担当から独立）。担当の STAGING／doc-comment／coordinator 要約は**信じず**、pinned 原文から直接・独立に再抽出して照合した。
- **対象（読み取り専用・本レビューで変更していない）**: `JapanTaxLaw/ForeignDesignation.lean`（`namespace JapanTaxLaw.ForeignDesignation`、名前付き宣言 `taiwan` / `otherCountry` / `isDesignatedForeign` と 2 つの `example`）。
- **一次資料（pinned・改変禁止）**: `data/raw/337CO0000000227_20260401_508CO0000000083.law.json`（law_id `337CO0000000227` / revision `337CO0000000227_20260401_508CO0000000083`、INVENTORY の `source_file` でも同一パスを確認）。pinned の `law_title` は「外国居住者等の所得に対する相互主義による所得税等の非課税等に関する法律施行令」（略称「外国居住者等所得相互免除法施行令」）であり、課題文の「関税定率法施行令」というラベルとは一致しない。ただし対象モジュール自身は「関税定率法施行令」を主張していないため、本レビューの照合（モジュール vs pinned 原文）には影響しない（下記 BY-DESIGN B-5）。
- **操作制約の遵守**: commit / push / merge / ブランチ切替は一切行っていない。Lean モジュール・`data/*`・`scripts/*` は読み取りのみ。書き換えたのは本ファイル `docs/ADVERSARIAL_REVIEW.md` のみ（末尾に本セクションを追記）。
- **needle 出所**: `scripts/ci/transcription_audit.py::checks()` の cycle-62 エントリ（`name="ForeignDesignation.lean"` / `law_id="337CO0000000227"` / `kind="file"` / `art=None`）から Python で実文字列 2 本を取得（STAGING 記載は未使用）。

### BG-1. pinned 原文からの独立抽出（指定外国「台湾」）

- `law_full_text` を再帰走査し、本則（`MainProvision`）内の `tag="Article"` ノード計 **39** を列挙。うち `Num="2"`（第二条）は **1 ノードのみ**。当該ノードの子の文字列 leaf を文書順に連結した art.2 逐語（生・自前正規化とも **39 文字、U+3000 = 0**）:
  - `（外国の指定）第二条法第二条第三号に規定する政令で指定する外国は、台湾とする。`
- 自前で国名トークンを列挙した結果、art.2 正規化テキスト中の国名は `台湾` の **1 つのみ**（出現 1 回）。他国の混入を検出するため `韓国 / 中国 / 香港 / 澳门 / 澳門 / 朝鮮 / 米国 / アメリカ / 英国 / フランス / ドイツ / フィリピン / シンガポール / タイ / インド` を走査し、**ヒット 0 件**。
  - **全文での `台湾` 出現は 3 回**（art.2 の指定 1 回＋附則の「改正後の別表中台湾に係る部分…」2 回）。附則の 2 回はいずれも台湾に係る部分の経過規定であり、別の国の指定ではない。art.2 の指定列挙は台湾 1 つだけであることに変わりはない。
- 照合: 実装は `taiwan=0` / `otherCountry=1` / `isDesignatedForeign(c) = (c == taiwan)`。原文の指定外国 `{台湾}` が `taiwan` へ正対応し、`otherCountry=1` は「指定外国でない」ことを表す内部番兵であって第 2 の指定外国ではない。→ **EXTRACT_MATCH = True（発見ゼロ）**。

### BG-2. needle 健全性（CI `checks()` の実文字列 2 本を自前正規化原文で検証）

- needle は手打ちせず `checks()` の cycle-62 エントリから取得。自前で `law_full_text` の文字列 leaf を平坦化し `re.sub(r"[\s\u3000]+", "", s)` で正規化（全文 49,837 文字 → 正規化 49,778 文字）して含有を数えた。CI の `contains()` / `_norm()` と同一条件。

| needle（CI 実文字列） | 長 | U+3000 | 全文（自前正規化） | art.2（自前正規化・39 文字） |
|---|---:|---:|---|---|
| `政令で指定する外国は、台湾とする` | 16 | 0 | FOUND（1 回） | FOUND（1 回） |
| `外国の指定）第二条` | 9 | 0 | FOUND（1 回） | FOUND（1 回） |

- **結果: 2/2 FOUND、needle の U+3000 = 0**。CI の `contains()` でも 2/2 True。art.2 逐語（U+3000 = 0）にも 2 本とも包含在。needle の健全性に問題なし。

### BG-3. 反例探索（`by decide` による kernel 計算）

| 入力 c | 意味 | 期待 | Lean | 判定 |
|---:|---|---|---|---|
| 0 | 台湾 | true | `isDesignatedForeign 0 = true` ✓ | 一致 |
| 1 | その他（番兵） | false | `isDesignatedForeign 1 = false` ✓ | 一致 |
| 2 | 列挙外 | false | `isDesignatedForeign 2 = false` ✓ | 一致 |
| 3 | 列挙外 | false | `isDesignatedForeign 3 = false` ✓ | 一致 |

- すべて `by decide` で kernel 計算確認（`lake env lean`、exit code 0）。**反例 0 件**。特に `c=1`（その他）および `c=2,3`（列挙外）が `true` とならないことを確認し、原文「指定外国は台湾のみ」と整合。

### BG-4. 公理監査

- 一時 Lean ファイル `C:\Users\junny\AppData\Local\Temp\opencode\bg_axiom_probe.lean` を作成し、対象モジュールの全名前付き宣言（`taiwan`, `otherCountry`, `isDesignatedForeign`）および kernel-decide 反例 6（`bg_taiwan_def`, `bg_other_def`, `bg_fdf_0`〜`bg_fdf_3`）に `#print axioms` を実行（`lake env lean`、**exit code 0**）。監査後、一時ファイルは削除済み。モジュールの静的スキャンで `sorry` / `admit` / `axiom` / `classical` / `noncomputable` / `unsafe` / `choice` / `propext` / `Quot.sound` の一致 **0 件**。

| 監査項目 | 結果 |
|---|---|
| 走査宣言数 | 9（すべて `"does not depend on any axioms"`） |
| `Classical.choice` | **0 件**（不在） |
| `sorryAx` | **0 件**（不在） |
| `Quot.sound` | **0 件**（不在） |
| `propext` | **0 件**（不在） |

- → 禁止公理は一切検出されず、**propext も 0**。公理監査は合格。

### BG-5. 分類（CONFIRMED / BY-DESIGN / UNRESOLVED）

| 分類 | 件数 |
|---|---:|
| **CONFIRMED** | **0（ゼロ）** |
| **BY-DESIGN** | **5** |
| **UNRESOLVED** | **2** |

> **発見ゼロ（CONFIRMED = 0）を明示する。** 欠陥件数を手柄にしない。

**CONFIRMED（0 件）**: 指定外国の列挙（台湾 1 つのみ）、`isDesignatedForeign` の真偽、needle 2/2、反例 4/4、公理監査のいずれも pinned 原文との食い違い・不整合なし。モデル値の誤りは検出されなかった。

**BY-DESIGN（5 件）**:

- **B-1 指定外国列挙のみの bounded L4 モデル**: doc-comment どおり本モデルは原文 art.2 の「政令で指定する外国」の列挙のみを扱う。税率・免税額・手続は扱わない。原文の 1 外国に忠実であり、境界として明示済み。
- **B-2 国の Nat 列挙は内部エンコーディング**: `taiwan=0` / `otherCountry=1` は原文に現れる数字ではなくモデル内部の表現。`otherCountry=1` は「指定外国でない」ことを表す番兵であり、原文に存在する第 2 の指定外国ではない（BG-1 で確認）。→ スコープ宣言どおりで欠陥ではない。
- **B-3 法2条3号の「外国居住者等」の定義・他の要件は NOT MODELLED**: doc-comment に明記。**未形式化を確認**（＝スコープ宣言どおりで欠陥ではない）。
- **B-4 台湾以外の地域の取扱い・条約上の地位は NOT MODELLED**: doc-comment に明記。**未形式化を確認**（同上）。附則に台湾に係る別表の経過規定が存在するが、本スコープ外。
- **B-5 課題文の law 名ラベルと pinned `law_title` の不一致**: 課題文は「関税定率法施行令 art.2」と呼ぶが、pinned スナップショットの `law_title` は外国居住者等所得相互免除法施行令である。対象モジュールは「関税定率法施行令」を主張せず（doc-comment は単に「政令 art.2」）、law_id / revision / 原文一致にも影響しない。→ モジュールの欠陥ではない（課題文側のラベル表記として記録）。

**UNRESOLVED（2 件）**:

- **U-1 法2条3号の「外国居住者等」の定義・該当性判定の法的妥当性**: pinned art.2 は「法第二条第三号に規定する政令で指定する外国」と規定するのみで、法2条3号の定義内容（外国居住者等の範囲・要件）は当該スナップショット内にない。本モデルの Bool 判定（`isDesignatedForeign`）は与えられた国番号に対する写像であり、実務上の該当性判定ではない。定義の解釈は pinned 原文（art.2）のみでは決定不能。**人間の法律専門家による確認を要する**。列挙の一致（CONFIRMED = 0）には影響しない。
- **U-2 台湾の条約上の地位・台湾以外の地域の取扱いの実務上の完全性**: B-4 のとおり条約上の地位・台湾以外の地域の取扱いは未形式化（スコープ宣言済み）。本モデルは指定外国列挙スライスであり、実際の非課税適用の法的確定に単独では使用できない。実務上どこまでを形式化すべきかは pinned 原文のみでは判断できず、**人間の法律専門家によるレビューを要する**。既存の列挙（発見ゼロ）には影響しない。

### BG-6. 最終報告・総合判定

- pinned revision `337CO0000000227_20260401_508CO0000000083` の art.2 から独立抽出した指定外国は **台湾のみ（1 つ）**。`taiwan=0` / `otherCountry=1` / `isDesignatedForeign(c)=c==0` と完全一致し、**CONFIRMED = 0（発見ゼロ）**。他国の混入 0 件、取り違え 0 件。
- **CONFIRMED: 0 件 / BY-DESIGN: 5 件 / UNRESOLVED: 2 件**。
- **needle 健全性: 2/2 FOUND、U+3000 = 0**（CI `checks()` cycle-62 実文字列を自前正規化原文で検証）。
- **反例: 0→true / 1→false / 2→false / 3→false、反例 0 件**（`by decide`）。
- **公理結果**: `Classical.choice` / `sorryAx` / `Quot.sound` / `propext` いずれも **0 件**（9 宣言すべて axiom-free、exit code 0）。監査用一時ファイルは削除済み。
- **法2条3号の定義・条約上の地位の未形式化を確認**（B-3／B-4／スコープ宣言どおり）。
- **追記後レビュー件数: 57 件**（既存 56 件＝coverage ledger regex `^## (?:Batch [A-Z]|Art\.\d+|国税徴収法|Article-pinned)[^\n]*review` に一致する Batch G〜BF ほかをすべて保持 + 本 BG 1 件）。既存セクションは一切改変していない。
- Lean モジュール / `data/*` / `scripts/*` は読み取り専用を遵守。commit / push / merge / ブランチ切替なし。書き換えたのは `docs/ADVERSARIAL_REVIEW.md` のみ。

> **本レビューは機械的独立照合（pinned 原文 parse・国名トークン抽出・needle 実文字列照合・境界値走査・`#print axioms` 監査）であり、人間の法律専門家によるレビューではない。** 法的な妥当性・解釈の最終判断は専門家に委ねる。本レビューをもって法的レビューを完了したものとはみなさない。一時ファイルは削除済み。
