# STAGING — W-E (租税特別措置法 art. 29の4 / 36 / 37の15 / 41の10 の bounded L4 モデル) 受け渡しメモ

> 実装担当 W-E からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/SpecialMeasuresMisc.lean` | 新規 |
| `JapanTaxLaw/SpecialMeasuresMiscSpec.lean` | 新規 |
| `JapanTaxLaw/SpecialMeasuresMiscTests.lean` | 新規 |
| `docs/STAGING_WE.md` | 既存ファイルを本タスク用に overwritten（本ファイル） |

pinned source: `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`
law id `332AC0000000026` / revision `332AC0000000026_20261101_507AC0000000013`
amendment enforcement date `2026-11-01`（DeemedCapitalGainsCost / ResidentialTransferSpecialTax /
ListedDividendWithholding / SpecialGiftRate と同一ピン）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\W_E_special.txt`
（4 条文・正規化済み・UTF-8: 第二十九条の四 / 第三十六条 / 第三十七条の十五 / 第四十一条の十）。

## 1. スコープ判断（明示的な計算式の有無）

原文を精読し、**明示的な計算式がある 3 条文のみ**をモデル化しました。

| 条 | 題名 | 判断 | 根拠 |
| --- | --- | --- | --- |
| 第二十九条の四 | 未払賃金課税の特例 | **NOT MODELLED** | 「…退職手当等の金額とみなして、同法の規定を適用する」のみ。みなし前の給与等・退職手当等の額に算定式はなく caller-established。def を作らない。 |
| 第三十六条 | 資産譲渡の課税の特例 | **モデル化（上限のみ）** | 「通じて五千万円の範囲内」という明示的上限（五千万円）を定数＋cap 関数でモデル化。ただし「政令で定めるところにより計算した金額」そのものは政令委任で数式なし → 非モデル化。 |
| 第三十七条の十五 | 貸付信託受益権等の譲渡 | **モデル化（第2項のみ）** | 第2項「収入金額が…合計額…に満たない場合におけるその不足額については…ないものとみなす」→ saturating Nat 減算で差益をモデル化。第1項「所得税を課さない」は免税宣言で数式なし → NOT MODELLED。 |
| 第四十一条の十 | 定期積金の給付補塡金等の分離課税 | **モデル化（第1項）** | 「その支払を受けるべき金額に対し百分の十五の税率を適用して所得税を課する」→ 金額 × 15/100 (floor)。 |

## 2. 追加した def 一覧

`namespace JapanTaxLaw`、`open JapanTaxLaw.TaxFinance`、`Money = Nat`。

### 実装モジュール（`SpecialMeasuresMisc.lean`）— model defs 5 本

| # | 条 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 41の10(1) | `benefitSupplementSeparateRate` | `TaxRate := ⟨15, 100, by decide⟩`（百分の十五） |
| 2 | 41の10(1) | `benefitSupplementSeparateTax` | `rate.applyFloor paymentAmount` = 金額 × 15 / 100（切り捨て） |
| 3 | 36 | `assetTransferDeductionCeiling` | `Money := 50_000_000`（五千万円） |
| 4 | 36 | `assetTransferDeductionCapped` | `min computed ceiling`（「通じて五千万円の範囲内」の上限強制。`computed` は政令計算額を caller-established で受け取り、政令の計算自体は非モデル化） |
| 5 | 37の15(2) | `lendingTrustGain` | `proceeds - cost`（saturating Nat 減算。不足額をないものとみなす） |

実装モジュールの定理 11 本（positivity 4・`*_eq` 接続 1・上限系 3・saturating 系 3）を付与。
各 def に相当する kernel-decided smoke を 9 件同梱。

### Spec モジュール（`SpecialMeasuresMiscSpec.lean`）— def 6 本

| # | 条 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 41の10 | `specBenefitSupplementTax` | 独立定式 `amount * 15 / 100`（impl は applyFloor 経由） |
| 2 | 36 | `specAssetTransferCapped` | 独立定式 `if computed ≤ 50_000_000 then computed else 50_000_000` |
| 3 | 37の15(2) | `specLendingTrustGain` | 独立定式 `if cost ≤ proceeds then proceeds - cost else 0` |
| 4 | 41の10 | `agreeBenefitSupplementTax` | `Bool`（impl ≡ spec の `==` 一致・8 点） |
| 5 | 36 | `agreeAssetTransferCapped` | `Bool`（impl ≡ spec・7 点） |
| 6 | 37の15(2) | `agreeLendingTrustGain` | `Bool`（impl ≡ spec・8 点） |

Spec に points 6 件＋`agree*` の `example … = true := by decide` 3 件。
Tests モジュール（`SpecialMeasuresMiscTests.lean`）は kernel-decided smoke 17 件のみ。
**合計 35 件の `by decide` smoke**（impl 9 / Spec 9 / Tests 17）。

### doc-comment に明記した射程外（overclaim 防止）

- 課税標準額・適用判定（居住者／恒久的施設を有する非居住者、支払時期、国内源泉該当性、
  給付補塡金等の該当性、二以上の規定の適用、貸付信託受益権等への該当、取得費と必要経費の別）
  は **caller-established**。Bool は計算式に入れていません。
- 政令細目（art. 36 の控除額の具体的計算・art. 37の15 の受益権等の範囲）は非モデル化。
- 丸めは条文に明記がないため、Nat 除算の切り捨てを丸め規則として明示（他モジュールの
  `applyFloor` と同一慣例）。復興特別所得税・確定申告調整は非対応。
- `agree*` は有限サンプルの `==` 一致確認であり、法的意味の等価証明ではありません。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から**一字も変えず**抽出し、
正規化（`_norm` = `re.sub(r"[\s　]+", "", …)`）済みの形で記載しています。
全 needle は担当範囲原文・pinned JSON の双方で **出現回数 1（一意）** を確認済みです。

```json
{
  "law_id": "332AC0000000026",
  "kind": "file",
  "title": null,
  "needles": [
    "給付補塡金、利息、利益又は差益（以下この条及び次条において「給付補塡金等」という。）については、同法第二十二条及び第八十九条並びに第百六十五条の規定にかかわらず、他の所得と区分し、その支払を受けるべき金額に対し百分の十五の税率を適用して所得税を課する",
    "控除すべき金額の合計額が五千万円を超えることとなるときは、これらの規定により控除すべき金額は、通じて五千万円の範囲内において、政令で定めるところにより計算した金額とする",
    "収入金額が当該貸付信託の受益権等の所得税法第三十三条第三項に規定する取得費及びその譲渡に要した費用の額の合計額又はその譲渡に係る必要経費に満たない場合におけるその不足額については、同法の規定の適用については、ないものとみなす",
    "貸付信託の受益権その他政令で定めるもの（次項において「貸付信託の受益権等」という。）の譲渡による所得については、所得税を課さない"
  ]
}
```

needle とモデルとの対応:

| # | 条 | 対応 | 長さ |
| --- | --- | --- | --- |
| 1 | 41の10(1) | `benefitSupplementSeparateRate` / `benefitSupplementSeparateTax`（百分の十五） | 125 |
| 2 | 36 | `assetTransferDeductionCeiling` / `assetTransferDeductionCapped`（五千万円の範囲内） | 84 |
| 3 | 37の15(2) | `lendingTrustGain`（不足額をないものとみなす） | 112 |
| 4 | 37の15(1) | NOT MODELLED 判定の doc-comment 根拠（免税宣言・数式なしの確認用） | 64 |

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本を一字も変えずに列挙）:

```python
yield ("租税特別措置法 art. 29の4/36/37の15/41の10 ↔ SpecialMeasuresMisc.lean",
       "332AC0000000026", "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-E 担当分: 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.SpecialMeasuresMisc JapanTaxLaw.SpecialMeasuresMiscSpec JapanTaxLaw.SpecialMeasuresMiscTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド。全体ビルド／CI／
  `run_python_gates.py` は**実行していません**。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WEAxiomProbeSpecial.lean` を approved temp dir に作成、
  `lake env lean` で実行後**削除済み**）: 主要 14 件を検査。
  - **11 件は `does not depend on any axioms`**。
  - 残り 3 件（`assetTransferDeductionCapped_le_ceiling` /
    `assetTransferDeductionCapped_le_computed` / `lendingTrustGain_zero_of_shortfall`）は
    **`propext` のみ**（許可範囲）。
  - **`Classical.choice` も `sorryAx` も一切なし**。
- 原文逐語検証: 4/4 **FOUND、MISS 0 件**。
  - `W_E_special.txt` を `_norm` と同一の `re.sub(r"[\s　]+", "", …)` で正規化した文字列に
    対して各 needle を `.find()` → 4/4 FOUND、出現回数すべて 1。
  - pinned JSON を `transcription_audit.py` の `text()` と同一ロジックで平坦化・正規化した
    文字列に対しても 4/4 FOUND、出現回数すべて 1（§6）。
  - law id `332AC0000000026` / revision `332AC0000000026_20261101_507AC0000000013` は
    pinned JSON 内に **FOUND**（条文本文ファイルにはメータデータは含まれないため、
    原文テキスト側での検索対象外）。
- .constant 一致: `assetTransferDeductionCeiling = 50,000,000`（五千万円）、
  `benefitSupplementSeparateRate = 15/100`（百分の十五）を原文フレーズと確認済み。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

| # | 条 | 結果 | art@ | json@ | 出現回数(art/json) | 長さ |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 41の10(1) | FOUND | 984 | 479924 | 1/1 | 125 |
| 2 | 36 | FOUND | 460 | 239870 | 1/1 | 84 |
| 3 | 37の15(2) | FOUND | 757 | 356846 | 1/1 | 112 |
| 4 | 37の15(1) | FOUND | 676 | 356765 | 1/1 | 64 |

- **FOUND 4 / MISS 0**。needle の長さは 64〜125 文字、4 本すべて相互に異なることを確認。
  アンカーの勝手な変更・正規化・文字変換はしていません（原文の「給付補塡金」の「塡」も
  そのまま保持）。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧末尾に追加）:
  ```text
  JapanTaxLaw/SpecialMeasuresMisc.lean / -Spec.lean / -Tests.lean  # 租税特別措置法 art. 29の4/36/37の15/41の10 の bounded L4 モデル（41の10 15%分離課税・36 五千万円上限・37の15(2) saturating 差益、29の4 と 37の15(1) は数式なしで NOT MODELLED）・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  租税特別措置法 art. 41の10/36/37の15（SpecialMeasuresMisc.lean：15%分離課税・五千万円上限・不足額みなしの saturating 差益をモデル化、art. 29の4 はみなし規定、37の15(1) は免税宣言でいずれも数式なし・NOT MODELLED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.SpecialMeasuresMisc
import JapanTaxLaw.SpecialMeasuresMiscSpec
import JapanTaxLaw.SpecialMeasuresMiscTests
```

（W-E は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

## 9. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さな bounded スライス**です。**完成・網羅を主張しません**。
- 担当は租税特別措置法の **4 条文のうち計算式のある 3 条文の一部计入れ**（36 は上限のみ、
  41の10 は第1項のみ、37の15 は第2項のみ）。**29の4 は NOT MODELLED**。
- **NOT MODELLED 理由（再掲）**:
  - **第二十九条の四**: 未払賃金を退職手当等と「みなして」所得税法を適用する規定で、
    金額算定の数式が条文にない。みなし対象の給与等・退職手当等の額は caller-established。
  - **第三十七条の十五 第1項**: 「所得税を課さない」という免税の宣言規定で数式がない。
  - **第三十六条の政令計算**: 「政令で定めるところにより計算した金額」は政令委任であり、
    条文に計算式がない。上限（五千万円の範囲内）のみをモデル化し、政令計算自体は
    caller-established・非モデル化。
- 課税標準額・適用判定・政令細目はすべて caller-established とし、法的判断の自動化はしていません。
  Bool は計算式に混入させていません。
- `agree*` は有限サンプルの `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+4）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-E は実行していません）。
