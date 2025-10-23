from flask import Flask, request, jsonify
app = Flask(__name__)
@app.route('/api/v1/order', methods=['POST'])
def order():
    data = request.json
    # simple mock: return accepted order with id
    return jsonify({'status':'accepted','order_id':'MOCK123','symbol':data.get('symbol')}), 200
if __name__ == '__main__':
    app.run(port=5001)
