import request from 'supertest';
import app from '../app';

describe('/api/timestamps', () => {
  it('should return the correct payload', async () => {
    const response = await request(app).get('/api/timestamps');
    expect(response.status).toBe(200);
    expect(response.type).toBe('application/json');
    expect(response.body).toEqual({
      message: "Automate all the things!",
      timestamp: 1529729125,
    });
  });
});