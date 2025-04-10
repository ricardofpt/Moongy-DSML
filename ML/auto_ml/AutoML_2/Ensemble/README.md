# Summary of Ensemble

[<< Go back](../README.md)


## Ensemble structure
| Model             |   Weight |
|:------------------|---------:|
| 3_Default_Xgboost |        1 |

## Metric details
|           |    score |     threshold |
|:----------|---------:|--------------:|
| logloss   | 0.278057 | nan           |
| auc       | 0.930508 | nan           |
| f1        | 0.745307 |   0.369213    |
| accuracy  | 0.876276 |   0.464617    |
| precision | 1        |   0.996537    |
| recall    | 1        |   1.97124e-05 |
| mcc       | 0.659256 |   0.464617    |


## Metric details with threshold from accuracy metric
|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.278057 |  nan        |
| auc       | 0.930508 |  nan        |
| f1        | 0.738436 |    0.464617 |
| accuracy  | 0.876276 |    0.464617 |
| precision | 0.77929  |    0.464617 |
| recall    | 0.701652 |    0.464617 |
| mcc       | 0.659256 |    0.464617 |


## Confusion matrix (at threshold=0.464617)
|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             5291 |              373 |
| Labeled as 1 |              560 |             1317 |

## Learning curves
![Learning curves](learning_curves.png)
## Confusion Matrix

![Confusion Matrix](confusion_matrix.png)


## Normalized Confusion Matrix

![Normalized Confusion Matrix](confusion_matrix_normalized.png)


## ROC Curve

![ROC Curve](roc_curve.png)


## Kolmogorov-Smirnov Statistic

![Kolmogorov-Smirnov Statistic](ks_statistic.png)


## Precision-Recall Curve

![Precision-Recall Curve](precision_recall_curve.png)


## Calibration Curve

![Calibration Curve](calibration_curve_curve.png)


## Cumulative Gains Curve

![Cumulative Gains Curve](cumulative_gains_curve.png)


## Lift Curve

![Lift Curve](lift_curve.png)



[<< Go back](../README.md)
