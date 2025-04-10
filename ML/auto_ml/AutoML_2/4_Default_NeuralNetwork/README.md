# Summary of 4_Default_NeuralNetwork

[<< Go back](../README.md)


## Neural Network
- **n_jobs**: -1
- **dense_1_size**: 32
- **dense_2_size**: 16
- **learning_rate**: 0.05
- **explain_level**: 2

## Validation
 - **validation_type**: split
 - **train_ratio**: 0.75
 - **shuffle**: True
 - **stratify**: True

## Optimized metric
logloss

## Training time

9.3 seconds

## Metric details
|           |    score |     threshold |
|:----------|---------:|--------------:|
| logloss   | 0.3364   | nan           |
| auc       | 0.908414 | nan           |
| f1        | 0.704193 |   0.336456    |
| accuracy  | 0.852539 |   0.504428    |
| precision | 0.984211 |   0.98663     |
| recall    | 1        |   2.55849e-18 |
| mcc       | 0.598414 |   0.385294    |


## Metric details with threshold from accuracy metric
|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.3364   |  nan        |
| auc       | 0.908414 |  nan        |
| f1        | 0.681558 |    0.504428 |
| accuracy  | 0.852539 |    0.504428 |
| precision | 0.736842 |    0.504428 |
| recall    | 0.63399  |    0.504428 |
| mcc       | 0.58912  |    0.504428 |


## Confusion matrix (at threshold=0.504428)
|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             5239 |              425 |
| Labeled as 1 |              687 |             1190 |

## Learning curves
![Learning curves](learning_curves.png)

## Permutation-based Importance
![Permutation-based Importance](permutation_importance.png)
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
