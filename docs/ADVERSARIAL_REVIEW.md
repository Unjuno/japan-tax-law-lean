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
