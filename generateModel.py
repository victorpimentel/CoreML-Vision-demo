import turicreate as tc

data = tc.image_analysis.load_images(
    './Food',
    with_path=True
)

data['label'] = data['path'].apply(
    lambda path: path.split('/')[-2]
)

print(data.groupby('label', [tc.aggregate.COUNT]))

data.save('OperacionBikini.sframe')

train_data, test_data = data.random_split(0.9)

model = tc.image_classifier.create(
    train_data,
    target='label',
    max_iterations=50
)

predictions = model.predict(test_data)

metrics = model.evaluate(test_data)

print(metrics)

model.save('OperacionBikini.model')

model.export_coreml('OperacionBikini.mlmodel')


