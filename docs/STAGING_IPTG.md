# STAGING — IPTG（租税特別措置法施行令 第二十五条の十六 相続財産に係る譲渡所得の課税の特例）受け渡しメモ

> 実装担当 IPTG からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/InheritedPropertyTransferGain.lean` | 新規 |
| `JapanTaxLaw/InheritedPropertyTransferGainSpec.lean` | 新規 |
| `JapanTaxLaw/InheritedPropertyTransferGainTests.lean` | 新規 |
| `docs/STAGING_IPTG.md` | 新規（本ファイル） |

pinned source:
  law_id `332CO0000000043` / revision `332CO0000000043_20261101_507CO0000000127`
  （`data/raw/332CO0000000043_20261101_507CO0000000127.law.json` を確認）。
  amendment enforcement date `2026-11-01`。
担当範囲原文: `C6_inherit2516.txt`（art. 25の16、UTF-8、本文 1095 文字、
`==== 第二十五条の十六 LEN 1095` ヘッダ 1 行 + 本文 1 行）。原文は一字も変更せず
doc-comment と needle に転記（全角空白 U+3000 は含まない）。

名前空間は他モジュールと衝突しないよう **`JapanTaxLaw.InheritedPropertyTransferGain`**
としました（`SpecialMeasuresApportionment*` / `ResidentialTransferSpecialTax*` /
`SpecialMeasuresMisc*` は読むだけ、**触っていません**）。

## 1. 原文とモデル化

- 柱書（計算の中核）:
  「第一号に掲げる相続税額に第二号に掲げる割合を乗じて計算した金額とする。」
  → `inheritedTransferBase inheritanceTax ratio =
       inheritanceTax * ratio.num / ratio.den`（`TaxRate.applyFloor`、切り捨て）。
     一号の相続税額・二号の割合は caller-established。
- ただし書（上限）:
  「当該計算した金額が、…収入金額から…取得費及びその資産の譲渡に要した費用の額の
    合計額を控除した残額に相当する金額を超える場合には、その残額に相当する金額とし、
    当該収入金額が当該合計額に満たない場合には、当該計算した金額は、ないものとする。」
  → `inheritedResidualGain proceeds cost = max (proceeds - cost) 0`
     （Nat 減算により `proceeds < cost` なら 0 =「ないもの」）、
     `inheritedTransferGain ... = min (base) (residual)`。
     収入金額が合計額に満たなければ結果 0、`base > residual` なら残額を上限とする。
- 第一号（相続税額）:
  「国税通則法第二条第四号に規定する附帯税に相当する税額を除く。」
  → 附帯税相当額を除いた確定額を caller-established な入力として受け取る。
- 第二号（割合）:
  「のうちに当該譲渡をした資産の当該課税価格の計算の基礎に算入された価額の占める割合」
  → 割合そのものは caller-established な `TaxRate`（分子/分母）として受け取る。

射程外（overclaim 防止、doc-comment に明記済み）:
- 相続税額（一号）・二号の割合・収入金額・取得費・譲渡費用・特例の該当性は
  すべて **caller-established**。金額の認定・該当性判定は本モジュールの外で行い、
  Bool は算定式に入れていません。
- **二号の割合の具体的算定は NOT MODELLED**（下記 §9 参照）。
- 第一号の確定時点・修正申告/更正後の金額（第2項）、贈与税控除の読替え（第3項）、
  附帯税相当額の控除の具体的算定も **NOT MODELLED**。
- 原文は端数規定を持たない。Money = Nat の除算による**切り捨て**を丸め規則として
  明示（他モジュールの `applyFloor` と同一慣例）。解釈を保証するものではありません。
- 割合の分母 > 0 は `TaxRate.den_pos` により型で担保（退化ケースに法的意味があるとは
  主張しません）。転記監査は fidelity-only であり法的正しさを保証しません。

## 2. 追加した def / 定理一覧

`namespace JapanTaxLaw.InheritedPropertyTransferGain`、`open JapanTaxLaw.TaxFinance`。

| ファイル | 種別 | 名前 | 内容 |
| --- | --- | --- | --- |
| main | def | `transferCostTotal` | `acquisitionCost + transferExpenses`（原文の「合計額」） |
| main | def | `inheritedTransferBase` | `ratio.applyFloor inheritanceTax`（= `tax * num / den`） |
| main | def | `inheritedResidualGain` | `max (proceeds - cost) 0`（`proceeds < cost` なら 0） |
| main | def | `inheritedTransferGain` | `min (base) (residual)` |
| spec | def | `specInheritedTransferBase` | `num * inheritanceTax / den`（被乗数を入れ替えた独立整数定式） |
| spec | def | `specInheritedResidualGain` | `if proceeds ≤ cost then 0 else proceeds - cost`（独立定式） |
| spec | def | `specInheritedTransferGain` | `min (specBase) (specResidual)` |
| spec | def | `agreeInheritedTransferBase` | 実装 ≡ spec（5 点、端数切り捨てを含む） |
| spec | def | `agreeInheritedResidualGain` | 実装 ≡ spec（6 点、`p ≤ c` 境界を含む） |
| spec | def | `agreeInheritedTransferGain` | 実装 ≡ spec（8 点、3 境界 + 端数を含む） |
| tests | — | （`example` のみ、def/定理名は追加せず） | 境界・端数の `by decide` スモーク |

**公開 def 数: 10**（main 4 + spec 6）。定理数: 13（main）。
Tests は `example` のみ。公開宣言合計 23（`#print axioms` 走査数と一致）。

定理一覧（いずれもモデル性質のみ）:
`transferCostTotal_eq`, `inheritedTransferBase_eq`, `inheritedTransferBase_zero_tax`,
`inheritedTransferBase_zero_num`, `inheritedTransferBase_le_tax`,
`inheritedResidualGain_eq_sub`, `inheritedResidualGain_zero_when_le`,
`inheritedResidualGain_zero_when_lt`, `inheritedTransferGain_le_base`,
`inheritedTransferGain_le_residual`, `inheritedTransferGain_eq_base`,
`inheritedTransferGain_eq_residual`, `inheritedTransferGain_zero_when_proceeds_le_cost`。

各 def の smoke:
- `transferCostTotal`: 合計額（main + tests）。
- `inheritedTransferBase`: 零税額 / 分子 0 / num ≤ den で税額以下 / 端数切り捨て
  （main + tests + spec agree）。
- `inheritedResidualGain`: `p > c` → 差額、`p = c` → 0、`p < c` → 0
  （main + tests + spec agree）。
- `inheritedTransferGain`: base < 残額 → base、base > 残額 → 残額（上限）、
  base = 残額 → base（連続）、`proceeds < cost` → 0、`proceeds = cost` → 0、
  base = 0 → 0、端数（main + tests + spec agree）。

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle は原文から一字も変えず抽出。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
 needle は全角空白 U+3000 を含みません。各 needle は担当範囲原文・pinned JSON の
両方で出現回数 **1**（一意）を確認済みです（§6）。

```json
{
  "law_id": "332CO0000000043",
  "kind": "file",
  "title": null,
  "needles": [
    "第一号に掲げる相続税額に第二号に掲げる割合を乗じて計算した金額とする。",
    "当該計算した金額が、当該資産の譲渡所得に係る収入金額から同項の規定の適用がないものとした場合の当該資産の取得費及びその資産の譲渡に要した費用の額の合計額を控除した残額に相当する金額を超える場合には、その残額に相当する金額とし、当該収入金額が当該合計額に満たない場合には、当該計算した金額は、ないものとする。",
    "国税通則法第二条第四号に規定する附帯税に相当する税額を除く。",
    "のうちに当該譲渡をした資産の当該課税価格の計算の基礎に算入された価額の占める割合"
  ]
}
```

参考：現行スクリプト形式への変換例（name は任意、needles は上記 4 本をそのまま使用）:

```python
yield ("租税特別措置法施行令 art. 25の16（相続財産に係る譲渡所得の課税の特例）↔ InheritedPropertyTransferGain.lean",
       "332CO0000000043",
       "file", None,
       [ ...上記 needles 4 本を一字も変えずに列挙... ])
```

## 4. 期待 literal 増分

- IPTG 担当分: 新規 check **4 needles** なので **+4**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.InheritedPropertyTransferGain JapanTaxLaw.InheritedPropertyTransferGainSpec JapanTaxLaw.InheritedPropertyTransferGainTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `IPTGAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 公開宣言 **23 件**を走査。**13 件は axiom-free**。
  - 残り **10 件**は **`[propext]` のみ**（許可範囲）。
  - **`Classical.choice` も `sorryAx` も `Quot.sound` も一切なし**
    （出力 23 行を全文走査、いずれも 0 回。当初 `simp` 経由で `Quot.sound` が
    混入したが、`rfl` に置換して解消済み）。
- 原文逐語検証: 担当範囲原文を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した文字列、
  および pinned JSON `law_full_text` を `transcription_audit.py` と同一ロジックで平坦化・
  正規化した文字列に対し各 needle を Python `.find()` で検索 → **4/4 FOUND、MISS 0 件**
  （各 needle は両テキストで出現回数 **1**、§6）。原文本文は 1095 文字で
  ヘッダの `LEN 1095` と一致。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

| # | needle（先頭抜粋） | 結果 | 原文@ | json@ | 出現回数(原文/json) | len |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 第一号に掲げる相続税額に第二号に掲げる割合を…金額とする。（全文 35 字） | FOUND | 78 | 486952 | 1/1 | 35 |
| 2 | 当該計算した金額が、当該資産の譲渡所得に係る収入金額から…ないものとする。（全文 153 字） | FOUND | 117 | 486991 | 1/1 | 153 |
| 3 | 国税通則法第二条第四号に規定する附帯税に相当する税額を除く。（全文 30 字） | FOUND | 428 | 487302 | 1/1 | 30 |
| 4 | のうちに当該譲渡をした資産の当該課税価格の計算の基礎に算入された価額の占める割合（全文 40 字） | FOUND | 733 | 487607 | 1/1 | 40 |

- **FOUND 4 / MISS 0**。needle の勝手な変更・正規化・文字変換はしていません
  （原文の `附帯税`、`基因となつた` の歴史的仮名遣い、`占める割合` の文字使いも
  一字どおり保持。全角空白 U+3000 は含みません）。
- 4 本はいずれも相互に異なる文字列で、pinned JSON 全体で一意です。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧に追加）:
  ```text
  JapanTaxLaw/InheritedPropertyTransferGain.lean / -Spec.lean / -Tests.lean  # 租税特別措置法施行令 art. 25の16（相続財産に係る譲渡所得の課税の特例: 計算額=一号相続税額×二号割合、ただし書で収入金額−(取得費+譲渡費用)の残額を上限、収入金額<合計額なら0）の bounded L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  租税特別措置法施行令 art. 25の16（InheritedPropertyTransferGain.lean：一号相続税額×二号割合の計算額、ただし書の残額上限、収入金額<合計額なら0。金額・割合・該当性は caller-established、割合算定は NOT MODELLED、丸めは切り捨て）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.InheritedPropertyTransferGain
import JapanTaxLaw.InheritedPropertyTransferGainSpec
import JapanTaxLaw.InheritedPropertyTransferGainTests
```

（IPTG は `JapanTaxLaw.lean` を書き換えていません。`SpecialMeasuresApportionment*` /
`ResidentialTransferSpecialTax*` / `data/*` / L7 CSV には触れていません。）

## 9. NOT MODELLED の理由（二号の割合の具体的算定）

- 第二号の割合は「前号に掲げる相続税額に係る…者についての相続税法第十一条の二に
  規定する課税価格…のうちに当該譲渡をした資産の当該課税価格の計算の基礎に算入された
  価額の占める割合」と定義されており、**その具体的算定には他条文**
  （相続税法第十一条の二の課税価格、同法第十九条、第二十一条の十四〜第二十一条の十八、
  第十三条の読替え等）**への参照が必要**です。
- 本スライスは art. 25の16 の**算定式（一号×二号、ただし書の上限）のみ**を
  bounded L4 でモデル化するものであり、他条文の連鎖をここに展開すると
  スライスの境界を越えて網羅性を主張しかねないため、割合は
  **caller-established な `TaxRate` として受け取る**のみとし、
  具体的算定は **NOT MODELLED** と明記しました。
- 同様に、第一号の相続税額の確定時点・修正申告/更正後の金額（第2項）、
  贈与税控除の読替え（第3項）、附帯税相当額の控除の具体的算定も
  caller-established / NOT MODELLED です。

## 10. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 公開宣言 23 件のうち 13 件が axiom-free、10 件が `propext` 依存（許可範囲）。
  `Classical.choice` / `sorryAx` / `Quot.sound` なし（一時ファイルは削除済み）。
- **逐語**: FOUND 4 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 30〜153）。
- **def 数**: 10（main 4 + spec 6）。定理 13。Tests は `example` のみ。
- **STAGING**: 本ファイル `docs/STAGING_IPTG.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 租税特別措置法施行令 **第二十五条の十六 のみ**。他の条规定・他の特例計算は
  **NOT YET COVERED**（本スライスでは既存モジュールを変更していません）。
- 金額・割合・該当性はすべて caller-established とし、法的判断の自動化はしていません。
  丸めは切り捨てを採用したことを明示していますが、原文に端数規定がないため
  解釈を保証するものではありません。
- `agreeInheritedTransferBase` / `agreeInheritedResidualGain` / `agreeInheritedTransferGain`
  は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は `LEGAL_REVIEW_PENDING` のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+4）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（IPTG は実行していません）。
