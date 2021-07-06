import streamlit as st
import pickle
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
def predict(message):
 model=load_model('movie_sent.h5')
 with open('tokenizer55.pickle', 'rb') as handle:
     tokenizer = pickle.load(handle)
     x_1 = tokenizer.texts_to_sequences([message])
     x_1 = pad_sequences(x_1, maxlen=500)
     predictions = model.predict(x_1)[0][0]
     return predictions
st.title("Analisis Sentimen dengan Model RNN Tipe LSTM")
message = st.text_area("Masukkan review di text box berikut ini."," ")
if st.button("Analisis"):
 with st.spinner('Menganalisis teks review'):
     prediction=predict(message)
     if prediction > 0.6:
         st.success("Review tersebut memiliki polaritas sentimen positif dengan akurasi sebesar {:.2f} ".format(prediction))
         st.balloons()
     else:
         st.error("Review tersebut memiliki polaritas sentimen negatif dengan akurasi sebesar {:.2f} ".format(1-prediction))
