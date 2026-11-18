# STAGING ANDEATH — 相続税法 art. 24(2)（死亡による給付終了の特例）bounded L4 モデル

## スコープ

- 担当: 相続税法 art. 24(2)（死亡による給付終了の特例）を bounded L4 モデル化。art. 24(5) は下記のとおり NOT MODELLED。
- pinned: law_id `325AC0000000073` / revision `325AC0000000073_20260401_506AC0000000008` / enforcement `2026-04-01`。
- 原文: `inherit_art24.txt`（担当範囲・正規化済み・UTF-8・1583文字）。

## def 一覧

名前空間 `JapanTaxLaw.InheritanceAnnuityDeathException`（`Money = Nat`、import `JapanTaxLaw.TaxFinance`）:

| def | 意味 |
| --- | --- |
| `deathExceptionValue holderAmount thirdPartyAmount` | 中核の加算構造 = `holderAmount + thirdPartyAmount`（権利者が受け／受けるべき金額 ＋ 遺族その他の第三者が受け／受けるべき金額）。 |
| `deathExceptionSelected thirdPartyBenefit holderAmount thirdPartyAmount` | 第三者給付の有無（caller-established Bool）で、加算式を採るか権利者分のみを採るかを選択。 |
| `deathExceptionApplies diedBeforeDeadline benefitEndedByDeath` | 特例の適用判定。死亡時期（申告書提出期限まで）・給付終了の事実は caller-established Bool。 |
| `art24_2Value diedBeforeDeadline benefitEndedByDeath thirdPartyBenefit holderAmount thirdPartyAmount normalValue` | 特例値と通常価額（第3号、caller-established Money）の選択を含む最上位定式。 |

Spec（独立定式、実装の helper を呼ばない）: `specDeathExceptionValue` / `specDeathExceptionSelected` / `specDeathExceptionApplies` / `specArt24_2Value`、および比較用 `agreeDeathExceptionValue` / `agreeDeathExceptionSelected` / `agreeArt24_2Value`（すべて `by decide`）。

- 本モデル def 数 = **4**（Spec 独立定式 4、agree* 3 を除く）。
- Bool は金額式に入れず選択にのみ使用する。金額（権利者分・第三者分・通常価額）はすべて caller-established。丸めなし（加算のみ）。

## 5項 NOT MODELLED の理由

原文 5 項「前各項の規定は、第三条第一項第六号に規定する定期金に関する権利で契約に基づくもの以外のものの価額の評価について準用する。」は、自ら評価方法を定めるのではなく、前各項（1〜4 項）を「契約に基づくもの以外の定期金に関する権利」へ参照させる**法的参照規定（準用）**である。数式・計算手順を一切含まず、追加すべき算術モデルが存在しないため、本 bounded L4 モデルでは **NOT MODELLED** とする。needle は原文保持の証拠として下記 JSON 断片に残すが、対応する実装 def は作らない。第三条第一項第六号の権利の成立・該当性判定も射程外（caller-established）。

## Transcription audit JSON fragment

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "その目的とされた者が当該契約に関する権利を取得した時後第二十七条第一項又は第二十八条第一項に規定する申告書の提出期限までに死亡し、その死亡によりその給付が終了した場合においては",
    "同号の規定にかかわらず、その権利者が当該契約に関する権利を取得した時後給付を受け、又は受けるべき金額（当該権利者の遺族その他の第三者が当該権利者の死亡により給付を受ける場合には、その給付を受け、又は受けるべき金額を含む。）による。",
    "５前各項の規定は、第三条第一項第六号に規定する定期金に関する権利で契約に基づくもの以外のものの価額の評価について準用する。"
  ]
}
```

needle 長: 88 / 115 / 61 文字（60〜130 文字の範囲内）。いずれも全角空白 U+3000 を含まない。原文テキスト（1583 文字）および pinned JSON `law_full_text` を再帰的に連結・正規化（U+3000 / 空白 / 改行除去）したテキストに対し、3 本すべて `.find() >= 0`（逐語一致、MISS なし）。提供テキスト全体（1583 文字）も正規化 JSON テキストの部分文字列であることを確認した。

## 検証結果

1. `lake build JapanTaxLaw.InheritanceAnnuityDeathException JapanTaxLaw.InheritanceAnnuityDeathExceptionSpec JapanTaxLaw.InheritanceAnnuityDeathExceptionTests` — **成功**（5 jobs）。全体ビルド / CI / run_python_gates は未実施。
2. `python scripts/ci/check_no_sorry.py` — `no forbidden placeholder proofs found in tracked Lean sources`。
3. 一時 Lean ファイルで `#print axioms` を 22 名（実装 def 4 + theorem 8 + Spec 独立定式 def 4 + agree def 3 + agree theorem 3）に対して実行 — すべて `does not depend on any axioms`。`Classical.choice` / `sorryAx` はもちろん、`propext` すら依存なし。一時ファイルは削除済み。
4. needle 逐語検証 — 上記 3 本すべて pinned JSON 正規化テキストに `.find()` Hit。MISS なし（詳細は前節）。

## Integration（3 import 明示）

Integrator が `JapanTaxLaw.lean` に以下の 3 行を追加する（本ワーカーは追加しない）:

```
import JapanTaxLaw.InheritanceAnnuityDeathException
import JapanTaxLaw.InheritanceAnnuityDeathExceptionSpec
import JapanTaxLaw.InheritanceAnnuityDeathExceptionTests
```

## README / PROGRESS 1行文案

`相続税法 art.24(2) 死亡による給付終了の特例: 権利者分＋遺族等分の加算構造を bounded L4 モデル化（art.24(5) 準用は NOT MODELLED）。`

## Honest scope

完成・網羅を主張しない。加算構造と選択ロジックのみの bounded モデルであり、第 3 号の終身定期金の算出（予定利率・複利年金現価率・余命年数）、死亡時期／給付終了／第三者該当性の事実認定はすべて caller-established とする。人間の法務レビューではない。L7 候補 3,438 件は unreviewed のまま。既存 `InheritanceAnnuityValuation*` / `InheritanceAnnuityMaxima*` / `InheritanceAnnuityMinMax*` および `data/*`、L7 CSV は変更していない。
