# STAGING — W-AE（地方税法施行令 第四十三条の十三：軽油の引取りの際減少すべき軽油の数量）受け渡しメモ

> 実装担当 W-AE からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル / pinned source

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/LocalTaxLightOilQuantity.lean` | 新規 |
| `JapanTaxLaw/LocalTaxLightOilQuantitySpec.lean` | 新規 |
| `JapanTaxLaw/LocalTaxLightOilQuantityTests.lean` | 新規 |
| `docs/STAGING_WAE.md` | 新規（本ファイル） |

pinned source: `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
law id `325CO0000000245` / revision `325CO0000000245_20261101_508CO0000000083`
（地方税法施行令。amendment enforcement date `2026-11-01`）。

担当範囲原文（一字も誤らず、UTF-8）: `C:\Users\junny\AppData\Local\Temp\opencode\local_order_K1.txt`
（第四十三条の十三、156 文字。pinned JSON の当該本文は見出しを除く 117 文字）。

原文一字一句（見出し＋本文）:

> （法第百四十四条の十四第三項の引取りの際減少すべき軽油の数量）第四十三条の十三法第百四十四条の十四第三項に規定する政令で定める数量は、特約業者からの引取りに係る軽油については当該軽油の数量に百分の一を乗じて得た数量とし、元売業者からの引取りに係る軽油については当該軽油の数量に百分の〇・三を乗じて得た数量とする。

名前空間は `JapanTaxLaw.LocalTaxLightOilQuantity`（他モジュールと衝突しません）。

## 1. モデル化した減少数量

数量は `Quantity = Nat`（非負）。減少数量はいずれも切り捨て（floor）。

| 区分 | 原文の率 | 定式 | 定数／関数 |
| --- | --- | --- | --- |
| 特約業者 | 百分の一 | `quantity * 1 / 100` | `tokuteiReductionRate` = ⟨1, 100⟩ / `lightOilReduction` |
| 元売業者 | 百分の〇・三 | `quantity * 30 / 10000` | `motouriReductionRate` = ⟨30, 10000⟩ / `motouriLightOilReduction` |

**10 倍過大バグへの注意（明示）**: 「百分の〇・三」は小数点を含む率なので分母 10000・分子 30
（30/10000 = 3/1000 = 0.003 = 0.3%）で表現しました。分子 3 に分母 100／1000 を誤って
組むと 10 倍過大（3%）になります。ガードとして数量 1000 → 3（正）／ 30（誤）の smoke を
入れています（Tests の `motouriLightOilReduction 1000 = 3`）。

境界（正直な申告）:

- 区分（特約業者／元売業者）は **caller-established の Bool** で選択し（`true` = 特約業者、
  `false` = 元売業者）、Bool は率の選択にのみ使用して算術式には入れていません
  （`reductionRate` / `lightOilReductionForDealer`）。
- **軽油の数量・課税標準・該当性はすべて caller-established** とし、算出式には入れていません。
- 法第百四十四条の十四第三項の該当性、「政令で定める数量」の他条との関係、特約業者／
  元売業者の定義・判定、数量の算定基礎、軽油引取税の税額、端数処理の通達等は
  **NOT MODELLED**。
- Nat の割り算による切り捨ては本モデルの丸め規則であり、条文の端数処理を断定するものでは
  ありません。
- 原文の見出しは情報保持のため doc-comment にのみ記載し、計算には使っていません。

## 2. 追加した宣言一覧

`namespace JapanTaxLaw.LocalTaxLightOilQuantity`、`open JapanTaxLaw.TaxFinance`。

- 実装（`LocalTaxLightOilQuantity.lean`）:
  - `abbrev Quantity`（1）
  - **6 def**: `tokuteiReductionRate`, `motouriReductionRate`, `reductionRate`,
    `lightOilReduction`, `motouriLightOilReduction`, `lightOilReductionForDealer`
  - **13 定理**: positivity 4 本（`*_num_pos` / `*_den_pos`）、率選択 2 本
    （`reductionRate_true` / `reductionRate_false`）、exact 接続 7 本（各 `*_eq` /
    `*_eq_applyFloor` / `lightOilReductionForDealer_eq_applyFloor`）
  - smoke `example ... := by decide` を各 def に付与（境界 0/1/99/100、端数切り捨て、
    10 倍ガード、区分選択）
- 独立定式（`LocalTaxLightOilQuantitySpec.lean`）:
  - **3 `spec*` def**（`specLightOilReduction`, `specMotouriLightOilReduction`,
    `specLightOilReductionForDealer`）+ **`agreeLocalTaxLightOilQuantity : Bool`**（1）
  - points は kernel-decide、`agree*` は実装との `==` 一致を列挙有限点で確認（全称主張ではない）
- 退行テスト（`LocalTaxLightOilQuantityTests.lean`）: **kernel-decide smoke example のみ**、
  定理名・def は追加していません（境界 0/1/99/100、端数切り捨て 199/200/333/334/
  3333/3334、10 倍ガード 1000 → 3、区分選択、率パラメータ再確認）。

**def数: def/abbrev 11（実装 6 + spec 3 + agree 1 + Quantity 1）＋ 定理 13 ＝ 名前付き宣言 24。**

## 3. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。
**文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。**
各 needle は正規化テキスト（`re.sub(r"[\s\u3000]+", "", ...)`）上の連続部分そのもので、
担当範囲原文・pinned JSON の両方で出現回数 **1**（一意）、長さ 60〜130 文字、
**全角空白 U+3000 を含みません**。

```json{
  "law_id": "325CO0000000245",
  "kind": "file",
  "title": null,
  "needles": [
    "特約業者からの引取りに係る軽油については当該軽油の数量に百分の一を乗じて得た数量とし、元売業者からの引取りに係る軽油については当該軽油の数量に百分の〇・三を乗じて得た数量とする。",
    "法第百四十四条の十四第三項に規定する政令で定める数量は、特約業者からの引取りに係る軽油については当該軽油の数量に百分の一を乗じて得た数量とし、",
    "当該軽油の数量に百分の一を乗じて得た数量とし、元売業者からの引取りに係る軽油については当該軽油の数量に百分の〇・三を乗じて得た数量とする。"
  ]
}
```

## 4. 期待 literal 増分

- W-AE 担当分: 新規 check **3 needles** なので **+3**。
- `docs/PROGRESS.md` の監査 literal 総数はメインセッションが再確認して加算してください
  （起点値は本メモでは書きません）。

## 5. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.LocalTaxLightOilQuantity JapanTaxLaw.LocalTaxLightOilQuantitySpec JapanTaxLaw.LocalTaxLightOilQuantityTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド／CI／
  `run_python_gates.py` は実行していません）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WAE AxiomProbe.lean` を approved temp dir に作成し
  `lake env lean` で実行 → **削除済み**）:
  - 全 **24 名前付き宣言**（Quantity 1 + 実装 def 6 + 実装定理 13 + spec def 3 + agree 1）
    すべて `does not depend on any axioms`。
  - **`Classical.choice` 0 回 / `sorryAx` 0 回 / `propext` 0 回**（probe 出力を全文走査）。
- 原文逐語検証（担当範囲原文・pinned JSON を `re.sub(r"[\s\u3000]+", "", ...)` で正規化した
  文字列に対して Python の `.find()` と `count()`）: **3/3 FOUND、MISS 0 件**（§6）。

## 6. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

| # | needle 先頭 | 長さ | art.find | json.find | count(art/json) | U+3000 | 結果 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 特約業者からの引取りに…（両区分を包含） | 89 | 85 | 360210 | 1/1 | なし | FOUND |
| 2 | 法第百四十四条の十四第三項に…特約 1/100 | 71 | 57 | 360182 | 1/1 | なし | FOUND |
| 3 | 当該軽油の数量に百分の一…元売 〇・三 | 69 | 105 | 360230 | 1/1 | なし | FOUND |

- **FOUND 3 / MISS 0**。needle の長さは 69〜89 文字（すべて 60〜130 の範囲）、
  3 本すべて相互に異なることを確認。アンカーの勝手な変更・正規化・文字変換はしていません。
  原文の「〇・三」「特約業者」「元売業者」等の文字を一字も変えていません。

## 7. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数や監査 literal 総数はメインセッションが計算するため、ここでは書きません。

- **README.md**（地方税モジュール一覧の末尾付近に追加）:
  ```text
  JapanTaxLaw/LocalTaxLightOilQuantity.lean / -Spec.lean / -Tests.lean  # 地方税法施行令 第四十三条の十三（軽油の引取りの際減少すべき数量）：特約業者 ×1/100・元売業者 ×30/10000（百分の〇・三＝3/1000、10 倍過大バグ ガード付き）をモデル化・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  地方税法施行令 第四十三条の十三（LocalTaxLightOilQuantity.lean：特約業者＝数量×1/100、元売業者＝数量×30/10000＝3/1000、区分は caller-established Bool で率選択にのみ使用、数量・課税標準・該当性も caller-established、端数切り捨て、法 144条の14第3項の該当性・政令で定める数量の他条との関係・軽油引取税全体は NOT YET COVERED）
  ```

## 8. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.LocalTaxLightOilQuantity
import JapanTaxLaw.LocalTaxLightOilQuantitySpec
import JapanTaxLaw.LocalTaxLightOilQuantityTests
```

（W-AF / W-AG 他の 3 件ずつと併せてメインが行数を確認してください。
W-AE は `JapanTaxLaw.lean` を書き換えていません。）

## 9. 範囲・残ブロッカーの正直な申告（最終報告）

- **build**: 自作 3 モジュールのみ `lake build` 成功（5 jobs / warning なし）。全体ビルド・CI・
  `run_python_gates.py` は未実行です。
- **axiom**: 全 24 名前付き宣言が axiom-free、`Classical.choice` / `sorryAx` / `propext` なし
  （一時ファイルは削除済み）。
- **逐語**: FOUND 3 / MISS 0（担当範囲原文・pinned JSON の両方、出現回数 1、長さ 69〜89、
  U+3000 なし）。
- **def 数**: def/abbrev 11（実装 6 + spec 3 + agree 1 + Quantity 1）＋ 定理 13 ＝
  名前付き宣言 24。
- **STAGING**: 本ファイル `docs/STAGING_WAE.md` を作成済みです。
- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は第四十三条の十三の 2 区分（特約業者 1/100・元売業者 0.3/100）の数量減少式のみ。
  法第百四十四条の十四第三項の該当性、政令で定める数量の他条との関係、事業者区分の判定、
  軽油引取税の課税標準・税額等は NOT YET COVERED。
- 区分・数量・課税標準・該当性はすべて caller-established とし、Bool は算術式に入れていません。
- `agree*` は定数同士の `==` 一致確認であり、法的意味の等価証明ではありません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§3、+3）、`JapanTaxLaw.lean` への
  import 追加（§8）、README / PROGRESS の 1 行追記（§7）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-AE は実行していません）。
