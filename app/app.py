import streamlit as st
from pipeline.pipeline import AnimeRecommendationPipeline
from dotenv import load_dotenv




st.set_page_config(page_title="Anime Recommender", layout="wide")

load_dotenv() 

@st.cache_resource
def init_pipeline():
    return AnimeRecommendationPipeline() # initializing the class from pipeline.py


pipeline = init_pipeline() #class object

st.title("Anime Recommender System")

query = st.text_input("Enter your anime prefrences eg: A light hearted anime with school setting!!!")
if query:
    with st.spinner("Fetching Recommendations for you!!!"):
        response = pipeline.recommend(query)
        st.markdown("### Recommendations")
        st.write(response)
