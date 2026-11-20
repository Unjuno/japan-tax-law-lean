# Normative unit — 340AC0000000034 art.24（合併（適格合併を除く。））

Unit: `NORM|c95fe5b099a7bac3397cf63b6b2db5bce1e182c2201fe7c7830ca9aeeff4b423`

原文（pinned, 12文字）:「合併（適格合併を除く。）」

| id | content |
|---|---|
| H | 本条の対象は合併のうち適格合併を除外したものであり、両判定は独立な caller-established 入力である。 |
| T | `lake build JapanTaxLaw.MergerExceptionArt24Tests`; `python scripts/ci/source_audit_merger_art24.py` |
| D | 実装と独立仕様がカーネル同値。通常合併(true,false)は対象、適格合併(true,true)は対象外、合併でない場合は対象外。原文3検査 true。 |
| C | 対立解釈: 「適格合併を除く」を「合併でないものも含む」と読む → 括弧が合併の内側の例外を示すため却下。適格合併の要件は当該単位外。 |
| U | 適格合併の定義・要件・手続・効果は NOT MODELLED。人間法的レビュー未実施。 |

当該例外規定の作用範囲のみをモデル化し、条全体の完成を主張しない。
