# STAGING — W-W（登録免許税法 別表第一（二）四〜四の四：ダム使用権・公共施設等運営権・樹木採取権・漁港水面施設運営権の手数料モデル）受け渡しメモ

> 実装担当 W-W からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistryPropertyRightsFees.lean` | 新規 |
| `JapanTaxLaw/RegistryPropertyRightsFeesSpec.lean` | 新規 |
| `JapanTaxLaw/RegistryPropertyRightsFeesTests.lean` | 新規 |
| `docs/STAGING_WW.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
amendment enforcement date `2026-11-01`。
担当範囲原文: `reg_prop_B.txt`（四〜四の四、正規化済み・UTF-8、2,694 文字、temp）。

Namespace note: 新規モジュールは dedicated sub-namespace
`JapanTaxLaw.RegistryPropertyRightsFees` を使用（`Money = Nat` は
`open JapanTaxLaw.TaxFinance` で参照）。他ワーカー（W-V / W-X 等）および既存
`Registry*` モジュールの名前空間と衝突しません。

### 原文範囲の申告

* 担当は **四 ダム使用権 / 四の二 公共施設等運営権 / 四の三 樹木採取権 /
  四の四 漁港水面施設運営権** の 4 権利のみ。原文は正規化後 2,177 文字で、
  pinned JSON の正規化テキスト（211,508 文字）に **1 回だけ** 出現（offset 122951）。
* 直後の **「五 工場財団、鉱業財団、…」（千分の二・五／千分の一・五／三万円／六千円等）
  および「六」は範囲外** でモデル化していません。金額のでっち上げはしていません。
* 4 権利の手数料体系は同一で、（三）（四）（五）（六）（七）イの文言は 4 権利で
  バイト一致します。唯一の文言差は **四の二 公共施設等運営権の（二）イが
  「法人の合併による移転の登録」（「相続又は」を含まない）** である点で、
  doc-comment に記録しました（率は 1/1000 で算術は同一）。

## 1. 追加した def 一覧

`namespace JapanTaxLaw.RegistryPropertyRightsFees`、`open JapanTaxLaw.TaxFinance`。
定額型は `Money` 定数（1 件あたり）、割合型は税率定数 `TaxRate ⟨X, 1000, by decide⟩`
と税額関数 `rate.applyFloor base`（= 課税標準 × X / 1000、切り捨て）としてモデル化しました。
件数を掛ける Nat 掛け算は行わず、件数・課税標準・該当性は caller-established です。

### 1a. 税率定数（16 本、分母すべて 1000）

| 権利 | 1/1000 | 5/1000 | 4/1000 | 2/1000 |
| --- | --- | --- | --- | --- |
| ダム使用権 | `damThousandthRate` | `damFiveThousandthsRate` | `damFourThousandthsRate` | `damTwoThousandthsRate` |
| 公共施設等運営権 | `pfcThousandthRate` | `pfcFiveThousandthsRate` | `pfcFourThousandthsRate` | `pfcTwoThousandthsRate` |
| 樹木採取権 | `treeThousandthRate` | `treeFiveThousandthsRate` | `treeFourThousandthsRate` | `treeTwoThousandthsRate` |
| 漁港水面施設運営権 | `portThousandthRate` | `portFiveThousandthsRate` | `portFourThousandthsRate` | `portTwoThousandthsRate` |

各率定数が対応する号（4 権利共通）:

* `…ThousandthRate` = 1/1000:（一）設定／（二）イ 相続・合併による移転／
  （四）イ 相続・合併による抵当権移転／（七）ロ 抵当権以外の権利の信託
  ※ 公共施設等運営権の（二）イは「法人の合併による移転の登録」。
* `…FiveThousandthsRate` = 5/1000:（二）ロ その他の原因による移転。
* `…FourThousandthsRate` = 4/1000:（三）抵当権の設定・強制競売・処分の制限等
  （債権金額又は極度金額）。
* `…TwoThousandthsRate` = 2/1000:（四）ロ その他の原因による抵当権移転／
  （五）根抵当権の一部譲渡・法人分割による移転（共有者の数で極度金額を除した金額）／
  （七）イ 抵当権の信託。

### 1b. 定額型 `Money` 定数（4 本、1 件あたり ¥1,000）

`damPerCaseFee` / `pfcPerCaseFee` / `treePerCaseFee` / `portPerCaseFee` = 1_000。
各権利の（六）抵当権の順位の変更（抵当権の件数）、（八）付記・仮・回復・更正／変更、
（九）登録の抹消（いずれも「件数一件につき千円」）を 1 本にまとめました。

### 1c. 税額関数（16 本、`(base : Money) → Money`）

各権利に `…ThousandthFee` / `…FiveThousandthsFee` / `…FourThousandthsFee` /
`…TwoThousandthsFee` を定義（接頭辞は `dam` / `pfc` / `tree` / `port`）。
いずれも対応する率定数の `applyFloor base`（切り捨て）です。

### 1d. 定理名（21 本）

well-definedness / positivity 20 本:
`damThousandthRate_den_pos` / `damFiveThousandthsRate_den_pos` /
`damFourThousandthsRate_den_pos` / `damTwoThousandthsRate_den_pos` / `damPerCaseFee_pos` /
`pfcThousandthRate_den_pos` / `pfcFiveThousandthsRate_den_pos` /
`pfcFourThousandthsRate_den_pos` / `pfcTwoThousandthsRate_den_pos` / `pfcPerCaseFee_pos` /
`treeThousandthRate_den_pos` / `treeFiveThousandthsRate_den_pos` /
`treeFourThousandthsRate_den_pos` / `treeTwoThousandthsRate_den_pos` / `treePerCaseFee_pos` /
`portThousandthRate_den_pos` / `portFiveThousandthsRate_den_pos` /
`portFourThousandthsRate_den_pos` / `portTwoThousandthsRate_den_pos` / `portPerCaseFee_pos`。

単調性 1 本: `rateFee_mono`（`propext` 依存、許容範囲）。

### 1e. Spec モジュール（21 def）

独立整数定式 20 本: `specDamThousandthFee` … `specPortPerCaseFee`
（impl の 16 税額関数 + 4 定額と 1 対 1、`(base * X) / 1000` または `1000`）。
一致確認 `agreeRegistryPropertyRightsFees : Bool`（12 点グリッドの `==` 一致を
`by decide` で確認）。Spec は impl の `TaxRate.applyFloor` を再利用しません。

### 1f. Tests モジュール

新規定理名なしの `example := by decide` のみ（全率リテラル・定額・端数境界
0/199/200/249/250/499/500/999/1000/1001/12345/1_000_000 をカバー）。

### 名前付き宣言の合計

| ファイル | def | theorem | example |
| --- | --- | --- | --- |
| `RegistryPropertyRightsFees.lean` | 36 | 21 | 65 |
| `RegistryPropertyRightsFeesSpec.lean` | 21 | 0 | 21 |
| `RegistryPropertyRightsFeesTests.lean` | 0 | 0 | 112 |
| **合計** | **57** | **21** | **198** |

名前付き宣言（def + theorem）は **78 本**、kernel-decide の `example` は **198 本**。

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（空白・全角空白除去、`_norm` と同一条件）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で `.find()` が成功します（下記 §3）。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles":
[
  "ダム使用権の登録（ダム使用権の信託の登録を含む。）（一）設定の登録ダム使用権の価額千分の一（二）移転の登録イ相続又は法人の合併による移転の登録ダム使用権の価額千分の一ロその他の原因による移転の登録ダム使用権の価額千分の五（三）抵当権の設定、強制競売、競売、強制",
  "（三）抵当権の設定、強制競売、競売、強制管理若しくは担保不動産収益執行に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登録債権金額又は極度金額千分の四（四）抵当権の移転の登録イ相続又は法人の合併による移転の登録債権金額又は極度金額千",
  "併による移転の登録債権金額又は極度金額千分の一ロその他の原因による移転の登録債権金額又は極度金額千分の二（五）根抵当権の一部譲渡又は法人の分割による移転の登録一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二（六）抵当権の順位の変更の登録抵当",
  "分の二（六）抵当権の順位の変更の登録抵当権の件数一件につき千円（七）信託の登録イ抵当権の信託の登録債権金額又は極度金額千分の二ロ抵当権以外の権利の信託の登録ダム使用権の価額千分の一（八）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録",
  "復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（七）までに掲げるものを除く。）ダム使用権の件数一件につき千円（九）登録の抹消ダム使用権の件数一件につき千円四の二公共施設等運営権の登録（公共施設等運営権の信託の登録を含む。）（一）設定の登",
  "営権の信託の登録を含む。）（一）設定の登録公共施設等運営権の価額千分の一（二）移転の登録イ法人の合併による移転の登録公共施設等運営権の価額千分の一ロその他の原因による移転の登録公共施設等運営権の価額千分の五（三）抵当権の設定、強制競売、競売、強制管理若しくは担",
  "設定、強制競売、競売、強制管理若しくは担保不動産収益執行に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登録債権金額又は極度金額千分の四（四）抵当権の移転の登録イ相続又は法人の合併による移転の登録債権金額又は極度金額千分の一ロその他",
  "登録債権金額又は極度金額千分の一ロその他の原因による移転の登録債権金額又は極度金額千分の二（五）根抵当権の一部譲渡又は法人の分割による移転の登録一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二（六）抵当権の順位の変更の登録抵当権の件数一件に",
  "当権の順位の変更の登録抵当権の件数一件につき千円（七）信託の登録イ抵当権の信託の登録債権金額又は極度金額千分の二ロ抵当権以外の権利の信託の登録公共施設等運営権の価額千分の一（八）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これら",
  "又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（七）までに掲げるものを除く。）公共施設等運営権の件数一件につき千円（九）登録の抹消公共施設等運営権の件数一件につき千円四の三樹木採取権の登録（樹木採取権の信託の登録を含む。）（一）設定の登録樹木採",
  "託の登録を含む。）（一）設定の登録樹木採取権の価額千分の一（二）移転の登録イ相続又は法人の合併による移転の登録樹木採取権の価額千分の一ロその他の原因による移転の登録樹木採取権の価額千分の五（三）抵当権の設定、強制競売、競売、強制管理若しくは担保不動産収益執行に",
  "売、強制管理若しくは担保不動産収益執行に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登録債権金額又は極度金額千分の四（四）抵当権の移転の登録イ相続又は法人の合併による移転の登録債権金額又は極度金額千分の一ロその他の原因による移転の",
  "度金額千分の一ロその他の原因による移転の登録債権金額又は極度金額千分の二（五）根抵当権の一部譲渡又は法人の分割による移転の登録一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二（六）抵当権の順位の変更の登録抵当権の件数一件につき千円（七）信託",
  "登録抵当権の件数一件につき千円（七）信託の登録イ抵当権の信託の登録債権金額又は極度金額千分の二ロ抵当権以外の権利の信託の登録樹木採取権の価額千分の一（八）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち（一）から（",
  "更の登録（これらの登録のうち（一）から（七）までに掲げるものを除く。）樹木採取権の件数一件につき千円（九）登録の抹消樹木採取権の件数一件につき千円四の四漁港水面施設運営権の登録（漁港水面施設運営権の信託の登録を含む。）（一）設定の登録漁港水面施設運営権の価額千",
  "一）設定の登録漁港水面施設運営権の価額千分の一（二）移転の登録イ相続又は法人の合併による移転の登録漁港水面施設運営権の価額千分の一ロその他の原因による移転の登録漁港水面施設運営権の価額千分の五（三）抵当権の設定、強制競売、競売、強制管理若しくは担保不動産収益執",
  "、競売、強制管理若しくは担保不動産収益執行に係る差押え、仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登録債権金額又は極度金額千分の四（四）抵当権の移転の登録イ相続又は法人の合併による移転の登録債権金額又は極度金額千分の一ロその他の原因による移",
  "は極度金額千分の一ロその他の原因による移転の登録債権金額又は極度金額千分の二（五）根抵当権の一部譲渡又は法人の分割による移転の登録一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二（六）抵当権の順位の変更の登録抵当権の件数一件につき千円（七）",
  "更の登録抵当権の件数一件につき千円（七）信託の登録イ抵当権の信託の登録債権金額又は極度金額千分の二ロ抵当権以外の権利の信託の登録漁港水面施設運営権の価額千分の一（八）付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（これらの登録のうち",
  "正若しくは変更の登録（これらの登録のうち（一）から（七）までに掲げるものを除く。）漁港水面施設運営権の件数一件につき千円（九）登録の抹消漁港水面施設運営権の件数一件につき千円"
]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 20 本を一字も変えずに列挙）:

```python
yield ("登録免許税法 別表第一（二）四〜四の四（ダム使用権・公共施設等運営権・樹木採取権・漁港水面施設運営権）↔ RegistryPropertyRightsFees.lean",
       "342AC0000000035",
       "file", None,
       [ ...上記 needles 20 本を一字も変えずに列挙... ])
```

## 3. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistryPropertyRightsFees JapanTaxLaw.RegistryPropertyRightsFeesSpec JapanTaxLaw.RegistryPropertyRightsFeesTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド・CI・
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` →
  `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WWAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 22 件（20 positivity / well-definedness + `rateFee_mono` + `agreeRegistryPropertyRightsFees`）を走査。
  - `Classical.choice` / `sorryAx` は **0 件**。
  - `rateFee_mono` のみ `propext` に依存（`simp` 由来）。**`propext` は許容**のため問題なし。
  - 他 21 件は `does not depend on any axioms`。
- 原文逐語検証（needle を正規化テキストに対して Python `.find()`、出現回数も確認、
  `transcription_audit.py` の `_norm` / `contains` と同一条件）:
  - 担当範囲原文 `reg_prop_B.txt`（正規化後 2,177 文字）: **20/20 FOUND、MISS 0 件**。
  - pinned JSON `law_full_text`（正規化後 211,508 文字、原文全体が offset 122951 に
    1 回だけ出現）: **20/20 FOUND、MISS 0 件**。
  - 8 本の needle は pinned JSON 内で 4 回出現しますが、これは（三）〜（七）イの
    文言が 4 権利でバイト一致するためです（`.find()` は成功、監査 `contains` も成功）。
    残り 12 本は 1 回のみ出現。

### 逐語 FOUND / MISS 一覧（一字も変更せず）

| # | len | 結果(JSON) | scope@ | json@ | count |
| --- | --- | --- | --- | --- | --- |
| N01 | 130 | FOUND | 0 | 122951 | 1 |
| N02 | 130 | FOUND | 110 | 123061 | 4 |
| N03 | 130 | FOUND | 220 | 123171 | 4 |
| N04 | 130 | FOUND | 330 | 123281 | 1 |
| N05 | 130 | FOUND | 440 | 123391 | 1 |
| N06 | 130 | FOUND | 550 | 123501 | 1 |
| N07 | 130 | FOUND | 660 | 123068 | 4 |
| N08 | 130 | FOUND | 770 | 123178 | 4 |
| N09 | 130 | FOUND | 880 | 123831 | 1 |
| N10 | 130 | FOUND | 990 | 123941 | 1 |
| N11 | 130 | FOUND | 1100 | 124051 | 1 |
| N12 | 130 | FOUND | 1210 | 123077 | 4 |
| N13 | 130 | FOUND | 1320 | 123187 | 4 |
| N14 | 130 | FOUND | 1430 | 124381 | 1 |
| N15 | 130 | FOUND | 1540 | 124491 | 1 |
| N16 | 130 | FOUND | 1650 | 124601 | 1 |
| N17 | 130 | FOUND | 1760 | 123075 | 4 |
| N18 | 130 | FOUND | 1870 | 123185 | 4 |
| N19 | 130 | FOUND | 1980 | 124931 | 1 |
| N20 | 87 | FOUND | 2090 | 125041 | 1 |

**FOUND 20 / MISS 0**（両テキストで `.find()` 成功、長さ 87〜130 文字で指定の
60〜130 の範囲内）。needle は担当範囲原文の正規化文字列からオフセット指定で
一字も変えず抽出し、その後 pinned JSON に対して `.find()` しました。
アンカーの勝手な変更・正規化・文字変換はしていません。

## 4. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistryRealEstateFees*` / `RegistryDesignTrademarkFees*` 行の付近に追加）:
  ```text
  JapanTaxLaw/RegistryPropertyRightsFees.lean        # 登録免許税法 別表第一（二）四〜四の四（ダム使用権・公共施設等運営権・樹木採取権・漁港水面施設運営権：1/1000・5/1000・4/1000・2/1000・一件千円、課税標準・件数は caller-established）L4 モデル
  JapanTaxLaw/RegistryPropertyRightsFeesSpec.lean    # 同上 独立整数定式
  JapanTaxLaw/RegistryPropertyRightsFeesTests.lean   # 同上 退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）四〜四の四（RegistryPropertyRightsFees.lean：4 権利 ×（割合型 1/1000・5/1000・4/1000・2/1000 と一件千円の定額、丸めは切り捨て、課税標準・件数・該当性は caller-established）、五 工場財団等・六 は原文範囲外で非モデル化）
  ```

## 5. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistryPropertyRightsFees
import JapanTaxLaw.RegistryPropertyRightsFeesSpec
import JapanTaxLaw.RegistryPropertyRightsFeesTests
```

（他ワーカーの 3 件ずつと併せてメインが行数を確認してください。
W-W は `JapanTaxLaw.lean` を書き換えていません。他ワーカーのファイルには触れていません。）

## 6. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 走査 22 件、`Classical.choice` / `sorryAx` なし。1 件が `propext` 依存
  （許容範囲）。一時ファイルは削除済み。
- **逐語**: FOUND 20 / MISS 0（担当範囲原文・pinned JSON の両方、長さ 87〜130）。
- **def 数**: 名前付き宣言 78 本（impl 36 def + 21 定理、Spec 21 def）、Tests は
  新規定理名なしの `example := by decide` 112 本（3 ファイル合計 198 本）。
- **STAGING**: 本ファイル `docs/STAGING_WW.md` を作成済みです。
- これは別表第一（二）の四〜四の四に限る **小さなスライス**です。
  **完成・網羅を主張しません**。
- 「五 工場財団、鉱業財団、…」「六」は担当範囲原文に含まれますが担当外のため
  **非モデル化**です（§0 参照）。別表第一の他の号・他の別表、登録免許税法全体
  （免税・軽減規定、納税義務者、税率の特例等）は **NOT YET COVERED** です。
- 課税標準（価額／債権金額又は極度金額／共有者数で除した金額）・件数・登録の該当性・
  原因判定は caller-established な入力です。その算定・評価、件数掛け算、端数処理の
  詳細（通則法含む）は非モデル化です。
- `agreeRegistryPropertyRightsFees` は有限点（12 基底）の `==` 一致確認であり、
  法的意味の等価証明ではありません。転記監査は fidelity-only です。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2、+20 needles）、
  `JapanTaxLaw.lean` への import 追加（§5）、README / PROGRESS の 1 行追記（§4）、
  および全体ビルド・CI ゲートの実行は**すべてメインセッションの担当**です
  （W-W は実行していません）。
