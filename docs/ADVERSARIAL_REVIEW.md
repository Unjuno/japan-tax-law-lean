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
