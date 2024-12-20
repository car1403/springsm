import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [message, setMessage] = useState("");
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api_v1/test', {
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
        });
        setMessage(response.data);
        setError(null);
      } catch (err) {
        setError('서버 연결에 실패했습니다.');
        console.error("Error:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="App">
      <h1>React와 Spring Boot 통신 테스트</h1>
      {loading ? (
        <p>로딩 중...</p>
      ) : error ? (
        <p style={{ color: 'red' }}>{error}</p>
      ) : (
        <p>서버 메시지: {message}</p>
      )}
    </div>
  );
}

export default App;