# Normative unit — 332AC0000000026 art.66_9_4（課税済金額とみなす）

Unit: `NORM|87699445d5c1be70655ac88a59210fe09dcd5575c3f875be2dc166d9f13ce29e`

原文（pinned 別表セル, 9文字）:「課税済金額とみなす」

| id | content |
|---|---|
| H | 当該みなし規定は金額の数値を変えず、その金額に「課税済」の法的状態を与える。 |
| T | `lake build JapanTaxLaw.DeemedTaxedAmountTests`; `python scripts/ci/source_audit_deemed_tax_art24.py` |
| D | 数値保持・状態設定・冪等性をカーネルで証明。実装と独立仕様が字段ごとに対応。原文3検査 true。 |
| C | 対立解釈: みなしにより金額が増減すると読む → 原文「…金額とみなす」は状態の擬制であり数値変更を述べないため却下。算定基数は当該単位外。 |
| U | 算定基数・税率・他みなし規定との優先関係は NOT MODELLED。人間法的レビュー未実施。 |

当該擬制の作用のみをモデル化し、条全体の完成を主張しない。
