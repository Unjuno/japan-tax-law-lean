# STAGING WAN — 相続税法 art. 25 定期金給付契約の評価

## Transcription audit JSON fragment

```json
{
  "law_id": "325AC0000000073",
  "kind": "file",
  "title": null,
  "needles": [
    "第二十五条定期金給付契約（生命保険契約を除く。）で当該契約に関する権利を取得した時において定期金給付事由が発生していないものに関する権利の価額は",
    "一当該契約に解約返戻金を支払う旨の定めがない場合次に掲げる場合の区分に応じ、それぞれ次に定める金額に、百分の九十を乗じて得た金額",
    "当該契約に係る予定利率の複利による計算をして得た元利合計額",
    "二前号に掲げる場合以外の場合当該契約に関する権利を取得した時において当該契約を解約するとしたならば支払われるべき解約返戻金の金額"
  ]
}
```

## Integration

Integrator adds 3 imports to JapanTaxLaw.lean: JapanTaxLaw.InheritanceAnnuityValuation, -Spec, -Tests.

## Honest scope

Only the 90% multiplier (第1号) and the surrender-value branch (第2号) are modelled. Compound-interest basis and 予定利率 are caller-established. Not human legal review; all 3,438 L7 candidates remain unreviewed.
