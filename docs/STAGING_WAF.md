# STAGING — W-AF（地方税法施行令 第四十四条の三／自動車税の税率に乗ずる割合・積雪軽減 の bounded L4 モデル）受け渡しメモ

> 実装担当 W-AF からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は**一切していません**。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxVehicleSnowRate.lean` | 新規 |
| `JapanTaxLaw/LocalTaxVehicleSnowRateSpec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxVehicleSnowRateTests.lean` | 新規 |
| `docs/STAGING_WAF.md` | 新規（本ファイル） |

pinned source: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
law id `325CO0000000245` / revision `325CO0000000245_20261101_508CO0000000083`
amendment enforcement date `2026-11-01`（`data/INVENTORY.json` の `current_revision` と一致確認済み）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\local_order_K2.txt`
（第四十四条の三・UTF-8・183 文字、先頭メタ行を除く本文）。

namespace は `JapanTaxLaw.LocalTaxVehicleSnowRate` に統一（他ワーカーと衝突なし）。

## 1. ⚠ 指示文と pinned 原文の相違（**要・親セッション最終確認**）

親セッションから渡された「内容」は：

> 「十分の十から…月数（当該月数が四を超える場合には、四）に**十分の一**を乗じて得た数を**減じた数**」

実装方針も「`10/10 − min(snowMonths,4) × 1/10`（原文の「十分の十」「十分の一」をそのまま分数で表現）」でした。

しかし **pinned 原文（pinned JSON および `local_order_K2.txt`）を一字も誤らず読むと**：

> 「十分の十から…月数（当該月数が四を超える場合には、四）に**十分の〇・七五**を乗じて得た数を**控除したものとする**」

すなわち相違は 2 箇所：

| 箇所 | 指示文の「内容」 | pinned 原文（採用） |
| --- | --- | --- |
| 月数に乗ずる割合 | 十分の**一**（1/10） | 十分の**〇・七五**（0.75/10 = 75/1000 = 3/40） |
| 末尾の動詞 | **減じた数** | **控除したものとする** |

対応方針：**「原文を一字も誤らず」かつ「needle を pinned JSON に対して検証し MISS なら停止報告」という絶対ルールを優先し、pinned 原文どおり 〇・七五（3/40）をモデル化しました。**
根拠：

1. 指示文の「十分の一…減じた数」を needle にすると pinned JSON で **MISS** となり、検証手順が停止する（下記 §5 で原文由来 needle は 4/4 FOUND）。
2. 「原文を一字も誤らず数値を確定」という明示指示は、数値（〇・七五 / 四）を原文から取るよう求めている。
3. 法人税等の実在条文と整合するのは 〇・七五 であり、1/10 を採用すると法的に誤った軽減率（最大 4 割減）になる。

**したがって、本スライスが正しい的前提は「[〇・七五 = 3/40] が正」です。親セッションが指示文の 1/10 を真として意図していた場合は、impl / Spec / Tests / needle の全てを作り直す必要があります。**

付随する逸脱：指示文は「割合は den=10 の Nat 分数」としましたが、〇・七五（0.75/10）を Nat の num/den で表すと `num = 7.5, den = 10` となり表現不能です。原文逐語を保つため通分して **den = 40**（`num = 40 − 3·min(s,4)`、spec は 75/1000）を採用しました。これが den=10 からの唯一の逸脱です。

## 2. 追加した def 一覧

`namespace JapanTaxLaw.LocalTaxVehicleSnowRate`、`open JapanTaxLaw.TaxFinance`、`Money = Nat`。

### 実装モジュール（`LocalTaxVehicleSnowRate.lean`）— def 6 本 / theorem 11 本 / smoke 21 件

| # | 対応原文 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 「十分の十」 | `fullRate` | `TaxRate := ⟨10, 10, by decide⟩`（= 1） |
| 2 | 「十分の〇・七五」 | `monthlyReductionRate` | `TaxRate := ⟨3, 40, by decide⟩`（0.75/10 = 75/1000 = 3/40、1 月あたり控除率） |
| 3 | 「当該月数が四を超える場合には、四」 | `capSnowMonths` | `min snowMonths 4` |
| 4 | 軽減割合の分子 | `snowReductionRatioNum` | `40 − 3 * capSnowMonths s`（Nat helper、positivity 証明用） |
| 5 | 軽減割合 | `snowReductionRatio` | `TaxRate := ⟨snowReductionRatioNum s, 40, by decide⟩`（0 < 割合 ≤ 1） |
| 6 | 税額 | `snowReducedTax` | `(snowReductionRatio s).applyFloor baseTax`（基準税額 × 割合・切り捨て） |

theorem 11 本：定数 numDen 2・cap 接続 2・ratio 接続 3・positivity 2・上限 1・税額接続 1。
positivity: `snowReductionRatioNum_pos`（分子 ≥ 28 > 0）/`snowReductionRatio_num_le_den`（≤ 40）。

数値例（原文どおり 〇・七五）:

| 月数 s | 割合 | 基準 1000 円の税額 |
| --- | --- | --- |
| 0 | 40/40 = 1.0 | 1000 |
| 1 | 37/40 = 0.925 | 925 |
| 4 | 28/40 = 0.7 | 700 |
| 5 以上（キャップ） | 28/40 = 0.7 | 700 |

（指示文の 1/10 なら s=4 は 6/10 = 0.6 となり、**0.7 とは異なる**。要確認。）

### Spec モジュール（`LocalTaxVehicleSnowRateSpec.lean`）— def 6 本 / points+agree 17 件

| # | 対応 | def 名 | 内容 |
| --- | --- | --- | --- |
| 1 | 十分の〇・七五 | `specMonthlyReductionPerThousand` | `75`（十進をそのまま 75/1000 として保持） |
| 2 | 月数キャップ | `specCapSnowMonths` | `if s ≤ 4 then s else 4`（impl の `min` と独立） |
| 3 | 軽減割合 | `specRatio` | `(1000 − 75·specCap(s), 1000)`（impl の 25 倍・同値） |
| 4 | 税額 | `specSnowReducedTax` | `base * (1000 − 75·specCap(s)) / 1000` |
| 5 | agree | `agreeSnowReductionRatio` | 交差掛け `n1*d2 == n2*d1`（9 点） |
| 6 | agree | `agreeSnowReducedTax` | impl ≡ spec の `==` 一致（9 点） |

### Tests モジュール（`LocalTaxVehicleSnowRateTests.lean`）— kernel-decided smoke 23 件のみ

月数 0/1/4/5(キャップ)/11、境界（端数切り捨て・キャップによる同値）、定数、税額を確認。

**合計 61 件の `by decide` smoke**（impl 21 / Spec 17 / Tests 23）。

### doc-comment に明記した射程外（overclaim 防止）

- 積雪月数 `snowMonths`・基準税額 `baseTax`・「積雪により自動車を運行の用に供することができないと認められる」該当性・法第百五十四条第三項の適用判定は **caller-established**。Bool は算定式に入れていません。
- **第2項**（「前項の月数は、暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる」）は月数の算定方法を定める規定で、`snowMonths` を caller が確定させる入力として扱うため **NOT MODELLED**（needle は逐語保持のみ）。
- 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文に割合適用後の丸め細目の明記はなく、他モジュールと同じ慣例を採用。
- `agree*` は有限サンプルの一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から**一字も変えず**抽出し、正規化（`_norm` = `re.sub(r"[\s　]+", "", …)`）済みの形で記載しています。**全角空白 U+3000 は一切含みません。**

```json
{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "（法第百五十四条第三項の自動車税の税率に乗ずる割合）第四十四条の三法第百五十四条第三項に規定する政令で定める割合は、十分の十から積雪により",
    "供することができないと認められる期間の月数（当該月数が四を超える場合には、四）に十分の〇・七五を乗じて得た数を控除したものとする",
    "〇・七五を乗じて得た数を控除したものとする。２前項の月数は、暦に従つて計算し、一月に満たない端数を生じたときは、切り捨てる",
    "割合は、十分の十から積雪により自動車を運行の用に供することができないと認められる期間の月数（当該月数が四を超える場合には、四）に十分の〇・七五を乗じて得た数"
  ]
}
```

needle とモデルとの対応:

| # | 対応 | 長さ | 原文 idx | JSON idx | 出現回数 |
| --- | --- | --- | --- | --- | --- |
| 1 | 条題・「十分の十から」まで（needle evidence） | 69 | 0 | 241741 | 1/1 |
| 2 | `capSnowMonths` / `monthlyReductionRate` / `snowReducedTax`（四キャップ・〇・七五・控除） | 64 | 78 | 241819 | 1/1 |
| 3 | 第2項（NOT MODELLED 判定の doc-comment 根拠・逐語保持） | 61 | 121 | 241862 | 1/1 |
| 4 | 軽減割合式全体（原文どおり 〇・七五 = 3/40 の確認用） | 78 | 54 | 241795 | 1/1 |

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本を一字も変えずに列挙）:

```python
yield ("地方税法施行令 art. 44の3（自動車税税率に乗ずる割合・積雪軽減）↔ LocalTaxVehicleSnowRate.lean",
       "325CO0000000245", "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- W-AF 担当分: 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください（起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxVehicleSnowRate JapanTaxLaw.LocalTaxVehicleSnowRateSpec JapanTaxLaw.LocalTaxVehicleSnowRateTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド。全体ビルド／CI／`run_python_gates.py` は**実行していません**。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、個別に grep し `sorry` / `admit` がないことを確認済み。）
- `#print axioms`（一時ファイル `WAFAxiomProbe.lean` を approved temp dir に作成、`lake env lean` で実行後**削除済み**）: 主要 13 件を検査。
  - **10 件は `does not depend on any axioms`**。
  - 残り 3 件（`capSnowMonths_le_four` / `snowReductionRatioNum_pos` / `snowReductionRatio_num_pos`）は **`propext` のみ**（許容範囲）。
  - **`Classical.choice` / `sorryAx` / `Quot.sound` は一切なし**。
  - 当初 `omega` を用いた positivity 証明に `Quot.sound` が入ったため、`Nat.mul_le_mul_left` + `Nat.lt_of_le_of_lt` + `Nat.sub_pos_of_lt`（および `Nat.sub_le`）による直接証明に置き換えて除去済み。検証用一時 Lean ファイル（`WAFOmegaTest.lean`）も削除済み。
- 原文逐語検証: **4/4 FOUND、MISS 0 件**。
  - `local_order_K2.txt` を `_norm` と同一の `re.sub(r"[\s　]+", "", …)` で正規化した文字列に対して各 needle を `.find()` → 4/4 FOUND、出現回数すべて 1。
  - pinned JSON を `transcription_audit.py` の `text()` と同一ロジックで平坦化・正規化した文字列（1,219,606 文字）に対しても 4/4 FOUND、出現回数すべて 1。
  - 全 needle は 61〜78 文字（指定 60〜130 の範囲内）、相互に異なり、**全角空白 U+3000 を含まない**。
  - law id `325CO0000000245` / revision `325CO0000000245_20261101_508CO0000000083` は `data/INVENTORY.json` の `current_revision` と一致確認済み。
- .constant 一致: `monthlyReductionRate = 3/40`（= 十分の〇・七五 = 75/1000）、`cap = 4`（四）、割合 = (40 − 3·min)/40 を原文フレーズと確認済み。**指示文の 1/10 ではない点を再掲（§1 参照）。**

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧末尾に追加）:
  ```text
  JapanTaxLaw/LocalTaxVehicleSnowRate.lean / -Spec.lean / -Tests.lean  # 地方税法施行令 art. 44の3（自動車税税率に乗ずる割合・積雪軽減）の bounded L4 モデル（原文どおり十分の十 − min(月数,4)×十分の〇・七五 = (40−3min)/40・den=40、tax=applyFloor・第2項月数算定は NOT MODELLED）・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 art. 44の3（LocalTaxVehicleSnowRate.lean：積雪軽減割合 (40−3min)/40＝〇・七五・4 月キャップ・applyFloor をモデル化、第2項の暦計算は月数を caller-established として NOT MODELLED。※指示文の「十分の一」と pinned 原文の「十分の〇・七五」が相違、原文を採用。要確認）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxVehicleSnowRate
import JapanTaxLaw.LocalTaxVehicleSnowRateSpec
import JapanTaxLaw.LocalTaxVehicleSnowRateTests
```

（W-AF は `JapanTaxLaw.lean` を書き換えていません。メインが統合してください。）

**加えて、§1 の原文/指示文の相違（〇・七五 vs 一）について採用方針の最終判断をお願いします。**

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さな bounded スライス**です。**完成・網羅を主張しません**。
- 担当は **第四十四条の三 1 条文のうち第1項の明示算術のみ**。第2項の月数算定（暦に従い一月未満切捨て）は NOT MODELLED、積雪月数・基準税額・該当性はすべて caller-established。
- **`〇・七五 = 3/40` を採用した判断は pinned 原文逐語を根拠としますが、親セッションの指示文（1/10）と矛盾するため、最終確認が残っています。** 指示が正しければ全ファイルの作り直しが必要です。
- `agree*` は有限サンプルの `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+4）、`JapanTaxLaw.lean` への import 追加（§7）、README / PROGRESS の 1 行追記（§6）、§1 の相違の最終判断、および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です（W-AF は実行していません）。
