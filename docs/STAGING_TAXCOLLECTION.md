# STAGING — 国税徴収法 art. 104の2

```json
{
  "law_id": "334AC0000000147",
  "kind": "file",
  "title": null,
  "needles": [
    "（次順位買受申込者の決定）第百四条の二徴収職員は、入札の方法により不動産、船舶、航空機、自動車、建設機械、小型船舶、債権又は電話加入権以外の無体財産権等",
    "最高価申込者の入札価額（以下この条において「最高入札価額」という。）に次ぐ高い価額（見積価額以上で、かつ、最高入札価額から公売保証金の額を控除した金額以上であるものに限る。",
    "による入札者（前条第二項の規定によりくじで最高価申込者を定めた場合には、当該最高価申込者以外の最高の価額の入札者とする。",
    "その者を次順位買受申込者として定めなければならない。"
  ]
}
```

## Integration

Add 3 imports to JapanTaxLaw.lean: TaxCollectionNextBid, -Spec, -Tests.

## Scope

Only the next-bid floor arithmetic (max of estimate and highest-minus-deposit) is modelled. Drawing lots, timing, and art.104(2) special case are caller-established. Not human legal review; all 3,438 L7 candidates remain unreviewed.
